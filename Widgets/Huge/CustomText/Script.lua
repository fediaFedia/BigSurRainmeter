function Update()
    local text = SKIN:GetVariable('customText') or ''
    local length = string.len(text)

    local maxSize = 64
    local minSize = 10
    local maxLength = 100

    local fontSize = math.max(minSize, maxSize - (length / maxLength) * (maxSize - minSize))

    return fontSize
end