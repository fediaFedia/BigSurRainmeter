-- Lua program calculating the sunrise and sunset for
-- a given date and location(latitude,longitude)
-- Note, twilight calculation gives insufficient accuracy of results

-- Elias Karakoulakis, 2010
-- adaptation from C code from 

-- Jarmo Lammi 1999 - 2001
-- Last update July 21st, 2001
-- http://www.sci.fi/~benefon/stuff.html


function Initialize()

	sin,cos,tan = math.sin, math.cos, math.tan
	asin,acos,atan,atan2 = math.asin, math.acos, math.atan, math.atan2
	pi = math.pi
	degs=0
	rads=0
	L,g,daylen=0,0,0
	SunDia = 0.53     -- Sunradius degrees
	AirRefr = 34/60 -- athmospheric refraction degrees 

	MeasureDay = SKIN:GetMeasure('MeasureDay')
	MeasureMonth = SKIN:GetMeasure('MeasureMonth')
	MeasureYear = SKIN:GetMeasure('MeasureYear')

	_day=tonumber(MeasureDay:GetStringValue())
	_month=tonumber(MeasureMonth:GetStringValue())
	_year=tonumber(MeasureYear:GetStringValue())
	_timezone = (getTimeOffset()/3600)
	_latitude = tonumber(SKIN:GetVariable('Latitude'))
	_longitude = tonumber(SKIN:GetVariable('Longitude'))
	OldDay, OldMonth, OldYear  = _day, _month, _year

	rscalc({ day=_day, month=_month, year= _year } , {latit = _latitude,	longit = _longitude,	tzone = _timezone} )

end


function Update()

	_day=tonumber(MeasureDay:GetStringValue())
	_month=tonumber(MeasureMonth:GetStringValue())
	_year=tonumber(MeasureYear:GetStringValue())
	_timezone = (getTimeOffset()/3600)

	if _day~=OldDay or _month~=OldMonth or _year~=OldYear then
		rscalc({ day=_day, month=_month, year= _year } , {latit = _latitude,	longit = _longitude,	tzone = _timezone} )
		OldDay, OldMonth, OldYear  = _day, _month, _year
	end

end


--   Get the days to J2000
--   h is UT in decimal hours
--   FNday only works between 1901 to 2099 - see Meeus chapter 7
function FNday (y,  m,  d,  h)

	luku = - 7 * (y + (m + 9)/12)/4 + 275*m/9 + d
	luku = luku + y*367
	return luku - 730531.5 + h/24

end


--   the function below returns an angle in the range
--   0 to 2*pi
function FNrange (x)

	local b = 0.5*x / pi
-- was:	local a = 2*pi * (b - (long)(b))
	local a = 2*pi * (b - math.floor(b))
	if (a < 0) then a = 2*pi + a end
	return a

end


-- Calculating the hourangle
function f0(lat, declin)

	local fo,dfo
	-- Correction: different sign at S HS
	dfo = rads*(0.5*SunDia + AirRefr)
	if (lat < 0) then dfo = -dfo end
	fo = tan(declin + dfo) * tan(lat*rads)
	if (fo>0.99999) then fo=1 end -- to avoid overflow 
	fo = asin(fo) + pi/2
	return fo

end


-- Calculating the hourangle for twilight times
function f1(lat,  declin) 

	local fi,df1
	-- Correction: different sign at S HS
	df1 = rads * 6
	if (lat < 0) then df1 = -df1 end
	fi = tan(declin + df1) * tan(lat*rads)
	if (fi>0.99999) then fi=1 end  -- to avoid overflow 
	fi = asin(fi) + pi/2
	return fi

end


--   Find the ecliptic longitude of the Sun
function FNsun (d) 

	--   mean longitude of the Sun
	L = FNrange(280.461 * rads + .9856474 * rads * d)
	--   mean anomaly of the Sun
	g = FNrange(357.528 * rads + .9856003 * rads * d)
	--   Ecliptic longitude of the Sun
	return FNrange(L + 1.915 * rads * sin(g) + .02 * rads * sin(2 * g))

end


