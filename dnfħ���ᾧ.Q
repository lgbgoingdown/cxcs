[General]
SyntaxVersion=2
BeginHotkey=116
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=d2df5303-ce38-41dd-8932-36a446cd39e8
Description=dnf魔力结晶
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
UEsDBBQAAgAIAAxmcz9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAeGpcdOhqXHToalx05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgADGZzP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHhqXHTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
Hwnd = Plugin.Window.Find("地下城与勇士", "地下城与勇士")
Call Plugin.Window.Move(Hwnd, 0, 0)

set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0, "song9.txt")
//dm_ret = dm.SetDict(1, "nsong9.txt")
dm_ret = dm.SetDict(2, "number.txt")
hwnd = dm.GetMousePointWindow()
dm_ret = dm.BindWindow(hwnd,"normal","normal","normal")
//s = dm.Ocr(0, 0, 1024, 768, "68d5ed-000000|ffb100-000000", 1.0)
//MessageBox s

dm_ret = dm.FindStr(0,0,640,480,"刘仁噢","ffffff-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
      KeyPress "F4", 1
       Delay 200
       dm_ret = dm.FindStr(86, 201, 125, 217, "生产", "ffffb8-000000", 1.0, intX, intY)
       If intX >= 0 and intY >= 0 Then 
       		Delay 200
       		MoveTo nitX, intY
       		Delay 200
       		LeftClick 1
       		Do While 1
       		dm_ret = dm.FindStr(81,392,188,414,"魔力结晶","aaaaaa-000000",1.0,intX,intY)
       			If intX >= 0 and intY >= 0 Then 
       				Call Start()
       				Exit Do
       			Else	
       				//MessageBox "no 魔力结晶"
       				MouseWheel -10 
       				Delay 200
       			End If
       		Loop
       End If
Else 
	MessageBox "not found"
	EndScript
End If


dm_ret = dm.UnBindWindow()
Sub Start()
Do While 1
       MoveTo 90, 400
       LeftClick 2
       Delay 200
       IfColor 400, 400, "7B5218", 0 Then
       		KeyPress "Enter", 1
       		Delay 200
       		KeyPress "Enter", 1
       		Delay 200
       		Do  While true
       		IfColor 420, 245, "00C6FF", 0 Then
       			Delay 200
       			KeyPress "Enter", 1
       			Delay 200
       			Exit do
       		End If
       		Loop
       	Else 
       		Exit Do
       	End If
Loop
End Sub



