#include <File.au3>
#include "getDownloadsFolderFunc.au3"
#include "waitForDownloadFunc.au3"
#include "findLatestDownloadedFileFunc.au3"
#include "installApplicationFunc.au3"
#include "findInstalledProgramFunc.au3"



Local $url = "https://pcapp.store"
ShellExecute($url)

Sleep(5000)

Send("{TAB 6}")
Send("{ENTER}")
Sleep(1000)
Send("{TAB}")
Send("{ENTER}")

Local $downloadFolder = GetDownloadsFolder()
Local $timeout = 30000

Local $downloadedFile = WaitForDownload($downloadFolder, $timeout, "setup*")

If $downloadedFile = "" Then $downloadedFile = FindLatestDownloadedFile($downloadFolder)

If $downloadedFile <> "" Then
    If InstallApplication($downloadedFile) Then
        Sleep(10000)
        Local $installedPath = FindInstalledProgram("PCAppStore")
		
        If $installedPath <> "" Then
            MsgBox(64, "Done", "PC App Store successfully installed: " & $installedPath)
        Else
            MsgBox(16, "Error", "The installed application could not be found.")
        EndIf
    EndIf
Else
    MsgBox(16, "Error", "File not found!")
EndIf