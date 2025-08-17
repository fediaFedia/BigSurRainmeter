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

LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\#DarkMode#\#currentsection#.png
MouseActionCursor=1


[Multi]
Meter=Image
x=(225)*#scaledpi#
y=(45)*#scaledpi#
MeterStyle=block



[CalendarBasic]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Calendar" "Item.ini"


[Calendar]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\#currentsection##displayampm#" "Item.ini"

[Clock]
Meter=Image
MeterStyle=block


[DigitalClock]
Meter=Image
MeterStyle=block

[Greeter]
Meter=Image
MeterStyle=block

[Library]
Meter=Image
MeterStyle=block

[MediaControl]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(2)*#scaledpi#R


[Moon]
Meter=Image
MeterStyle=block

[MusicPicker]
Meter=Image
MeterStyle=block


[Notes]
Meter=Image
MeterStyle=block

[Quotes]
Meter=Image
MeterStyle=block

[RSS]
Meter=Image
MeterStyle=block


[Slideshow]
Meter=Image
MeterStyle=block

[System]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(2)*#scaledpi#R

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

[Podcast]
Meter=Image
MeterStyle=block


[HDD]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(2)*#scaledpi#R
[RAm]
Meter=Image
MeterStyle=block


[CPU]
Meter=Image
MeterStyle=block

[Date]
Meter=Image
MeterStyle=block



[DesktopSwitch]
Meter=Image
MeterStyle=block


[TextClock]
Meter=Image
MeterStyle=block

[CustomText]
Meter=Image
MeterStyle=block

[SunriseSunset]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(2)*#scaledpi#R

[MultiDouble]
Meter=Image
MeterStyle=block






[CheckUpdate]
Measure=WebParser
URL=http://fediafedia.com/bigsur/up.dt
RegExp="<update>(.*)</update>.*<link>(.*)</link>"
FinishAction=[!Update]
UpdateDivider=1000

[UpdateAvailable]
Measure=WebParser
URL=[CheckUpdate]
StringIndex=1
IfMatch=1
IfMatchAction=[!ShowMeter Update][!Update]
DynamicVariables=1

[UpdateLink]
Measure=WebParser
URL=[CheckUpdate]
StringIndex=2


[Update]
Meter=String
w=(405)*#scaledpi#
h=(35)*#scaledpi#
x=(427)*#scaledpi#
y=20
solidcolor=0,120,0

Text=#UpdateAvailable#
stringalign=centercenter
fontsize=(10)*#scaledpi#
fontcolor=255,255,255
MouseActionCursor=1
Antialias=1
LeftMouseUpAction=!execute [[UpdateLink]?lang=#langcode#]
Hidden=1
DynamicVariables=1