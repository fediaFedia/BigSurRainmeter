[ExtrasE]
Meter=String
MeterStyle=Side
Text=#Extras#
Hidden=0
Y=(146)*#scaledpi#
x=(25)*#scaledpi#



[block]
w=(130)*#scaledpi#
h=(120)*#scaledpi#
X=5R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Extras\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\Extras\#currentsection#.png
MouseActionCursor=1


[ClockNews]
Meter=Image
x=(225)*#scaledpi#
y=(30)*#scaledpi#
MeterStyle=block

[MenuHorizontal]
Meter=Image
MeterStyle=block


[DayDate]
Meter=Image
MeterStyle=block

[Visualizer]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=5R

[BgRounded]
Meter=Image
MeterStyle=block


[te]
meter=string
MeterStyle=Default
y=(10)*#scaledpi#R
x=(225)*#scaledpi#
fontsize=(10)*#scaledpi#
text=#GetMoreExtras#
LeftMouseUpACtion=!execute ["https://screenstyler.com/?ref=bigsurextras"]
MouseActionCursor=1