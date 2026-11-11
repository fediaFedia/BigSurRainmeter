-- Rainmeter-native widget arranger. No external executable or Lua modules required.

local TYPE_SIZES = {
    Mini    = { w = 91,  h = 91 },
    Regular = { w = 182, h = 189 },
    Double  = { w = 364, h = 189 },
    Huge    = { w = 364, h = 380 },
}

local TYPE_ORDER = { Huge = 1, Double = 2, Regular = 3, Mini = 4 }

local function option(name, default)
    local value = SELF:GetOption(name, tostring(default))
    local n = tonumber(value)
    if n == nil then return default end
    return n
end

local function round(n)
    return math.floor(n + 0.5)
end

local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function detectType(config)
    -- Match a complete path segment, not a substring in a skin's name.
    for kind, _ in pairs(TYPE_SIZES) do
        local pattern = "\\" .. kind .. "\\"
        local lower = "\\" .. config:lower() .. "\\"
        if lower:find(pattern:lower(), 1, true) then
            return kind
        end
    end
    return nil
end

local function readActiveWidgets()
    local settingsPath = SKIN:GetVariable("SETTINGSPATH", "")
    if settingsPath == "" then
        return nil, "Rainmeter did not provide SETTINGSPATH."
    end

    local sep = (settingsPath:find("/", 1, true) and not settingsPath:find("\\", 1, true)) and "/" or "\\"
    if settingsPath:sub(-1) ~= "\\" and settingsPath:sub(-1) ~= "/" then
        settingsPath = settingsPath .. sep
    end
	utf16BomHandler= dofile(SKIN:MakePathAbsolute("@Resources\\utf16BomHandler.lua"))
	filepath= SKIN:GetVariable('SETTINGSPATH')..'Rainmeter.ini'
	content, encoding= utf16BomHandler.read(filepath)
	labelsPadding = SKIN:GetVariable("Labels", "0")
    local configs, err = content
	print("[read] Read: " .. tostring(configs))	
    if not configs then
        return nil, "Could not read Rainmeter.ini: " .. tostring(err)
    end

    local widgets, seen = {}, {}
    local section, active = nil, false

    local function finishSection()
        if section and active and not seen[section] then
            local kind = detectType(section)
            if kind then
                seen[section] = true
                local size = TYPE_SIZES[kind]
                widgets[#widgets + 1] = {
                    config = section,
                    kind = kind,
                    w = size.w,
                    h = size.h - (labelsPadding * 5),
                }
            end
        end
    end


    for line in (content .. "\n"):gmatch("(.-)\n") do
        line = trim(line)
        local newSection = line:match("^%[([^%]]+)%]$")
        if newSection then
            finishSection()
            section, active = newSection, false
        elseif section then
            local key, value = line:match("^([^=]+)=(.*)$")
            if key and trim(key):lower() == "active" then
                active = trim(value) >= "1"
            end
        end
    end



    finishSection()

    table.sort(widgets, function(a, b) return a.config:lower() < b.config:lower() end)
    return widgets
end

