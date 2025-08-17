[ExtrasE]
Meter=String
MeterStyle=Side
Text=#Extras#
Hidden=0
Y=(146)*#scaledpi#
x=(25)*#scaledpi#



[block]
w=(105)*#scaledpi#
h=(105)*#scaledpi#
X=5R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Extras\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\Extras\#currentsection#.png
MouseActionCursor=1


[ClockNews]
Meter=Image
x=(245)*#scaledpi#
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


[BgRounded]
Meter=Image
MeterStyle=block
x=(245)*#scaledpi#
y=5R

[PowerButtons]
Meter=Image
MeterStyle=block



// Hide the Blur setting if not on Windows 11
[MeasureOSVersion]
Measure=SysInfo
SysInfoType=OS_VERSION
UpdateDivider=-1
Substitute="Windows ":""
IfCondition=[MeasureOSVersion] < 11
IfTrueAction=[!HideMeter BackgroundBlur][!Redraw]
DynamicVariables=1