function rscalc(when, where)

	local y,m,d,h,latit,longit
	local inlat,inlon,intz
	local tzone,d2k,lambda
	local obliq,alpha,delta,LL,equation,ha,hb,twx
	local twam,altmax,noont,twpm
	settm,riset=0,0
	
	degs = 180/pi
	rads = pi/180
	h = 12
	y,m,d = when.year, when.month, when.day
	latit, longit, tzone = where.latit, where.longit, where.tzone

	d2k = FNday(y, m, d, h)

	--   Use FNsun to find the ecliptic longitude of the
	--   Sun
	lambda = FNsun(d2k)

	--   Obliquity of the ecliptic
	obliq = 23.439 * rads - .0000004 * rads * d2k

	--   Find the RA and DEC of the Sun
	alpha = atan2(cos(obliq) * sin(lambda), cos(lambda))
	delta = asin(sin(obliq) * sin(lambda))

	-- Find the Equation of Time
	-- in minutes
	-- Correction suggested by David Smith
	LL = L - alpha
	if (L < pi) then LL = LL + 2*pi end
	equation = 1440 * (1 - LL / pi/2)
	ha = f0(latit,delta)
	hb = f1(latit,delta)
	twx = hb - ha	-- length of twilight in radians
	twx = 12*twx/pi		-- length of twilight in hours

	-- Conversion of angle to hours and minutes //
	daylen = degs*ha/7.5
	if (daylen<0.0001) then daylen = 0 end
	-- arctic winter     //
	riset = 12 - 12 * ha/pi + tzone - longit/15 + equation/60
	settm = 12 + 12 * ha/pi + tzone - longit/15 + equation/60
	noont = riset + 12 * ha/pi
	altmax = 90 + delta * degs - latit
	-- Correction for S HS suggested by David Smith
	-- to express altitude as degrees from the N horizon
	if (latit < delta * degs) then altmax = 180 - altmax end

	twam = riset - twx	-- morning twilight begin
	twpm = settm + twx	-- evening twilight end
	riseminutes = round(riset * 60)
	setminutes = round(settm * 60)

	if (riset > 24) then riset = riset-24 end
	if (settm > 24) then settm = settm-24 end

	SKIN:Bang('!SetVariable _Rise "'..ToTime(Hours(riset),Minutes(riset))..'"')
	SKIN:Bang('!SetVariable _RiseMinutes "'..riseminutes..'"')
	SKIN:Bang('!SetVariable _Set "'..ToTime(Hours(settm),Minutes(settm))..'"')
	SKIN:Bang('!SetVariable _SetMinutes "'..setminutes..'"')
	SKIN:Bang('!SetVariable _Noon "'..ToTime(Hours(noont),Minutes(noont))..'"')
	if Minutes(daylen)>=60 then
		SKIN:Bang('!SetVariable _DayLength "'..(Hours(daylen)+1)..' H   0 M"')
	else
		SKIN:Bang('!SetVariable _DayLength "'..Hours(daylen)..' H  '..Minutes(daylen)..' M"')
	end
	SKIN:Bang('!SetVariable _MaxAltitude "'..string.format('%.2f',altmax)..'"')
	SKIN:Bang('!SetVariable _Declination "'..string.format('%.2f',(delta * degs))..'"')

end


	function round(n)
	    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
	end



function ToTime(HH,MM)

	if tonumber(SKIN:GetVariable('12H'))>0 then --12H
		if MM>=60 then
			return AMPMFormat((HH+1),string.format('%02d','0'))
		else
			return AMPMFormat((HH),string.format('%02d',MM))
		end
	else -- 24H
		if MM>=60 then
			return tostring((HH+1)..':00')
		else
			return tostring(HH..':'..string.format('%02d',MM))
		end
	end

end


function AMPMFormat(HH,MM)

	if tonumber(HH) <= 11 then
		return(HH..':'..MM..' AM')
	else  
		if tonumber(HH)==12 then
			return(HH..':'..MM..' PM')
		else  -- then HH must be in interval [13-23]
			return((tonumber(HH)-12)..':'..MM..' PM')
		end
	end

end


function Hours(DecimalNumber)

	return math.floor(DecimalNumber)

end


function Minutes(DecimalNumber)

	return round(60*(DecimalNumber-math.floor(DecimalNumber)))

end


function round(num) 

	if num >= 0 then
		return math.floor(num+.5) 
	else
		return math.ceil(num-.5)
	end

end


function getTimeOffset() -- from os - Thanks Mordasius

	local now = os.time()
	local utcdate   = os.date("!*t", now)
	local localdate = os.date("*t", now)
	localdate.isdst = false 

	return os.difftime(os.time(localdate), os.time(utcdate))
	
end
