[WidgetsE]
Meter=String
MeterStyle=Side
Text=#Widgets#
Hidden=0
Y=(65)*#scaledpi#
x=(25)*#scaledpi#




[block]
w=(115)*#scaledpi#
h=(62)*#scaledpi#
X=R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Double\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\Double\#DarkMode#\#currentsection#.png
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
FontColor=#textcolor2#,200
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,255][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,200][!Update]
Y=r

[WidgetsSmall]
Meter=String
MeterStyle=Top
Text=S
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
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
w=(115)*#scaledpi#
y=r
x=R
stringAlign=center


[MultiT]
Meter=String
MeterStyle=Label
Text=Multi Stack
x=(282)*#scaledpi#
y=(105)*#scaledpi#

[CalendarT]
Meter=String
MeterStyle=Label
Text=Calendar


[CalendarT2]
Meter=String
MeterStyle=Label
Text=Month

[ClockT]
Meter=String
MeterStyle=Label
Text=Digital Clock



[LibraryT]
Meter=String
MeterStyle=Label
Text=Library
x=(282)*#scaledpi#
y=(81)*#scaledpi#r



[MoonT]
Meter=String
MeterStyle=Label
Text=Moon



[MusicT]
Meter=String
MeterStyle=Label
Text=Music

[NotesT]
Meter=String
MeterStyle=Label
Text=Notes





[NewsT]
Meter=String
MeterStyle=Label
Text=News
x=(282)*#scaledpi#
y=(81)*#scaledpi#r


[SlideshowT]
Meter=String
MeterStyle=Label
Text=Slideshow


[SystemT]
Meter=String
MeterStyle=Label
Text=System


[WeatherT]
Meter=String
MeterStyle=Label
Text=Weather



[WorldClockT]
Meter=String
MeterStyle=Label
Text=World Clock
x=(282)*#scaledpi#
y=(81)*#scaledpi#r

[BatteryT]
Meter=String
MeterStyle=Label
Text=Battery



[DesktopT]
Meter=String
MeterStyle=Label
Text=Desktop


[CustomTextT]
Meter=String
MeterStyle=Label
Text=Custom Text

[SunriseT]
Meter=String
MeterStyle=Label
Text=Sunrise
x=(282)*#scaledpi#
y=(81)*#scaledpi#r





[MultiDouble]
Meter=Image
x=(225)*#scaledpi#
y=(45)*#scaledpi#
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Double\MultiDouble" "WorldClock.ini"

[CalendarBasic]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Double\Calendar" "Item.ini"


[Calendar]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Double\#currentsection##displayampm#" "Item.ini"


[DigitalClock]
Meter=Image
MeterStyle=block

[Library]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R





[Moon]
Meter=Image
MeterStyle=block

[MusicPicker]
Meter=Image
MeterStyle=block


[Notes]
Meter=Image
MeterStyle=block


[RSS]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R


[Slideshow]
Meter=Image
MeterStyle=block

[System]
Meter=Image
MeterStyle=block


[Weather]
Meter=Image
MeterStyle=block


[WorldClock]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R

[Battery]
Meter=Image
MeterStyle=block


[DesktopSwitch]
Meter=Image
MeterStyle=block

[CustomText]
Meter=Image
MeterStyle=block

[SunriseSunset]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R







