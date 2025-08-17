
PROPERTIES = {year=0, month=0, day=0, hour=0, min=0, sec=0, fintext=""}

function Initialize()

	RELEASEDATE = {}
	setmetatable(RELEASEDATE, getmetatable(PROPERTIES))
	for k,v in pairs(PROPERTIES) do
		if k ~= fintext then
			RELEASEDATE[k] = v
		end
	end
	RELEASEDATE.isdst = true

	RELEASETEXT = PROPERTIES.fintext or ""

end

function GetTimeLeft()
	local dif = os.time(RELEASEDATE) - os.time()
	local timeleft = {
		[1] = math.floor(dif/60/60/24),	--day

	}

	local text = {}
	for i=1, #timeleft do
		if i == 1 then
			if timeleft[i] > 0 then
				table.insert(text,timeleft[i])
			end
		else
			table.insert(text,timeleft[i])
		end
	end

	if dif <= 0 then
		text = RELEASETEXT
	else
		text = table.concat(text,"")
	end

	return tostring(text)
end

function Update()
end

function GetStringValue()

	return GetTimeLeft()

end