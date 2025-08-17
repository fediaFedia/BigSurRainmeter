[solA]
Meter=String
solidcolor=0,0,0,1
W=(320+(10-#Padding#)*2)*#ScaleDpi#
H=(#height#+(10-#Padding#)*(3-#HideLabels#))*#ScaleDpi#
x=0
y=0



[Shape]
Meter=Shape
Shape=Rectangle (10-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,((#height#/0.9375)*2+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0 | #StrokeColorGrad#,#StrokeOpacity# ; 1



[Overlay]
Meter=Image
ImageName=#@#Graphics\#Structure#\double#darkmode#.png
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=((#height#/0.9375)*2+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#


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
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
InlineSetting=#InlineShadow#
