[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Huge.png
solidcolor=0,0,0,1
W=(342+(11-#Padding#)*2)*#ScaleDpi#
H=(347+(13-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#
;Hidden=#WidgetShadow#


[Solid]
Meter=String
solidcolor=0,0,0,1
W=(342+(11-#Padding#)*2)*#ScaleDpi#
H=(347+(13-#Padding#)*2)*#ScaleDpi#
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
BlurRegion=2, (13-#Padding#)*#ScaleDpi#, (13-#Padding#)*#ScaleDpi#, (342+#Padding#+#Padding#)*#ScaleDpi#,(349+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#scaledpi#)
Disabled=#LiquidGlassDisabled#
MotionFPS=0
UpdateDivider=-1

[GlassBlur]
Measure=Plugin
Plugin=GlassBlur
Type=Blur
; BlurRegion=Type, X, Y, Width, Height[, Radius] - Type 0 = whole skin, 1 = rectangle, 2 = rounded (overrides Radius)
BlurRegion=2, (13-#Padding#)*#ScaleDpi#, (13-#Padding#)*#ScaleDpi#,(#height#*2+20+#Padding#+#Padding#)*#ScaleDpi#,((#height#*2+30)+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#BlurDisabled#


[Shape]
Meter=Shape
Shape=Rectangle (13-#Padding#)*#ScaleDpi#,(13-#Padding#)*#ScaleDpi#,(342+#Padding#+#Padding#)*#ScaleDpi#,(349+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0  | #StrokeColorGrad#,#StrokeOpacity# ; 0.5 | #StrokeColor#,#StrokeOpacity# ; 1.0




[Full]
X=(13-#Padding#)*#ScaleDpi#
Y=(13-#Padding#)*#ScaleDpi#
W=(342+#Padding#+#Padding#)*#ScaleDpi#
H=(349+#Padding#+#Padding#)*#ScaleDpi#



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(11)*#scaledpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=((350+(13-#Padding#)))*#scaledpi#
StringAlign=Center
w=(342)*#scaledpi#
ClipString=1
x=(186)*#scaledpi#
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