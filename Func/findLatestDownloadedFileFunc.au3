Func FindLatestDownloadedFile($folder)
    Local $latestFile = ""
    Local $latestTime = 0

    Local $aFiles = _FileListToArray($folder, "*.*", 1)
    If @error Then Return ""

    For $i = 1 To $aFiles[0]
        Local $filePath = $folder & "\" & $aFiles[$i]
        Local $fileTime = FileGetTime($filePath, 0, 1)
        If $fileTime > $latestTime Then
            $latestTime = $fileTime
            $latestFile = $filePath
        EndIf
    Next

    Return $latestFile
EndFunc