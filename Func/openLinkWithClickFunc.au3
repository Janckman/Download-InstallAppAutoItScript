#include <File.au3>
#include <MsgBoxConstants.au3>

Func OpenAndClickDownload($url)
    ShellExecute($url)
    Sleep(5000)
	Local $hBrowser = WinExists("[REGEXPCLASS:(Chrome_WidgetWin_1|MozillaWindowClass|IEFrame)]", "")
    If $hBrowser = 0 Then
        MsgBox(16, "Error", "Failed to find an active browser window!")
        Return False
    EndIf

    WinActivate($hBrowser)
    Sleep(2000)
	
	For $i = 1 To 6
		Send("{TAB}")
		Sleep(100)
	Next
	Send("{ENTER}")
	
	Local $hSaveAsWindow = WinWait("[CLASS:#32770]", "", 10)
    If $hSaveAsWindow Then
        WinActivate($hSaveAsWindow)
        Sleep(1000)
        Send("{TAB}")
        Send("{ENTER}")
    EndIf
    
    Return True
EndFunc

