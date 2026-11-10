local nextSwitch = 0

function Initialize()
	SKIN:Bang('!Log', 'Scroll initialized')
    local minutes = tonumber(SKIN:GetVariable('AutoSwitchMinutes')) or 0

    if minutes > 0 then
        nextSwitch = os.time() + (minutes * 60)
    end
end

function Update()
    if nextSwitch > 0 and os.time() >= nextSwitch then
        Scroll(-1)

        local minutes = tonumber(SKIN:GetVariable('AutoSwitchMinutes')) or 0
        nextSwitch = minutes > 0 and os.time() + (minutes * 60) or 0
    end

    return 0
end



function Scroll(direction)
	
    local folder = SKIN:GetVariable('WidgetFolder')

    local currentFile = SKIN:GetVariable('CURRENTFILE') or ''
    local currentName = currentFile:gsub('%.ini$', '')
	SKIN:Bang('!Log', folder)
    -- Find the actual current index using the running INI filename
    local current = nil
    local total = 0

    for i = 1, 99 do
        local name = SKIN:GetVariable('Item' .. i)

        if name and name ~= '' then
            total = i

            if name:lower() == currentName:lower() then
                current = i
            end
        end
    end

    -- Fallback if the current filename isn't in the item list
    if not current then
        current = tonumber(SKIN:GetVariable('CurrentItem')) or 1
    end

    if total == 0 then return end

    -- Search in the requested direction
    for step = 1, total do

        local nextItem = ((current - 1 + direction * step) % total) + 1

        local name = SKIN:GetVariable('Item' .. nextItem)
        local enabled = SKIN:GetVariable('Item' .. nextItem .. 'Enabled')

        if name and name ~= '' and enabled == '1' then

            -- Never activate the currently running widget
            if name:lower() == currentName:lower() then

            end

            -- Update in-memory variable
            SKIN:Bang(
                '!SetVariable',
                'CurrentItem',
                tostring(nextItem)
            )

            -- Persist to shared UserVariables.inc
            SKIN:Bang(
                '!WriteKeyValue',
                'Variables',
                'CurrentItem',
                tostring(nextItem),
                '#@#UserVariables.inc'
            )

            -- Activate destination
            SKIN:Bang(
                '!ActivateConfig',
                folder,
                name .. '.ini'
            )

            -- Reset automatic rotation timer
            local minutes = tonumber(
                SKIN:GetVariable('AutoSwitchMinutes')
            ) or 0

            nextSwitch = minutes > 0
                and os.time() + minutes * 60
                or 0

            return
        end

    end

end