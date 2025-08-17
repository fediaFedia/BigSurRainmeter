

[solA]
Meter=String
solidcolor=0,0,0,1
W=(#height#+(10-#Padding#)*2)*#ScaleDpi#
H=(#height#+(10-#Padding#)*(3-#HideLabels#))*#ScaleDpi#
x=0
y=0


[Shape]
Meter=Shape
Shape=Rectangle (10-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#height#+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0 | #StrokeColorGrad#,#StrokeOpacity# ; 1


[Overlay]
Meter=Image
ImageName=#@#Graphics\#Structure#\regular#darkmode#.png
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(#height#+#Padding#+#Padding#)*#ScaleDpi#
H=(#height#+#Padding#+#Padding#)*#ScaleDpi#


[Full]
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
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
y=((#height#/75)*#ScaleDpi#)R
StringAlign=Center
w=(#height#)*#ScaleDpi#
x=(#height#/2+(10-#Padding#))*#ScaleDpi#
MeterStyle=FontStyle
Hidden=#HideLabels#
fontcolor=#LabelColor#,#LabelOpacity#
InlineSetting=#InlineShadow#