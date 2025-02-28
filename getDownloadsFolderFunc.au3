Func GetDownloadsFolder()
    Local $downloadPath = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "{374DE290-123F-4565-9164-39C4925E467B}")
    If $downloadPath == "" Then $downloadPath = @UserProfileDir & "\Downloads"
    Return $downloadPath
EndFunc