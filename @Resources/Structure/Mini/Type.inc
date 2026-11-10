[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Mini.png
solidcolor=0,0,0,1
W=(69+(11-#Padding#)*2)*#ScaleDpi#
H=(69+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#
ImageAlpha=#WidgetShadowOpacity#

[Solid]
Meter=String
solidcolor=0,0,0,1
W=(69+(11-#Padding#)*2)*#ScaleDpi#
H=(69+(11-#Padding#)*2)*#ScaleDpi#
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
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (1+(11-#Padding#))*#ScaleDpi#, (69+#Padding#+#Padding#)*#ScaleDpi#, (69+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#LiquidGlassDisabled#
MotionFPS=0
UpdateDivider=-1

[GlassBlur]
Measure=Plugin
Plugin=GlassBlur
Type=Blur
; BlurRegion=Type, X, Y, Width, Height[, Radius] - Type 0 = whole skin, 1 = rectangle, 2 = rounded (overrides Radius)
BlurRegion=2, (11-#Padding#)*#ScaleDpi#, (1+(11-#Padding#))*#ScaleDpi#, (69+#Padding#+#Padding#)*#ScaleDpi#, (69+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#BlurDisabled#

[Shape]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(1+(11-#Padding#))*#ScaleDpi#,(69+#Padding#+#Padding#)*#ScaleDpi#,(69+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#ScaleDpi#)  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0  | #StrokeColorGrad#,#StrokeOpacity# ; 0.5 | #StrokeColor#,#StrokeOpacity# ; 1.0



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(10)*#ScaleDpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=(80*#ScaleDpi#)
StringAlign=Center
x=(34+(11-#Padding#))*#ScaleDpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
ClipString=1 
w=(65+(13-#Padding#)*2)*#ScaleDpi#
InlineSetting=#InlineShadow#
Antialias=1

[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(1+11-#Padding#)*#ScaleDpi#
W=(69+#Padding#+#Padding#)*#ScaleDpi#
H=(69+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1


[Icon]
X=(11+(11-#Padding#))*#ScaleDpi#
Y=(11+(11-#Padding#))*#ScaleDpi#
W=(48+#Padding#+#Padding#)*#ScaleDpi#
H=(48+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1