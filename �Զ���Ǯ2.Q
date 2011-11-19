[General]
SyntaxVersion=2
BeginHotkey=120
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=da17ab45-40b5-4e6a-9a4e-1827308de56b
Description=自动收钱2
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
UEsDBBQAAgAIAKg8cT9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAfQucRO0LnETtC5xE5jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAqDxxP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH0LnETlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
Hwnd = Plugin.Window.Find("地下城与勇士", "地下城与勇士")
Call Plugin.Window.Move(Hwnd, 0, 0)

While 1
	GetColor = GetPixelColor(340, 425)
	If GetColor = "D4CEC8" Then 
		MoveTo 340, 425
		LeftClick 1 //邮件
        Delay 300
//     Else
//     	MoveTo 580, 270
//     	LeftClick 2
     End If
     	GetColor = GetPixelColor(578,190)
	If GetColor = "FFFFFF" Then 
		MoveTo 510,260 
		LeftClick 1 //邮件
        Delay 300
     End If
     GetColor = GetPixelColor(300, 280)
     If GetColor = "6B4210" Then
		KeyPress "Enter", 1 //还有邮件的确定公告
        Delay 300
     End If
     GetColor = GetPixelColor(266, 144)
     If GetColor = "FFFFFF" Then 
		MoveTo 275, 140
        LeftClick 3 //金币
        Delay 300
        MoveTo 414, 260
		LeftClick 3  //全部接受
		Delay 300
		GetColor = GetPixelColor(300, 260)
        If GetColor = "6B4210" Then
			KeyPress "Enter", 1 //确定公告
        	Delay 300
        End If
		MoveTo 330, 300
		LeftClick 3	//删除
		Delay 300
//	Else 
//		KeyPress "Esc", 1 //没有退出
//		Delay 300
	End If
	IfColor 275, 140, "23170C" ,2 Then
//		ElseIf GetColor = "1E1208" or "23170C" Then
		KeyPress "Esc", 1 //没有退出
		Delay 300
    End If
Wend
