#pragma compile(Icon, C:\ruler.ico)
#pragma compile(UPX, False)
#pragma compile(FileDescription, Alignment Tool to auto-positon Widgets)
#pragma compile(ProductName, Align Tool)
#pragma compile(ProductVersion, 1.1)
#pragma compile(FileVersion, 1.1)
#pragma compile(LegalCopyright, © 2020 fediaFedia & Xyrfo)
#pragma compile(LegalTrademarks, 'Open Source / MIT)
#pragma compile(CompanyName, 'Created for Big Sur 1.0')


Switch $CmdLine[1]

Case 'LockUnlockPanels'
	LockUnlockPanels()
Case 'Missing'
	Missing()
Case 'Align'
	Align()
EndSwitch

Func OmnimoError($title, $msg)
	MsgBox(16, $title, $msg & @CRLF & @CRLF & 'Please send an e-mail to omnimosupport@gmail.com or' & @CRLF & 'file an issue at github with the following information:' & @CRLF & @CRLF & '- This error message' & @CRLF & '- Steps to reproduce the issue' & @CRLF & '- Your version of Rainmeter and Windows')
	Exit
 EndFunc

Func SendBang($szBang)
   Run('"' & $CmdLine[4] & 'Rainmeter.exe" [' & $szBang & ']')
EndFunc

Func LockUnlockPanels()
Const $skinpath    = $CmdLine[3]
Const $SettingsPath    = $CmdLine[2]
Const $Variant    = $CmdLine[5]

$sFilePath = $skinpath & "BigSur\@Resources\Global.inc"
$sFilePathLauncher = $skinpath & "BigSur\Launcher.ini"


Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
Const $Sections = IniReadSectionNames($RainmeterINI)
If @error Then OmnimoError("Error", "Unable to open Rainmeter.ini for reading.")
$sRead = IniRead($sFilePath, "Variables", "Draggable", "0")
$sReadFirstTime = IniRead($sFilePath, "Variables", "FirstTime", "0")

  For $i = 1 To $Sections[0]


If $sRead = "1" Then
	  SendBang("!Draggable 0 " & $Sections[$i])
	   IniWrite($sFilePath, "Variables", "Draggable", "0")
		IniWrite($sFilePathLauncher, "Rainmeter", "ContextTitle8", "#Unlock#")
		SendBang("!Refresh BigSur")
	  Else
	  SendBang("!Draggable 1 " & $Sections[$i])
	   IniWrite($sFilePath, "Variables", "Draggable", "1")
		IniWrite($sFilePathLauncher, "Rainmeter", "ContextTitle8", "#Lock#")
		  SendBang("!Refresh BigSur")
	  EndIf
   Next

If $sReadFirstTime = "1" Then
   MsgBox($MB_ICONINFORMATION, "Info", "The layout is now locked. To unlock it, select the Unlock", 5)
   IniWrite($sFilePath, "Variables", "FirstTime", "0")
EndIf
EndFunc




Func Align()

   Const $skinpath    = $CmdLine[3]
Const $SettingsPath    = $CmdLine[2]
Const $Variant    = $CmdLine[5]
Const $sY   = $CmdLine[6]
Const $sX = $CmdLine[7]
Const $overrideLeft = $CmdLine[8]



		Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
	Const $Sections = IniReadSectionNames($RainmeterINI)
	If @error Then OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")



Const $scaledpi = IniRead($skinpath & "BigSur\@Resources\Global.inc", "Variables", "ScaleDpi", "1")
$iCount = 0
$rowFull = 0
$rowFull2 = 0
$miniCount = 0
$totalItems = 0
Global $movebyX = 170 * $scaledpi
Global $movebyY = 180 * $scaledpi
Global $initialX = 68 + $sX
Global $initialY = 36 + $sY
$centerOffset1 = 25
$row1 = 0
$row2 = 0
$row3 = 0
$row4 = 0
$row5 = 0
$row6 = 0
$row7 = 0
$row8 = 0

	$NumPanels = 0
	;GUICtrlSetData($PanelList, "")






For $i = 1 To $Sections[0]
   If StringRegExp($Sections[$i], '^BigSur\\(Widgets|Shortcuts|Web).*$') Then
			If IniRead($RainmeterINI, $Sections[$i], "Active", "0") <> "0" And FileExists($SkinPath & $Sections[$i]) Then

$iTypes = IniRead($RainmeterINI, $Sections[$i], "Active", "0")

If $iTypes = 1 Then
   $totalItems += 1
ElseIf $iTypes = 2 Then
   $totalItems += 2
ElseIf $iTypes = 3 Then
   $totalItems += 0.25
   EndIf



EndIf
EndIf
Next


	For $i = 1 To $Sections[0]

		; Only want panels here
		If StringRegExp($Sections[$i], '^BigSur\\(Widgets|Shortcuts|Web).*$') Then
			If IniRead($RainmeterINI, $Sections[$i], "Active", "0") <> "0" And FileExists($SkinPath & $Sections[$i]) Then
				$config = StringReplace($Sections[$i], "BigSur\", "WP7\@Resources\Config\") & "\RainConfigure.cfg"
				If IniRead($config, "Options", "Colorizable", "1") == "0" Then ContinueLoop



;MsgBox($MB_SYSTEMMODAL, "Title", $Sections[$i], 1)
IniWrite ( 'hue.ini', "Variables", "Panel" & $iCount, $Sections[$i] )



;Local $iCountLines = _FileCountLines("hue.ini")
;MsgBox($MB_SYSTEMMODAL, "", "There are " & $iCountLines & " lines in this file.")




$iCount += 1

$iType = IniRead($RainmeterINI, $Sections[$i], "Active", "0")







;~ MsgBox(0, "", $totalItems)


If $totalItems >= 1 AND 8 >= $totalItems Then

$rowSize = 2
If ($initialX > (@DeskTopWidth - ($movebyX * $rowSize) - 50)) AND $overrideLeft = 0  Then
$initialX = (@DeskTopWidth - ($movebyX * $rowSize) - 50)
ElseIf ($initialX < (($movebyX * $rowSize) + 100)) AND $overrideLeft = 1  Then
$initialX = (($movebyX * $rowSize) + 100)

ElseIf ($overrideLeft = "0.000001") Then
$initialX = ((@DeskTopWidth / 2) - (($movebyX * $rowSize)/2 - $centerOffset1))


EndIf





;~ MsgBox(0, "", 'eight' & $totalItems)
If $rowFull < $rowSize Then




   $nextRow = 0
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * $rowFull) - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  + ($movebyX / 2)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  + ($movebyX / 2)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 2 AND 3 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'next' & $Sections[$i])
   $nextRow = 1
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 4 AND 5 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'EVEN ' & $Sections[$i])
   $nextRow = 2
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf

