[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Double.png
solidcolor=0,0,0,1
W=(326+(10-#Padding#)*2)*#ScaleDpi#
H=(#height#+(10-#Padding#)*2)*#ScaleDpi#
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
XWidth=320
XHeight=150
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
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=((#height#/0.9375)*2+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#
Container=MeterContainer1D
Hidden=#BlurDisabled#

[MeterContainer1D]
Meter=Shape
Shape=Rectangle (10-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,(#height#*2+20+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#scaledpi#) | Fill Color 255,47,47,255 | StrokeWidth 0
X=0
Y=0

[Shape]
Meter=Shape
Shape=Rectangle (10-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,((#height#/0.9375)*2+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0 | #StrokeColorGrad#,#StrokeOpacity# ; 1




[Full]
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=((#height#/0.9375)*2+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(10)*#scaledpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=(2)*#scaledpi#R
StringAlign=Center
w=(#height#)*#scaledpi#
x=(((#height#/0.9375)+(10-#Padding#)))*#scaledpi#
h=(#height#/9)*#scaledpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
InlineSetting=#InlineShadow#
