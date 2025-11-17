[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Mini.png
solidcolor=0,0,0,1
W=(65+(10-#Padding#)*2)*#ScaleDpi#
H=(65+(10-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#

[MeasureBlur]
Measure=Plugin
Plugin=EasyBlur
ScreenAreaWidth=#ScreenAreaWidth#
ScreenAreaHeight=#ScreenAreaHeight#
XPos=#CURRENTCONFIGX#
YPos=#CURRENTCONFIGY#
XWidth=(62+#Padding#+#Padding#)*#ScaleDpi#
XHeight=(62+#Padding#+#Padding#)*#ScaleDpi#
Intensity=#BlurIntensity#
DontResize=#BlurNoResize#
Zoom=#BlurZoom#
ImagePath=#BlurImagePath#
Disabled=#BlurDisabled#
FastBlur=#FastBlur#

[Blur]
Meter=Image
ImageName=[MeasureBlur]
DynamicVariables=1
solidcolor=0,0,0,255
X=(11-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(62+#Padding#+#Padding#)*#ScaleDpi#
H=(61+#Padding#+#Padding#)*#ScaleDpi#
Container=MeterContainer1D
Hidden=#BlurDisabled#


[MeterContainer1D]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,(62+#Padding#+#Padding#)*#ScaleDpi#,(61+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#ScaleDpi#) | Fill Color 255,47,47,255 | StrokeWidth 0
X=0
Y=0

[Shape]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,(62+#Padding#+#Padding#)*#ScaleDpi#,(61+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#ScaleDpi#)  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0 | #StrokeColorGrad#,#StrokeOpacity# ; 1



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(10)*#ScaleDpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=2R
StringAlign=Center
x=(32+(10-#Padding#))*#ScaleDpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
ClipString=1 
w=(65+(10-#Padding#)*2)*#ScaleDpi#
InlineSetting=#InlineShadow#


[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(63+#Padding#+#Padding#)*#ScaleDpi#
H=(62+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1
