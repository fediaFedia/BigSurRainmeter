

[solA]
Meter=Image
solidcolor=0,0,0,1
W=(65+(10-#Padding#)*2)*#ScaleDpi#
H=((#HideLabels#*5)+60+(10-#Padding#)*(3-#HideLabels#))*#ScaleDpi#
x=0
y=0



[Shape]
Meter=Shape
Shape=Rectangle (11-#Padding#)*#ScaleDpi#,(10-#Padding#)*#ScaleDpi#,(62+#Padding#+#Padding#)*#ScaleDpi#,(61+#Padding#+#Padding#)*#ScaleDpi#,(#radius#)*#ScaleDpi#  | StrokeWidth #StrokeWidth# | Stroke LinearGradient StrokeGradient | Fill LinearGradient FillGradient
FillGradient=#colorskinGradAngle# | #colorskin#,#opacity2# ; 0.0 | #colorskinGrad#,#opacity2# ; 1
StrokeGradient=#StrokeAngle# | #StrokeColor#,#StrokeOpacity# ; 0.0 | #StrokeColorGrad#,#StrokeOpacity# ; 1



[Overlay]
Meter=Image
ImageName=#@#Graphics\#Structure#\mini#darkmode#.png
X=(11-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(62+#Padding#+#Padding#)*#ScaleDpi#
H=(61+#Padding#+#Padding#)*#ScaleDpi#



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
W=(62+#Padding#+#Padding#)*#ScaleDpi#
H=(61+#Padding#+#Padding#)*#ScaleDpi#
MouseActionCursor=1
