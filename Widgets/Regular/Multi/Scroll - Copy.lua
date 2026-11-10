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


function GetEnabledItems()
    local items = {}

    for i = 1, 9 do
        local name = SKIN:GetVariable('Item' .. i)

        if name and name ~= '' then
            local disabled = SKIN:GetVariable(name .. 'Disabled')

            if disabled ~= '1' then
                table.insert(items, i)
            end
        end
    end

    return items
end

function Scroll(direction)

    local current = tonumber(SKIN:GetVariable('CurrentItem')) or 1

    local folder = SKIN:GetVariable('WidgetFolder')
    local total = 0

    -- Find the highest configured item
    for i = 1, 99 do
        local name = SKIN:GetVariable('Item' .. i)

        if name and name ~= '' then
            total = i
        end
    end

    if total == 0 then return end

    -- Search for the next enabled widget
    for step = 1, total do

        local nextItem = ((current - 1 + direction * step) % total) + 1

        local name = SKIN:GetVariable('Item' .. nextItem)
        local enabled = SKIN:GetVariable('Item' .. nextItem .. 'Enabled')

        -- Only consider configured and enabled widgets
        if name and name ~= '' and enabled == '1' then

            -- Never activate the currently selected widget
            if nextItem == current then
                return
            end

            -- Update current skin
			SKIN:Bang('!SetVariable', 'CurrentItem', tostring(nextItem))

			-- Persist shared index
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