local function splitFreeRectangles(freeRects, used)
    local result = {}

    for _, free in ipairs(freeRects) do
        local intersects = not (
            used.x >= free.x + free.w or
            used.x + used.w <= free.x or
            used.y >= free.y + free.h or
            used.y + used.h <= free.y
        )

        if not intersects then
            result[#result + 1] = free
        else
            if used.x > free.x then
                result[#result + 1] = {
                    x = free.x, y = free.y, w = used.x - free.x, h = free.h
                }
            end
            if used.x + used.w < free.x + free.w then
                result[#result + 1] = {
                    x = used.x + used.w, y = free.y,
                    w = free.x + free.w - (used.x + used.w), h = free.h
                }
            end
            if used.y > free.y then
                result[#result + 1] = {
                    x = free.x, y = free.y, w = free.w, h = used.y - free.y
                }
            end
            if used.y + used.h < free.y + free.h then
                result[#result + 1] = {
                    x = free.x, y = used.y + used.h,
                    w = free.w, h = free.y + free.h - (used.y + used.h)
                }
            end
        end
    end

    -- Remove zero-sized rectangles and rectangles fully contained by another.
    local pruned = {}
    for i = 1, #result do
        local a = result[i]
        if a.w > 0 and a.h > 0 then
            local contained = false
            for j = 1, #result do
                if i ~= j then
                    local b = result[j]
                    if a.x >= b.x and a.y >= b.y and
                       a.x + a.w <= b.x + b.w and
                       a.y + a.h <= b.y + b.h then
                        contained = true
                        break
                    end
                end
            end
            if not contained then pruned[#pruned + 1] = a end
        end
    end
    return pruned
end

local function placeOne(freeRects, widget)
    local bestIndex, bestShort, bestLong, bestY, bestX = nil, math.huge, math.huge, math.huge, math.huge

    for i, free in ipairs(freeRects) do
        if widget.w <= free.w and widget.h <= free.h then
            local leftoverW = free.w - widget.w
            local leftoverH = free.h - widget.h
            local shortSide = math.min(leftoverW, leftoverH)
            local longSide = math.max(leftoverW, leftoverH)

            if shortSide < bestShort or
               (shortSide == bestShort and longSide < bestLong) or
               (shortSide == bestShort and longSide == bestLong and free.y < bestY) or
               (shortSide == bestShort and longSide == bestLong and free.y == bestY and free.x < bestX) then
                bestIndex, bestShort, bestLong = i, shortSide, longSide
                bestY, bestX = free.y, free.x
            end
        end
    end

    if not bestIndex then return nil end
    local free = freeRects[bestIndex]
    local placed = {
        config = widget.config, kind = widget.kind,
        x = free.x, y = free.y, w = widget.w, h = widget.h
    }
    return placed, splitFreeRectangles(freeRects, placed)
end

local function makeOrders(widgets)
    local orders = {}

    local function add(compare)
        local copy = {}
        for i, w in ipairs(widgets) do copy[i] = w end
        table.sort(copy, compare)
        orders[#orders + 1] = copy
    end

    add(function(a, b)
        local aa, bb = a.w * a.h, b.w * b.h
        if aa ~= bb then return aa > bb end
        if a.h ~= b.h then return a.h > b.h end
        return a.config:lower() < b.config:lower()
    end)

    add(function(a, b)
        if a.h ~= b.h then return a.h > b.h end
        if a.w ~= b.w then return a.w > b.w end
        return a.config:lower() < b.config:lower()
    end)

    add(function(a, b)
        if a.w ~= b.w then return a.w > b.w end
        if a.h ~= b.h then return a.h > b.h end
        return a.config:lower() < b.config:lower()
    end)

    add(function(a, b)
        if TYPE_ORDER[a.kind] ~= TYPE_ORDER[b.kind] then
            return TYPE_ORDER[a.kind] < TYPE_ORDER[b.kind]
        end
        if a.h ~= b.h then return a.h > b.h end
        return a.config:lower() < b.config:lower()
    end)

    return orders
end

local function pack(widgets, areaW, areaH)
    local best = nil

    for _, order in ipairs(makeOrders(widgets)) do
        local freeRects = { { x = 0, y = 0, w = areaW, h = areaH } }
        local placed, unplaced = {}, {}

        for _, widget in ipairs(order) do
            local p, updatedFree = placeOne(freeRects, widget)
            if p then
                placed[#placed + 1] = p
                freeRects = updatedFree
            else
                unplaced[#unplaced + 1] = widget
            end
        end

        local maxX, maxY = 0, 0
        for _, p in ipairs(placed) do
            maxX = math.max(maxX, p.x + p.w)
            maxY = math.max(maxY, p.y + p.h)
        end

        -- Prefer fitting more widgets, then the shortest/most compact result.
        local candidate = {
            placed = placed, unplaced = unplaced,
            maxX = maxX, maxY = maxY,
            scoreArea = maxX * maxY
        }

        if not best or #candidate.placed > #best.placed or
           (#candidate.placed == #best.placed and candidate.maxY < best.maxY) or
           (#candidate.placed == #best.placed and candidate.maxY == best.maxY and candidate.maxX < best.maxX) or
           (#candidate.placed == #best.placed and candidate.maxY == best.maxY and
            candidate.maxX == best.maxX and candidate.scoreArea < best.scoreArea) then
            best = candidate
        end
    end

    return best
end

function Arrange()
    local widgets, readError = readActiveWidgets()
    if not widgets then
        print("[GridAlign] ERROR: " .. readError)
        return
    end

    if #widgets == 0 then
        print("[GridAlign] No active Regular/Double/Mini/Huge widgets found.")
        return
    end

    local scale = option("Scale", 1)
    if scale <= 0 then scale = 1 end
	
	local sidebar = option("Sidebar", 2)
    if sidebar <= 0 then sidebar = 2 end
	
    
    local startY = 0 + 40
    local screenW = round(option("ScreenWidth", 0)) - 20
	local startX = screenW - (sidebar * 182 * scale)
    local screenH = round(option("ScreenHeight", 0)) * 0.93
    local columns = math.floor(option("Columns", 0))

    if screenW <= 0 or screenH <= 0 then
        print("[GridAlign] ERROR: ScreenWidth/ScreenHeight are unavailable. Check the controller INI variables.")
        return
    end

    -- Scale widget dimensions once, using the same factor as the start position.
    for _, w in ipairs(widgets) do
        w.w = round(w.w * scale)
        w.h = round(w.h * scale)
    end

    local availableW = screenW - startX
    local availableH = screenH - startY

    if columns > 0 then
        columns = math.max(1, math.min(4, columns))
        -- A 2-column layout must still accommodate the real 364px Double/Huge width.
        local columnWidth = round(181 * scale)
        local width = columns * columnWidth
        if columns >= 2 then width = width + round(2 * scale) end
        availableW = math.min(availableW, width)
    end

    if availableW <= 0 or availableH <= 0 then
        print("[GridAlign] ERROR: Starting coordinate leaves no usable screen area.")
        return
    end

    local result = pack(widgets, availableW, availableH)
    if not result then
        print("[GridAlign] ERROR: Packing failed.")
        return
    end

    -- Move only widgets that fit. Anything that cannot fit remains where it was.
    table.sort(result.placed, function(a, b)
        if a.y ~= b.y then return a.y < b.y end
        if a.x ~= b.x then return a.x < b.x end
        return a.config:lower() < b.config:lower()
    end)

    for _, p in ipairs(result.placed) do
        local x = startX + p.x
        local y = startY + p.y
        SKIN:Bang("!Move", tostring(x), tostring(y), p.config)
        print(string.format("[GridAlign] %s (%s) -> %d, %d", p.config, p.kind, x, y))
    end

    print(string.format(
        "[GridAlign] Finished: %d/%d placed; used area %dx%d; scale %.3f; columns %s.",
        #result.placed, #widgets, result.maxX, result.maxY, scale,
        columns == 0 and "Auto" or tostring(columns)
    ))

    if #result.unplaced > 0 then
        for _, w in ipairs(result.unplaced) do
            print("[GridAlign] NOT MOVED (no room): " .. w.config)
        end
    end
end



