

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


[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(11-#Padding#)*#ScaleDpi#
W=(#height#+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(#height#/15)*#ScaleDpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=(#height#*1.08)*#ScaleDpi#
StringAlign=Center
w=(#height#)*#ScaleDpi#
x=(#height#/2+(11-#Padding#))*#ScaleDpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
InlineSetting=#InlineShadow#
h=(#height#/9)*#scaledpi#

[Head]
X=((#height#/6))*#scaledpi#
Y=((#height#/6))*#scaledpi#
StringAlign=LEFT
StringStyle=BOLD
FontColor=#redcolor#
InlineSetting=#InlineShadow#
FontSize=((9))*#scaledpi#
AntiAlias=1
stringcase=upper