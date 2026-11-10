[WidgetsE]
Meter=String
MeterStyle=Side
Text=#Widgets#
Hidden=0
Y=(65)*#scaledpi#
x=(25)*#scaledpi#




[block]
w=(65)*#scaledpi#
h=(65)*#scaledpi#
X=R
y=r

LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Regular\#currentsection#" "Item.ini"
ToolTipText=#currentsection#
imagename=#@#\Graphics\Thumbs\#DarkMode#\#currentsection#.png
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
LeftMouseUpAction= [!WriteKeyValue Variables HideHint 1][!WriteKeyValue Variables LastCat #CURRENTSECTION#][!Refresh #currentconfig#]
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,140][!Update]



[WidgetsRegular]
Meter=String
MeterStyle=Top
Text=M
FontColor=#textcolor2#,200
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,255][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,200][!Update]
Y=(18)*#scaledpi#
x=(405)*#scaledpi#

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
FontColor=#textcolor2#,130
MouseOverAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,180][!Update]
MouseLeaveAction=[!SetOption #CURRENTSECTION# fontcolor #textcolor2#,130][!Update]
Y=r



[Label]

FontFace=#ThemeFont#
Antialias=1
fontSize=(8)*#ScaleDpi#
fontcolor=#textcolor2#
w=(65)*#scaledpi#
y=r
x=R
stringAlign=center


[MultiT]
Meter=String
MeterStyle=Label
Text=Multi
x=(255*#scaledpi#)
y=(110*#scaledpi#)

[CalendarT]
Meter=String
MeterStyle=Label
Text=Calendar


[CalendarT2]
Meter=String
MeterStyle=Label
Text=Month

[ClockT]
Meter=String
MeterStyle=Label
Text=Clock


[DigitalT]
Meter=String
MeterStyle=Label
Text=Digital


[GreeterT]
Meter=String
MeterStyle=Label
Text=Greeter

[LibraryT]
Meter=String
MeterStyle=Label
Text=Library


[MediaControlT]
Meter=String
MeterStyle=Label
Text=Media Control
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[MoonT]
Meter=String
MeterStyle=Label
Text=Moon

[MusicT]
Meter=String
MeterStyle=Label
Text=Music

[NotesT]
Meter=String
MeterStyle=Label
Text=Notes

[QuotesT]
Meter=String
MeterStyle=Label
Text=Quotes

[NewsT]
Meter=String
MeterStyle=Label
Text=News

[SlideshowT]
Meter=String
MeterStyle=Label
Text=Slideshow


[SystemT]
Meter=String
MeterStyle=Label
Text=System
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[TimersT]
Meter=String
MeterStyle=Label
Text=Timers

[AudioT]
Meter=String
MeterStyle=Label
Text=Audio

[WeatherT]
Meter=String
MeterStyle=Label
Text=Weather

[WorldClockT]
Meter=String
MeterStyle=Label
Text=World Clock

[BatteryT]
Meter=String
MeterStyle=Label
Text=Battery

[PodcastsT]
Meter=String
MeterStyle=Label
Text=Podcasts


[HDDt]
Meter=String
MeterStyle=Label
Text=HDD
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[RAMt]
Meter=String
MeterStyle=Label
Text=RAM

[CPUy]
Meter=String
MeterStyle=Label
Text=CPU

[DateT]
Meter=String
MeterStyle=Label
Text=Date

[DesktopT]
Meter=String
MeterStyle=Label
Text=Desktop

[TextTimeT]
Meter=String
MeterStyle=Label
Text=Text Time

[CustomTextT]
Meter=String
MeterStyle=Label
Text=Custom Text

[SunriseT]
Meter=String
MeterStyle=Label
Text=Sunrise
x=(255*#scaledpi#)
y=(84*#scaledpi#)r

[PictureT]
Meter=String
MeterStyle=Label
Text=Picture

[CountdownT]
Meter=String
MeterStyle=Label
Text=Countdown

[RecycleBinT]
Meter=String
MeterStyle=Label
Text=Trash

[Multi]
Meter=Image
x=(225)*#scaledpi#
y=(45)*#scaledpi#
MeterStyle=block




[CalendarBasic]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Regular\Calendar" "Item.ini"


[Calendar]
Meter=Image
MeterStyle=block
LeftMouseUpAction=!ToggleConfig "BigSur\Widgets\Regular\#currentsection##displayampm#" "Item.ini"

[Clock]
Meter=Image
MeterStyle=block


[DigitalClock]
Meter=Image
MeterStyle=block

[Greeter]
Meter=Image
MeterStyle=block

[Library]
Meter=Image
MeterStyle=block







[MediaControl]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R


[Moon]
Meter=Image
MeterStyle=block

[MusicPicker]
Meter=Image
MeterStyle=block


[Notes]
Meter=Image
MeterStyle=block

[Quotes]
Meter=Image
MeterStyle=block

[RSS]
Meter=Image
MeterStyle=block


[Slideshow]
Meter=Image
MeterStyle=block

[System]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R

[Timer]
Meter=Image
MeterStyle=block


[Toggles]
Meter=Image
MeterStyle=block

[Weather]
Meter=Image
MeterStyle=block


[WorldClock]
Meter=Image
MeterStyle=block

[Battery]
Meter=Image
MeterStyle=block

[Podcast]
Meter=Image
MeterStyle=block


[HDD]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R
[RAm]
Meter=Image
MeterStyle=block


[CPU]
Meter=Image
MeterStyle=block

[Date]
Meter=Image
MeterStyle=block



[DesktopSwitch]
Meter=Image
MeterStyle=block


[TextClock]
Meter=Image
MeterStyle=block

[CustomText]
Meter=Image
MeterStyle=block

[SunriseSunset]
Meter=Image
MeterStyle=block
x=(225)*#scaledpi#
y=(20)*#scaledpi#R


[Picture]
Meter=Image
MeterStyle=block

[Countdown]
Meter=Image
MeterStyle=block

[RecycleBin]
Meter=Image
MeterStyle=block





