[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Regular.png
solidcolor=0,0,0,1
W=(#height#+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#
ImageAlpha=#WidgetShadowOpacity#


[Solid]
Meter=String
solidcolor=0,0,0,1
W=(#height#+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0

[LiquidGlass]
Measure=Plugin
Plugin=#BlurMode#
Blur=14
Radius=28
Padding=30
Saturation=1.2
RefractionHeight=1.0
RefractionCorrect=1.0
Dispersion=2.0
Darkening=1
HighlightAlpha=0.0
ShadowAlpha=0.0
ShadowOffsetY=0
Tint=90,160,255,20
FPS=0
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (11-#Padding#)*#ScaleDpi#, (#height#+#Padding#+#Padding#)*#ScaleDpi#, (#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#LiquidGlassDisabled#
MotionFPS=0


[GlassBlur]
Measure=Plugin
Plugin=GlassBlur
Type=Blur
; BlurRegion=Type, X, Y, Width, Height[, Radius] - Type 0 = whole skin, 1 = rectangle, 2 = rounded (overrides Radius)
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (11-#Padding#)*#ScaleDpi#, (#height#+#Padding#+#Padding#)*#ScaleDpi#, (#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#BlurDisabled#



[Shape]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(11-#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0  | #StrokeColorGrad#,#StrokeOpacity# ; 0.5 | #StrokeColor#,#StrokeOpacity# ; 1.0

[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(#height#/13)*#ScaleDpi#
InlineSetting=#InlineShadow#

StringAlign=Center
x=(#height#/2+(11-#Padding#))*#ScaleDpi#
w=(#height#)*#ScaleDpi#
ClipString=1

[Name]
Meter=String
MeterStyle=FontStyle
Text=#PanelName#
y=(#height#*0.65)*#ScaleDpi#
fontcolor=#textcolor2#,150

[Description]
Meter=String
MeterStyle=FontStyle
Text=#PanelDescription#
y=(#height#*0.8)*#ScaleDpi#
fontcolor=#textcolor2#,80

[Icon]
Meter=Image
ImageName=#IconLocation#
X=(11-#Padding#+#height#*0.32)*#ScaleDpi#
Y=(11-#Padding#+#height#*0.14)*#ScaleDpi#
W=(#height#*0.36+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#*0.36+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1
LeftMouseUpAction=!execute ["#PanelAction#"]

[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(11-#Padding#)*#ScaleDpi#
W=(#height#+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#