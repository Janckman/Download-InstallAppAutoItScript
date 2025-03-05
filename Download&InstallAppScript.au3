#include <File.au3>
#include "Func\getDownloadsFolderFunc.au3"
#include "Func\waitForDownloadFunc.au3"
#include "Func\findLatestDownloadedFileFunc.au3"
#include "Func\installApplicationFunc.au3"
#include "Func\findInstalledProgramFunc.au3"
#include "Func\openLinkWithClickFunc.au3"


Local $url = "https://pcapp.store"
OpenAndClickDownload($url)

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
