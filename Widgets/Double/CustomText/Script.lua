function Update()
    local text = SKIN:GetVariable('customText') or ''
    local length = string.len(text)

    local maxSize = 34
    local minSize = 20
    local maxLength = 50

    local fontSize = math.max(minSize, maxSize - (length / maxLength) * (maxSize - minSize))

    return fontSize
end