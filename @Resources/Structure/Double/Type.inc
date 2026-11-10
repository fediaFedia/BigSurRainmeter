[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Double.png
solidcolor=0,0,0,1
W=(342+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#
ImageAlpha=#WidgetShadowOpacity#

[Solid]
Meter=String
solidcolor=0,0,0,1
W=(342+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0

[LiquidGlass]
Measure=Plugin
Plugin=#BlurMode#
Blur=14
Radius=28
Padding=30
Saturation=1.0
RefractionHeight=1.0
RefractionCorrect=1.0
Dispersion=1.0
Darkening=1
HighlightAlpha=0.0
ShadowAlpha=0.0
ShadowOffsetY=0
Tint=90,160,255,20
FPS=1
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (11-#Padding#)*#ScaleDpi#, (172*2+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#scaledpi#)
Disabled=#LiquidGlassDisabled#
MotionFPS=0
UpdateDivider=-1

[GlassBlur]
Measure=Plugin
Plugin=GlassBlur
Type=Blur
Radius=30
; BlurRegion=Type, TopX, TopY, BottomX, BottomY[, Radius] - Type 0 = whole skin, 1 = rectangle, 2 = rounded (overrides Radius)
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (11-#Padding#)*#ScaleDpi#, (172*2+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#scaledpi#)
DynamicVariables=1
UpdateDivider=-1
Disabled=#BlurDisabled#

[Shape]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(11-#Padding#)*#ScaleDpi#,(172*2+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0  | #StrokeColorGrad#,#StrokeOpacity# ; 0.5 | #StrokeColor#,#StrokeOpacity# ; 1.0



[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(11-#Padding#)*#ScaleDpi#
W=(172*2+#Padding#+#Padding#)*#ScaleDpi#
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
x=(((#height#/0.9375)+(11-#Padding#)))*#scaledpi#
h=(#height#/9)*#scaledpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
InlineSetting=#InlineShadow#


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