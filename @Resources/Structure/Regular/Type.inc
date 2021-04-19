

[solA]
Meter=Image
solidcolor=0,255,0,1
W=(#height#+(10-#Padding#)*2)*#ScaleDpi#
H=(#height#+(10-#Padding#)*(3-#HideLabels#))*#ScaleDpi#
x=0
y=0






[bgE]
Meter=Image
ImageName=#@#Graphics\Structure\regular.png
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(#height#)*#ScaleDpi#
H=(#height#)*#ScaleDpi#
ImageTint=#colorskin#,#opacity2#

[Full]
X=(10-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(#height#)*#ScaleDpi#
H=(#height#)*#ScaleDpi#




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
fontcolor=#LabelColor#