[WidgetsE]
Meter=String
MeterStyle=Side
Text=#Widgets#
Hidden=0
Y=(65)*#scaledpi#
x=(25)*#scaledpi#

[block]
w=(115)*#scaledpi#
h=(115)*#scaledpi#
X=R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Huge\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\Huge\#DarkMode#\#currentsection#.png
MouseActionCursor=1

[Top]
FontColor=#textcolor2#,140
FontFace=#ThemeFont#
InlineSetting=#InlineShadow#
FontSize=(12)*#scaledpi#
StringAlign=LEFT
MouseActionCursor=1
AntiAlias=1
solidcolor=0,0,0,1
Y=r
x=(10)*#scaledpi#R
LeftMouseUpAction=[!WriteKeyValue Variables LastCat #CURRENTSECTION#][!Refresh #currentconfig#]
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,140][!Update]

[WidgetsRegular]
Meter=String
MeterStyle=Top
Text=M
FontColor=#textcolor2#,130

Y=(18)*#scaledpi#
x=(405)*#scaledpi#
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]

[WidgetsLarge]
Meter=String
MeterStyle=Top
Text=L
FontColor=#textcolor2#,130

MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=r

[WidgetsSmall]
Meter=String
MeterStyle=Top
Text=S
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=r

[WidgetsHuge]
Meter=String
MeterStyle=Top
Text=XL
FontColor=#textcolor2#,200
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,255][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,200][!Update]
Y=r



[Label]

FontFace=#ThemeFont#
Antialias=1
fontSize=(8)*#ScaleDpi#
fontcolor=#textcolor2#
w=(115)*#scaledpi#
y=r
x=R
stringAlign=center




[CalendarT]
Meter=String
MeterStyle=Label
Text=Calendar
x=(282*#scaledpi#)
y=(158*#scaledpi#)


[ClockT]
Meter=String
MeterStyle=Label
Text=Digital Clock






[MusicT]
Meter=String
MeterStyle=Label
Text=Music

[NotesT]
Meter=String
MeterStyle=Label
Text=Notes




[NewsT]
Meter=String
MeterStyle=Label
Text=News
x=(282*#scaledpi#)
y=(135*#scaledpi#)r



[SlideshowT]
Meter=String
MeterStyle=Label
Text=Slideshow



[WeatherT]
Meter=String
MeterStyle=Label
Text=Weather



[CustomTextT]
Meter=String
MeterStyle=Label
Text=Custom Text


[PictureT]
Meter=String
MeterStyle=Label
Text=Picture
x=(282*#scaledpi#)
y=(135*#scaledpi#)r




[Calendar]
x=(225)*#scaledpi#
y=(45)*#scaledpi#
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Huge\#currentsection##displayampm#" "Item.ini"




[DigitalClock]
Meter=Image
MeterStyle=block



[MusicPicker]
Meter=Image
MeterStyle=block


[Notes]
Meter=Image
MeterStyle=block



[RSS]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R

[Slideshow]
Meter=Image
MeterStyle=block



[Weather]
Meter=Image
MeterStyle=block



[CustomText]
Meter=Image
MeterStyle=block


[Picture]
Meter=Image

MeterStyle=block

x=(225)*#scaledpi#
y=(20)*#scaledpi#R








