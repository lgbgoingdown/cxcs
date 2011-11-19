[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=8449d1c1-0324-437f-9a00-5c46fcb121a1
Description=拍卖行
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
UEsDBBQAAgAIAHhlcj9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAfwUsZO8FLGTvBSxk5jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAeGVyP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH8FLGTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
LogStart "D:\dnf收货.log"

set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0, "song9.txt")
dm_ret = dm.SetDict(1, "nsong9.txt")
dm_ret = dm.SetDict(2, "number.txt")
hwnd = dm.GetMousePointWindow()
dm_ret = dm.BindWindow(hwnd,"normal","normal","normal")

//UserVar price=3000"理想价格"
UserVar maxPrice = 1000000"一口价最大值"
totalP=0

price = 2600
UserVar pricecl = 7400"淬炼的冒险家灵魂单价"
UserVar priceqr = 2600"强韧的冒险家灵魂单价"
UserVar pricews = 51"无色小晶块单价"
UserVar priceccmg = 510"璀璨玫瑰单价"
UserVar pricemfzz=190"魔法珍珠单价"


i = 0
While true
dm_ret = dm.FindStr(0,0,640,480, "拍卖行", "ffffff-000000", 1.0, intX, intY)
If intX >= 0 and intY >= 0 Then
     Delay 200
     Call 初始化搜索条件()
     Call 无色小晶块()
     Call 强韧的冒险家灵魂()
     Call 淬炼的冒险家灵魂()
     Call 魔法珍珠()
Else 
    Delay 200
    KeyPress "b", 1
    Delay 300
//	call 物品搜索()
End If

Wend

dm_ret = dm.UnBindWindow()


LogStop

Sub 魔法珍珠()
	
	Call TraceStr("mfzz")
     	Delay 500
     	flag = 0
     	While flag=0
		dm_ret = dm.FindStr(0,0,640,480,"魔法珍珠","68d5ed-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then
				Call BuyOrNot(pricemfzz)
			Else 
				Call 初始化搜索条件()
			End If
		Wend
End Sub

Sub 璀璨玫瑰()
	
	Call TraceStr("ccmg")
     	Delay 500
     	flag = 0
     	While flag=0
		dm_ret = dm.FindStr(0,0,640,480,"璀璨玫瑰","68d5ed-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then
				Call BuyOrNot(priceccmg)
			Else 
				Call 初始化搜索条件()
			End If
		Wend
End Sub

Sub 无色小晶块()
	
	Call TraceStr("wsxjk")
     	Delay 500
     	flag = 0
     	While flag=0
		dm_ret = dm.FindStr(0,0,640,480,"无色小晶块","68d5ed-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then
				Call BuyOrNot(pricews)
			Else 
				Call 初始化搜索条件()
			End If
		Wend
End Sub

Sub 淬炼的冒险家灵魂()
	Call TraceStr("cl")
     	Delay 500
     	flag = 0
     	While flag=0
		dm_ret = dm.FindStr(0,0,640,480,"淬炼的冒险家灵魂","68d5ed-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then
				Call BuyOrNot(pricecl)
			Else 
				Call 初始化搜索条件()
			End If
		Wend
End Sub

Sub 强韧的冒险家灵魂()
	Call TraceStr("qr")
     	Delay 500
     	flag = 0
     	While flag=0
		dm_ret = dm.FindStr(0,0,640,480,"强韧的冒险家灵魂","68d5ed-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then
//     			dm.MoveTo intX, intY
				Call BuyOrNot(priceqr)
//				Call BuyOrNot()
			Else 
				Call 初始化搜索条件()
			End If
		Wend
End Sub

Sub 物品搜索()
	 dm_ret = dm.FindStr(35, 98, 87, 118, "物品搜索", "ffffb8-000000", 1.0, intX, intY)
     If intX >= 0 and intY >= 0 Then 
     	MoveTo 100, 130
     	Delay 200
     	LeftClick 1
     	Delay 200
     	KeyPress "Enter", 1
     	Delay 200
     Else 
     	MessageBox "没移到"
     End If
End Sub

Sub 初始化搜索条件()
	Delay 200
	dm_ret = dm.FindStr(516, 125, 603, 140, "初始化搜索条件", "ddc58d-000000", 1.0, intX, intY)
	If intX >= 0 and intY >= 0 Then 
		MoveTo intX + 1, intY + 1
		Delay 200
		LeftClick 1
		Delay 200
		MoveTo 100, 130
     	Delay 200
     	LeftClick 1
     	Delay 200
	End If
	flag=1
End Sub

Sub 翻页()
	dm_ret = dm.FindStr(515, 356, 555, 370, "搜索出", "ddc593-000000", 1.0, intX, intY)
     If intX >= 0 and intY >= 0 Then 
     	Delay 100
     	KeyPress "PageDown", 1
		Delay 100
     Else
		MouseWheel -10
		Delay 100
	End If
End Sub


Function BuyOrNot(price)
		Delay 100
     	dm_ret = dm.FindStr(450,intY-10,510,380,"一口价","ffb100-000000",1.0,intX,intY)
     	If intX >= 0 and intY >= 0 Then 
     		ax = intX
     		ay=intY
     		dm.MoveTo intX, intY
     		Delay 300
//     		MessageBox intX & "," & intY
     		dm_ret = dm.FindStr(335,intY-1,456,intY+16,"每个","ffffff-000000",1.0,intX,intY)
			If intX >= 0 and intY >= 0 Then 
				Delay 300
				dm.UseDict(2)
				danjia = dm.Ocr(368, intY, 456, intY + 16, "ffffff-000000", 1.0)
				danjia = CInt(danjia)
				danjia = danjia * 1
				dm.UseDict(0)
				If danjia <= price Then 
//					MessageBox "输出:" & danjia
					Delay 200
					dm.UseDict(2)
					zongjia = dm.Ocr(500, ay-10, 565, ay+20, "ffb100-000000", 1.0)
				 	zongjia = CInt(zongjia)
				 	zongjia=zongjia*1
				 	dm.UseDict(0)
				 	If zongjia>=maxPrice Then 
//						MessageBox zongjia
						flag=1
						Delay 200
					Else
						Delay 200
						MoveTo ax, ay
						Delay 200
						LeftClick 1
						Delay 200
						dm_ret = dm.FindStr(ax, ay, ax + 100, ay + 46, "一口价", "bd9f7e-000000", 1.0, intX, intY)
						If intX >= 0 and intY >= 0 Then 
	//						MessageBox "OK"
							MoveTo intX, intY
							Delay 200
							LeftClick 1
							Delay 200
							KeyPress "Enter", 3
							Delay 300
							totalPrice = totalPrice + zongjia
							
							Call 物品搜索()
						Else 
							MessageBox "not found 一口价购买点"
							Call 物品搜索()
						End If
					End If
				Else 
//					MessageBox "太贵" & danjia & "pirce=" & price
					Delay 200
					flag = 1
					Call 初始化搜索条件()
//					Call 物品搜索()
//					KeyPress "Enter", 1
     				Delay 200
				End If
			Else 
				MessageBox "no 每个"
			End If
		Else 
			Call 翻页()
		End If
End Function

Function TraceStr(s)
	length = Len(s)
	di=1
	For length
		KeyPress mid(s,di,1), 1
		Delay 200
		di=di+1
	Next
	    KeyPress "Space",1//32,1//空格
     	Delay 200
     	KeyPress "Enter", 1
     	Delay 200
End Function
