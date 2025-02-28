Func WaitForDownload($folder, $timeout, $filePattern = "*.*")
    Local $timer = TimerInit()
    
    While TimerDiff($timer) < $timeout
        Local $files = _FileListToArray($folder, $filePattern, 1)
        If @error Then ContinueLoop

        For $i = 1 To $files[0]
            Local $file = $files[$i]

            If StringInStr($file, ".crdownload") = 0 And _
               StringInStr($file, ".part") = 0 And _
               StringInStr($file, ".opdownload") = 0 Then
                Return $folder & "\" & $file
            EndIf
        Next
        Sleep(1000)
    WEnd

    Return ""
EndFunc