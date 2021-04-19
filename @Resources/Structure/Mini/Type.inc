

[solA]
Meter=Image
solidcolor=0,255,0,1
W=(65+(10-#Padding#)*2)*#ScaleDpi#
H=((#HideLabels#*5)+60+(10-#Padding#)*(3-#HideLabels#))*#ScaleDpi#
x=0
y=0




[bgE]
Meter=Image
ImageName=#@#Graphics\Structure\mini.png
X=(11-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(62)*#ScaleDpi#
H=(61)*#ScaleDpi#
ImageTint=#colorskin#,#opacity2#



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
fontcolor=#LabelColor#

[Full]
X=(11-#Padding#)*#ScaleDpi#
Y=(10-#Padding#)*#ScaleDpi#
W=(62)*#ScaleDpi#
H=(61)*#ScaleDpi#
MouseActionCursor=1
