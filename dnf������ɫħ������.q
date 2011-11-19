[General]
SyntaxVersion=2
BeginHotkey=117
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=63d97903-6968-4ac2-b3df-29fd44512755
Description=dnf制作无色魔力产物
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
UEsDBBQAAgAIABZncz9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAeLp8dOi6fHTounx05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAFmdzP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHi6fHTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
Hwnd = Plugin.Window.Find("地下城与勇士", "地下城与勇士")
Call Plugin.Window.Move(Hwnd, 0, 0)
a=1
       KeyPress "F4", 1
       Delay 200
       MoveTo 160, 120
       LeftClick 2
       Delay 200
Do While 1
       MoveTo 90, 240
       LeftClick 2
       Delay 200
       IfColor 400, 310, "8C4A10", 0 Then
       		KeyPress "Enter", 1
       		Delay 200
       		KeyPress "Enter", 1
       		Delay 200
//       		Msgbox a & "次"
       		Do  While true
       		IfColor 420, 245, "00C6FF", 0 Then
       			Delay 200
       			KeyPress "Enter", 1
       			Delay 200
       			Exit do
       		End If
//       		a=a+1
       		Loop
//       		Msgbox a & "次"  
		Else 
			Exit Do
       	End If
Loop
//Msgbox 0 & "次"