ElseIf $rowFull >= 6 AND 7 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'LAST ' & $Sections[$i])
   $nextRow = 3
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


;End of $rowFull If loop
EndIf


;End of totalItems If loop
EndIf



If $totalItems >= 9 AND 12 >= $totalItems Then

$rowSize = 3
;MsgBox(0, "", 'twelve' & $totalItems)
If ($initialX > (@DeskTopWidth - ($movebyX * $rowSize) - 50)) AND $overrideLeft = 0  Then
$initialX = (@DeskTopWidth - ($movebyX * $rowSize) - 50)
ElseIf ($initialX < (($movebyX * $rowSize) + 100)) AND $overrideLeft = 1  Then
$initialX = (($movebyX * $rowSize) + 100)
ElseIf ($overrideLeft = "0.000001") Then
$initialX = ((@DeskTopWidth / 2) - (($movebyX * $rowSize)/2 - $centerOffset1))
EndIf

If $rowFull < $rowSize Then




   $nextRow = 0
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 3 AND 5 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'next' & $Sections[$i])
   $nextRow = 1
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 6 AND 8 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'EVEN ' & $Sections[$i])
   $nextRow = 2
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf

ElseIf $rowFull >= 9 AND 11 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'LAST ' & $Sections[$i])
   $nextRow = 3
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


;End of $rowFull If loop
EndIf






;End of totalItems If loop
EndIf


If $totalItems > 16 Then

;~    MsgBox(0, "", 'too many' & $totalItems)




$rowSize = 5
;MsgBox(0, "", 'twelve' & $totalItems)
If ($initialX > (@DeskTopWidth - ($movebyX * $rowSize) - 50)) AND $overrideLeft = 0  Then
$initialX = (@DeskTopWidth - ($movebyX * $rowSize) - 50)
ElseIf ($initialX < (($movebyX * $rowSize) + 100)) AND $overrideLeft = 1  Then
$initialX = (($movebyX * $rowSize) + 100)
ElseIf ($overrideLeft = "0.000001") Then
$initialX = ((@DeskTopWidth / 2) - (($movebyX * $rowSize)/2 - $centerOffset1))
EndIf

If $rowFull < $rowSize Then




   $nextRow = 0
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 3 AND 9 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'next' & $Sections[$i])
   $nextRow = 1
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


ElseIf $rowFull >= 8 AND 14 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'EVEN ' & $Sections[$i])
   $nextRow = 2
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf

ElseIf $rowFull >= 13 AND 19 >= $rowFull  Then


;MsgBox(0, 'e' & $rowFull, 'LAST ' & $Sections[$i])
   $nextRow = 3
   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - ($rowSize * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


;End of $rowFull If loop
EndIf








;End of totalItems If loop
EndIf

If $totalItems >= 13 AND 16 >= $totalItems Then



$rowSize = 4
;@DeskTopWidth



If ($initialX > (@DeskTopWidth - ($movebyX * $rowSize) - 50)) AND $overrideLeft = 0  Then
$initialX = (@DeskTopWidth - ($movebyX * $rowSize) - 50)
ElseIf ($initialX < (($movebyX * $rowSize) + 100)) AND $overrideLeft = 1  Then
$initialX = (($movebyX * $rowSize) + 100)
ElseIf ($overrideLeft = "0.000001") Then
$initialX = ((@DeskTopWidth / 2) - (($movebyX * $rowSize)/2 - $centerOffset1))
EndIf



If $rowFull < 4 Then


   $nextRow = 0

   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * $rowFull)  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf





;~ f
ElseIf $rowFull >= 3 AND 7 >= $rowFull  Then

$nextRow = 1

   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf



ElseIf $rowFull >= 6 AND 11 >= $rowFull  Then

$nextRow = 2

   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf




ElseIf $rowFull >= 10 AND 15 >= $rowFull  Then



$nextRow = 3

   If $iType = "1" or $iType = "4" or $iType = "5" Then
	SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
    $rowFull += 1
	  ElseIf $iType = "2" Then
 	  SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
	  	  $rowFull += 2
	   Else
$miniCount += 1
If $miniCount = "1" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "2" Then
    SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
ElseIf $miniCount = "3" Then
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25)) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
Else
   SendBang("!Move " & $initialX + ($movebyX * ($rowFull - (4 * $nextRow)))  - ($overrideLeft * $movebyX * $rowSize + ($overrideLeft + 25))  + ($movebyX / 2) & " " & ($movebyY / 2) + $initialY + ($movebyY * $nextRow) & " " & $Sections[$i])
   $miniCount = 0;
   $rowFull += 1
EndIf
EndIf


Else

;End of totalItems If loop
EndIf

Else
EndIf

Else
EndIf

		EndIf
	Next
 EndFunc

