Func FindInstalledProgram($appName)
    Local $uninstallKey = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
    Local $wow64Key = "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\"
    Local $keys[2] = [$uninstallKey, $wow64Key]

    For $k In $keys
        Local $i = 1
        While 1
            Local $subKey = RegEnumKey($k, $i)
            If @error Then ExitLoop

            Local $displayName = RegRead($k & $subKey, "DisplayName")
            Local $installLocation = RegRead($k & $subKey, "InstallLocation")
            If $displayName = $appName And $installLocation <> "" Then
                Return $installLocation
            EndIf
            $i += 1
        WEnd
    Next

    Local $path = @UserProfileDir
	Local $exe = FileFindFirstFile($path & "\" & $appName & "\*.exe")
    If $exe <> -1 Then
		While 1
        Local $foundFile = $path & "\" & FileFindNextFile($exe)
        If @error Then ExitLoop
			
        If StringInStr($foundFile, $appName) Then
            FileClose($exe)
            Return $foundFile
        EndIf
    WEnd
    FileClose($exe)
Else
    Return ""
EndIf
EndFunc