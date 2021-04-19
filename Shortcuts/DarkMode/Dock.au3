

Switch $CmdLine[1]
Case 'ObjectDock Light'
   
ProcessClose("ObjectDock.exe")
RegWrite("HKEY_CURRENT_USER\Software\Stardock\ObjectDock", "Theme", "REG_SZ", "Big Sur")
Run(_ProgramFilesDir() & "\Stardock\ObjectDock\ObjectDock.exe")

Case 'ObjectDock Dark'
   
ProcessClose("ObjectDock.exe")
RegWrite("HKEY_CURRENT_USER\Software\Stardock\ObjectDock", "Theme", "REG_SZ", "Big Sur Dark")
Run(_ProgramFilesDir() & "\Stardock\ObjectDock\ObjectDock.exe")


Case 'RocketDock Light'
   
ProcessClose("RocketDock.exe")
RegWrite("HKEY_CURRENT_USER\Software\RocketDock", "Theme", "REG_SZ", "Big Sur")
Run(_ProgramFilesDir() & "\RocketDock\RocketDock.exe")

Case 'RocketDock Dark'
   
ProcessClose("RocketDock.exe")
RegWrite("HKEY_CURRENT_USER\Software\RocketDock", "Theme", "REG_SZ", "Big Sur Dark")
Run(_ProgramFilesDir() & "\RocketDock\RocketDock.exe")

Case 'NexusDock Light'
   
ProcessClose("Nexus.exe")

$ses = RegRead("HKEY_CURRENT_USER\Software\WinSTEP2000\NeXuS", "NeXuSImage3")
Local $sString = StringReplace($ses, "light", "dark")

RegWrite("HKEY_CURRENT_USER\Software\WinSTEP2000\NeXuS", "NeXuSImage3", "REG_SZ", $sString)
Run(_ProgramFilesDir() & "\Winstep\Nexus.exe")

Case 'NexusDock Dark'
   
$ses = RegRead("HKEY_CURRENT_USER\Software\WinSTEP2000\NeXuS", "NeXuSImage3")
Local $sString = StringReplace($ses, "dark", "light")

RegWrite("HKEY_CURRENT_USER\Software\WinSTEP2000\NeXuS", "NeXuSImage3", "REG_SZ", $sString)
Run(_ProgramFilesDir() & "\Winstep\Nexus.exe")


EndSwitch



Func _ProgramFilesDir()
    Local $ProgramFileDir
    Switch @OSArch
        Case "X86"
            $ProgramFileDir = "Program Files"
        Case "X64"
            $ProgramFileDir = "Program Files (x86)"
    EndSwitch
    Return @HomeDrive & "\" & $ProgramFileDir
EndFunc ;==>_ProgramFilesDirh