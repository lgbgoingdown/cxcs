[General]
SyntaxVersion=2
BeginHotkey=50
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=0b0d58d3-f142-4947-9c9c-20b91692a272
Description=dnf分解
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
UEsDBBQAAgAIAG52cz9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAdbwsdOW8LHTlvCx05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAbnZzP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHW8LHTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
Hwnd = Plugin.Window.Find("地下城与勇士", "地下城与勇士")
Call Plugin.Window.Move(Hwnd, 0, 0)

set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0, "song9.txt")
dm_ret = dm.SetDict(1, "nsong9.txt")
dm_ret = dm.SetDict(2, "number.txt")
hwnd = dm.GetMousePointWindow()
dm_ret = dm.BindWindow(hwnd, "normal", "normal", "normal")

const x0 = 345
const y0=240
const dit=27

//If sure() Then 
//	MessageBox "ok"
//End If
//
dm_ret = dm.FindStr(0, 0, 640, 480, "暗夜清醒者", "ffffff-000000", 1.0, intX, intY)
If intX > 0 and intY > 0 Then 
    MoveTo intX, intY
    Delay 200
    //	MessageBox intX&","&intY
    LeftClick 1
    Delay 200
    dm_ret = dm.FindStr(0, 0, 640, 480, "分解机", "ffffff-000000", 1.0, intX, intY)
    If intX > 0 and intY > 0 Then 
        MoveTo intX, intY
        //		MessageBox intX&","&intY
        Delay 200
        dm_ret = dm.FindStr(0, 0, 640, 480, "装备分解", "ddc58d-000000", 1.0, intX, intY)
        If intX > 0 and intY > 0 Then 
            MoveTo intX, intY
            //			MessageBox intX&","&intY
            Delay 200
            LeftClick 1
            Delay 200
            j=0
            For 4
            	i=0
            	For 8
            		MoveTo x0+dit*i,y0+dit*j
          			Delay 200
            		Call resolve()
            		i=i+1
            	Next
            	j=j+1
            Next
            
            LeftClick 1
            Delay 200
        End If
    End If
End If

dm_ret = dm.UnBindWindow()

Sub resolve()
    LeftClick 1
    Delay 200
    LeftClick 1
    Delay 200
    Do  While true
	   	If sure() Then 
	   		Exit do
	   	End If
   	Loop 
End Sub

Function sure()
    dm_ret = dm.FindStr(0, 0, 640, 480, "公告", "ffffff-000000", 1, intX, intY)
    If intX > 0 and intY > 0 Then 
        MoveTo intX+124, intY+6
//        MessageBox intX&intY
        Delay 200
        LeftClick 1
        Delay 200
        sure=true
    Else 
    	sure=false
//    	MessageBox "meiqued"
    End If
End Function