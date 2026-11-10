[Shadow]
Meter=Image
ImageName=#@#Graphics\Shadows\Mini.png
solidcolor=0,255,0,100
W=(#height#+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0
Hidden=#WidgetShadow#



[Solid]
Meter=String
solidcolor=0,255,0,1
W=(#height#+(11-#Padding#)*2)*#ScaleDpi#
H=(#height#+(11-#Padding#)*2)*#ScaleDpi#
x=0
y=0


[GlassBlur]
Measure=Plugin
Plugin=GlassBlur
Type=Blur
; BlurRegion=Type, X, Y, Width, Height[, Radius] - Type 0 = whole skin, 1 = rectangle, 2 = rounded (overrides Radius)
BlurRegion=2, (47-#Padding#)*#ScaleDpi#, (43-#Padding#)*#ScaleDpi#, (96+#Padding#+#Padding#)*#ScaleDpi#, (95+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#
Disabled=#BlurDisabled#

[Shape]
Meter=Shape
Shape=Rectangle (47-#Padding#)*#ScaleDpi#,(43-#Padding#)*#ScaleDpi#,(96+#Padding#+#Padding#)*#ScaleDpi#,(95+#Padding#+#Padding#)*#ScaleDpi#,(#radius#*#ScaleDpi#)  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0  | #StrokeColorGrad#,#StrokeOpacity# ; 0.5 | #StrokeColor#,#StrokeOpacity# ; 1.0



[FontStyle]
FontFace=#ThemeFont#
Antialias=1
fontSize=(11)*#ScaleDpi#
fontcolor=255,255,255

[Text]
Meter=String
Text=#Name#
y=((131+(11-#Padding#))*#ScaleDpi#)
StringAlign=Center
x=(80+(13-#Padding#))*#ScaleDpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
ClipString=1 
w=(65+(13-#Padding#)*2)*#ScaleDpi#
InlineSetting=#InlineShadow#
FontSize=(11)*#ScaleDpi#


[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(13-#Padding#)*#ScaleDpi#
W=(96+#Padding#+#Padding#)*#ScaleDpi#
H=(95+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1


[Icon]
X=(49+(13-#Padding#))*#ScaleDpi#
Y=(45+(13-#Padding#))*#ScaleDpi#
W=(64+#Padding#+#Padding#)*#ScaleDpi#
H=(64+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1