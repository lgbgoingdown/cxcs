[General]
SyntaxVersion=2
BeginHotkey=118
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=7c65daa7-965e-449f-86dc-4e345b20e44e
Description=送npc
Enable=0
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
UEsDBBQAAgAIAMhecT9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAfs9cRO7PXETuz1xE5jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAyF5xP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH7PXETlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
Hwnd = Plugin.Window.Find("地下城与勇士", "地下城与勇士")
Call Plugin.Window.Move(Hwnd, 0, 0)

For 25
       MoveTo 530, 435
       RightClick 1
       Delay 200
       LeftClick 1
       Delay 200
EndFor
