Func InstallApplication($filePath)
    Local $pid = ShellExecute($filePath)
    If $pid = 0 Then Return False

    Sleep(5000)

    Local $timeout = 15
    While $timeout > 0
        If WinExists("[ACTIVE]") Then
            WinActivate("[ACTIVE]")
            Send("{ENTER}")
            Return True
        EndIf
        Sleep(1000)
        $timeout -= 1
    WEnd

    Return False
EndFunc