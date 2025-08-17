#include <GDIPlus.au3>
#include <WinAPIShellEx.au3>
;#include <MsgBoxConstants.au3>

; To use in Rainmeter, specify command line arguments like this: GetIcon.exe #currentpath# #currentconfig#
; Why? Because it needs to know where to write the Icon, Name and Action :)
; I commented out the MsgBox stuff

If $CmdLine[0] = 2 Then
Global $currentpath = $CmdLine[1], $currentconfig = $CmdLine[2]
; MsgBox($MB_SYSTEMMODAL, "", "Path: " & $currentpath & "Config: "  & $currentconfig)

Local Const $sMessage = "Select a single file of any type."
Local $sFileOpenDialog = FileOpenDialog($sMessage, @ProgramsCommonDir & "\", "Shortcuts, Programs (*lnk;*exe)", $FD_FILEMUSTEXIST)

If @error Then
		; Display the error message.
		; MsgBox($MB_SYSTEMMODAL, "", "No file was selected.")
		; Change the working directory (@WorkingDir) back to the location of the script directory as FileOpenDialog sets it to the last accessed folder.
		FileChangeDir(@ScriptDir)
	Else
		; Retrieve details about the shortcut.

			FileChangeDir(@ScriptDir)
	; Replace instances of "|" with @CRLF in the string returned by FileOpenDialog.
	$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
	Local $aDetails = FileGetShortcut($sFileOpenDialog)
	$sExt = StringRegExpReplace($sFileOpenDialog, "^.*\.", "")
	; MsgBox($MB_SYSTEMMODAL, "", "Ext: " & $sExt)

	If Not @error Then
		; If it's an exe file, we don't need to GetShortcut
		If ($sExt = "exe") Then
			ExtractIcon($sFileOpenDialog, $currentpath & "\Icon.png")
			IniWrite($currentpath & "\UserVariables.inc", "Variables", "PanelAction", $sFileOpenDialog)
			Local $sFilenameExExt = StringRegExpReplace($sFileOpenDialog, "^.*\\|\..*$", "")
			IniWrite($currentpath & "\UserVariables.inc", "Variables", "PanelName", $sFilenameExExt)
		Else 
			ExtractIcon($aDetails[0], $currentpath & "\Icon.png")
			IniWrite($currentpath & "\UserVariables.inc", "Variables", "PanelAction", $aDetails[0])
			If ($aDetails[3] = "") Then
							Local $sFilenameExExt = StringRegExpReplace($sFileOpenDialog, "^.*\\|\..*$", "")
			IniWrite($currentpath & "\UserVariables.inc", "Variables", "PanelName", $sFilenameExExt)

		Else 
			IniWrite($currentpath & "\UserVariables.inc", "Variables", "PanelName", $aDetails[3])
			EndIf
		EndIf
		IniWrite($currentpath & "\UserVariables.inc", "Variables", "IconLocation", "Icon.png")
		Run('"' & @HomeDrive & "\Program Files\Rainmeter\Rainmeter.exe" & '" [!Refresh "' & $currentconfig & '"]')
		
			; MsgBox($MB_SYSTEMMODAL, "", "Path: " & $aDetails[0] & @CRLF & _
			;				"Working directory: " & $aDetails[1] & @CRLF & _
			;				"Arguments: " & $aDetails[2] & @CRLF & _
			;				"Description: " & $aDetails[3] & @CRLF & _
			;				"Icon filename: " & $aDetails[4] & @CRLF & _
			;				"Icon index: " & $aDetails[5] & @CRLF & _
			;				"Shortcut state: " & $aDetails[6] & @CRLF)
	EndIf
EndIf
EndIf



Func ExtractIcon($file, $output)
    $hIcon = _WinAPI_ShellExtractIcon($file, 0, 256, 256)
    _GDIPlus_Startup()
    $pBitmap = _GDIPlus_BitmapCreateFromHICON($hIcon)
    _GDIPlus_ImageSaveToFileEx($pBitmap, $output, _GDIPlus_EncodersGetCLSID("PNG"))
    _GDIPlus_ImageDispose($pBitmap)
    _GDIPlus_Shutdown()
    _WinAPI_DestroyIcon($hIcon)
EndFunc