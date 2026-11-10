function Update()
    local function ToMinutes(time)
        local h, m = string.match(time, "(%d+):(%d+)")
        return tonumber(h) * 60 + tonumber(m)
    end

    local current = os.date("*t")
    local now = current.hour * 60 + current.min

    local sunrise = ToMinutes(SKIN:GetVariable("_Rise"))
    local sunset = ToMinutes(SKIN:GetVariable("_Set"))

    if now >= sunrise and now < sunset then
        SKIN:Bang("!ShowMeterGroup", "Sunset")
        SKIN:Bang("!HideMeterGroup", "Sunrise")
    else
        SKIN:Bang("!ShowMeterGroup", "Sunrise")
        SKIN:Bang("!HideMeterGroup", "Sunset")
    end
end