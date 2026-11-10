[WidgetsE]
Meter=String
MeterStyle=Side
Text=#Widgets#
Hidden=0
Y=(65)*#scaledpi#
x=(25)*#scaledpi#




[block]
w=(65)*#scaledpi#
h=(65)*#scaledpi#
X=R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Mini\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\Mini\#DarkMode#\#currentsection#.png
MouseActionCursor=1



[Top]
FontColor=#textcolor2#,140
FontFace=#ThemeFont#
InlineSetting=#InlineShadow#
FontSize=(12)*#scaledpi#
StringAlign=LEFT
MouseActionCursor=1
AntiAlias=1
solidcolor=0,0,0,1
Y=r
x=(10)*#scaledpi#R
LeftMouseUpAction=[!WriteKeyValue Variables LastCat #CURRENTSECTION#][!Refresh #currentconfig#]
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,140][!Update]



[WidgetsRegular]
Meter=String
MeterStyle=Top
Text=M
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=(18)*#scaledpi#
x=(405)*#scaledpi#

[WidgetsLarge]
Meter=String
MeterStyle=Top
Text=L
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=r

[WidgetsSmall]
Meter=String
MeterStyle=Top
Text=S
FontColor=#textcolor2#,200
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,255][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,200][!Update]
Y=r

[WidgetsHuge]
Meter=String
MeterStyle=Top
Text=XL
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=r



[Label]

FontFace=#ThemeFont#
Antialias=1
fontSize=(8)*#ScaleDpi#
fontcolor=#textcolor2#
w=(65)*#scaledpi#
y=r
x=R
stringAlign=center


[CalendarT]
Meter=String
MeterStyle=Label
Text=Calendar
x=(255*#scaledpi#)
y=(110*#scaledpi#)


[ClockT]
Meter=String
MeterStyle=Label
Text=Clock


[DigitalT]
Meter=String
MeterStyle=Label
Text=Digital


[GreeterT]
Meter=String
MeterStyle=Label
Text=Greeter


[MoonT]
Meter=String
MeterStyle=Label
Text=Moon

[MusicT]
Meter=String
MeterStyle=Label
Text=Music


[SystemT]
Meter=String
MeterStyle=Label
Text=System


[SlideshowT]
Meter=String
MeterStyle=Label
Text=Slideshow
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[TimerT]
Meter=String
MeterStyle=Label
Text=Timer


[AudioT]
Meter=String
MeterStyle=Label
Text=Audio

[WeatherT]
Meter=String
MeterStyle=Label
Text=Weather

[WorldClockT]
Meter=String
MeterStyle=Label
Text=World Clock

[BatteryT]
Meter=String
MeterStyle=Label
Text=Battery


[HDDt]
Meter=String
MeterStyle=Label
Text=HDD


[RAMt]
Meter=String
MeterStyle=Label
Text=RAM
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[CPUy]
Meter=String
MeterStyle=Label
Text=CPU


[DateT]
Meter=String
MeterStyle=Label
Text=Date

[DesktopT]
Meter=String
MeterStyle=Label
Text=Desktop


[SunriseT]
Meter=String
MeterStyle=Label
Text=Sunrise

[PictureT]
Meter=String
MeterStyle=Label
Text=Picture

[RecycleBinT]
Meter=String
MeterStyle=Label
Text=Trash

[Calendar]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Mini\#currentsection##displayampm#" "Item.ini"
x=(225)*#scaledpi#
y=(45)*#scaledpi#


[Clock]
Meter=Image
MeterStyle=block


[DigitalClock]
Meter=Image
MeterStyle=block

[Greeter]
Meter=Image
MeterStyle=block



[Moon]
Meter=Image
MeterStyle=block

[Music]
Meter=Image
MeterStyle=block





[System]
Meter=Image
MeterStyle=block


[Slideshow]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R

[Timer]
Meter=Image
MeterStyle=block


[Toggles]
Meter=Image
MeterStyle=block

[Weather]
Meter=Image
MeterStyle=block


[WorldClock]
Meter=Image
MeterStyle=block

[Battery]
Meter=Image
MeterStyle=block



[HDD]
Meter=Image
MeterStyle=block

[RAm]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R

[CPU]
Meter=Image
MeterStyle=block

[Date]
Meter=Image
MeterStyle=block



[DesktopSwitch]
Meter=Image
MeterStyle=block




[SunriseSunset]
Meter=Image
MeterStyle=block


[Picture]
Meter=Image
MeterStyle=block

[RecycleBin]
Meter=Image
MeterStyle=block


[Te]
Meter=String
MeterStyle=Text
Text=#MoreOfThisSize#
y=(30*#scaledpi#)R
x=(452)*#scaledpi#
FontFace=#ThemeFont#
Antialias=1
fontSize=(10)*#ScaleDpi#
fontcolor=#textcolor2#
stringalign=center
LeftMouseUpAction=[!WriteKeyValue Variables LastCat "Shortcuts"][!Refresh #currentconfig#]
MouseActionCursor=1

