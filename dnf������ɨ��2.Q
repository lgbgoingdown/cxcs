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
MacroID=700fbf38-39ec-4b54-b416-f5446fa7d15a
Description=dnf拍卖行扫描2
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
UEsDBBQAAgAIACpncz9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAfBp8dOwafHTsGnx05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAKmdzP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHwafHTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
LogStart "D:\dnf拍卖行扫描2.log"

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
//dm_ret = dm.BindWindow(hwnd,"dx2","windows","dx",1)

scanCount=1

//UserVar price=3000"理想价格"
UserVar IsFirst=1"1扫描平均价"
UserVar maxPrice = 1000000"一口价最大值"
UserVar maxTotalCost = 50000000"预算收购费用最大值"
UserVar maxMTLcount=10000"材料个数最大值"
totalCost = 0 //汇总花费金币
buyPrice = 0 //一口价购买金币
singlePrice=0 //每个单价

//UserVar price = 0 "单价"
UserVar pricecl = 7200 "淬炼的冒险家灵魂单价"
UserVar priceqr = 2600 "强韧的冒险家灵魂单价"
UserVar pricewus = 40 "无色小晶块单价"
UserVar pricebais = 49 "白色小晶块单价"
UserVar priceheis = 49 "黑色小晶块单价"
UserVar pricelans = 49 "蓝色小晶块单价"
UserVar pricehongs = 49 "红色小晶块单价"
UserVar priceccmg = 450 "璀璨玫瑰单价"
UserVar pricemfzz=190 "魔法珍珠单价"
UserVar pricelzx = 2100 "龙之心单价"
UserVar pricexg = 1700 "香瓜单价"
UserVar pricesjdb = 5500 "上级蛋白油单价"
UserVar pricezjdb = 5000 "中级蛋白油单价"


i = 0

//Call 输入法()
//Call 确定()

While true
    dm_ret = dm.FindStr(0,0,640,480, "拍卖行", "ffffff-000000", 1.0, intX, intY)
    If intX >= 0 and intY >= 0 Then
        Delay 200
        Call 确定()
        //Call material("","",price)
        Call material("qr","强韧的冒险家灵魂",priceqr)
        Call material("cl", "淬炼的冒险家灵魂", pricecl)
        Call material("wsxjk", "无色小晶块", pricewus)
        Call material("baisxjk", "白色小晶块", pricebais)
        Call material("heisxjk", "黑色小晶块", priceheis)
        Call material("lansxjk", "蓝色小晶块", pricelans)
        Call material("hongsxjk","红色小晶块",pricehongs)
        Call material("ccmg", "璀璨玫瑰", priceccmg)
        Call material("mfzz", "魔法珍珠", pricemfzz)
        Call material("lzx", "龙之心", pricelzx)
        Call material("xg", "香瓜", pricexg)
        Call material("sjdb", "上级蛋白油", pricesjdb)
        Call material("zjdb", "中级蛋白油", pricezjdb)
        TracePrint "scanCount="&scanCount
        scanCount=scanCount+1
    Else 
        Delay 100
        KeyPress "b", 1
        Delay 100
        //	call 物品搜索()
    End If
Wend

dm_ret = dm.UnBindWindow()


LogStop



Sub 强韧的冒险家灵魂()
    Call SpellStr("qr")
    Delay 500
    flag = 0
    While flag=0
        dm_ret = dm.FindStr(0,0,640,480,"强韧的冒险家灵魂","68d5ed-000000",1.0,intX,intY)
        If intX >= 0 and intY >= 0 Then
            //     			dm.MoveTo intX, intY
            Call BuyOrNot(priceqr)
        Else 
            Call 初始化搜索条件()
        End If
    Wend
End Sub

Function material(pinyinStr, ChineseNameStr, price)
    //主函数 搜索材料
    flag = 0
    If price <= 0 Then 
        flag = 1
        //        Call 初始化搜索条件()
//        TracePrint "给定单价为0跳过"&ChineseNaseStr
//        Delay 200
    Else
        Call SpellStr(pinyinStr)
        Delay 200
    End If
    
    While flag=0
        dm_ret = dm.FindStr(0,0,640,480,ChineseNameStr,"68d5ed-000000",1.0,intX,intY)
        If intX >= 0 and intY >= 0 Then
            buy=BuyOrNot(price)
            If buy = true Then 
                TracePrint "*******" & ChineseNameStr & ">>以单价" & singlePrice & "$<=给定价格："&price
                TracePrint "       购买了："&buyPrice & "$"&" 个数："&buyPrice/singlePrice
                TracePrint "汇总支出："&totalCost&"$******"
            End If
            If totalCost >= maxTotalCost Then 
                TracePrint "！！！！totalCost >= maxTotalCost"
                EndScript
            End If
        Else 
            TracePrint "not found : "&ChineseNameStr
            flag=1
        End If
    Wend
End Function

Sub 输入法()
    MoveTo 35, 430
    Delay 200
    LeftClick 1
    KeyDown "Ctrl", 1
    Delay 200
    KeyDown ",", 1
    Delay 200
    TracePrint "输入法转换OK"
End Sub

Sub 确定()
    dm_ret = dm.FindStr(0,0,640,480, "公告", "ffffff-000000", 1.0, intX, intY)
    If intX >= 0 and intY >= 0 Then 
        Delay 100
        Delay 100
        MoveTo intX+90, intY+5
        Delay 200
        LeftClick 1
        Delay 200
        //        Call 初始化搜索条件() 
    End If
End Sub

Sub 物品搜索()
	Call 确定()
    dm_ret = dm.FindStr(35, 98, 87, 118, "物品搜索", "ffffb8-000000", 1.0, intX, intY)
    If intX >= 0 and intY >= 0 Then 
        MoveTo 100, 130
        Delay 200
        LeftClick 1
        Delay 200
        KeyPress "Enter", 1
        Delay 200
    Else 
        TracePrint "没找到物品搜索"
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
        LeftClick 2
        Delay 200
    Else 
        TracePrint "初始化搜索条件失败"
    End If
End Sub

Sub 翻页()
    dm_ret = dm.FindStr(515, 356, 555, 370, "搜索出", "ddc593-000000", 1.0, intX, intY)
    If intX >= 0 and intY >= 0 Then 
        Delay 100
        KeyPress "PageDown", 1
        Delay 100
    Else
        MouseWheel -30
        Delay 100
    End If
End Sub

Function GetSinglePrice(ax,ay)
    //获取单价
    dm.MoveTo ax, ay
    Delay 200
    dm_ret = dm.FindStr(335,ay-1,456,ay+16,"每个","ffffff-000000",1.0,intX,intY)
    If intX >= 0 and intY >= 0 Then 
        Delay 100
        dm.UseDict(2)
        dj = dm.Ocr(368, ay, 456, ay + 16, "ffffff-000000", 1.0)
        dj = CLng(dj)
        dj = dj * 1
        dm.UseDict (0)
        //        MessageBox "dj="&dj
    Else 
        Delay 200
        flag = 1
        TracePrint "未找到每个字体，单价获取失败"
    End If

    If dj> 0 Then 
        GetSinglePrice = dj
    Else 
        GetSinglePrice = -1 
        TracePrint "单价获取值函数<0"
    End If
    
End Function


Function GetAveragePrice(ax,ay)
    //获取平均价
    dm.MoveTo ax, ay
    Delay 200
    dm_ret = dm.FindStr(335,ay-15,456,ay+16,"平均成交价","ffffff-000000",1.0,intX,intY)
    If intX >= 0 and intY >= 0 Then 
        Delay 200
        dm.UseDict(2)
        avg = dm.Ocr(368, ay-15, 456, ay+2, "ffffff-000000", 1.0)
        avg= CLng(avg)
        avg = avg * 1
        dm.UseDict (0)
    Else 
        Delay 200
        flag = 1
        TracePrint "平均成交价获取失败"
    End If
    dm.MoveTo ax, ay
    Delay 200
    If avg > 0 Then 
        GetAveragePrice = avg
    Else 
        GetAveragePrice = -1 
        TracePrint "平均成交价函数<0"
    End If
    
End Function

Function GetAPrice(ax, ay)
    //一口价
    //    dm.MoveTo ax, ay
    Delay 200
    dm.UseDict(2)
    zj = dm.Ocr(500, ay-10, 565, ay+20, "ffb100-000000", 1.0)
    zj = CLng(zj)
    zj = zj * 1
    dm.UseDict (0)
    Delay 200
    If zj > 0 Then 
        GetAPrice = zj
    Else 
        GetAPrice = -1 
        TracePrint "一口价获取函数<0"
    End If
End Function

Function BuyOrNot(bprice)
    bflag=false
    Delay 100
    If bprice <= 0 Then 
        flag = 1
        Call 初始化搜索条件()
        TracePrint "购买单价<=0"
        Delay 200
    Else
        dm_ret = dm.FindStr(450,intY-10,510,380,"一口价","ffb100-000000",1.0,intX,intY)
        If intX >= 0 and intY >= 0 Then 
            ax = intX
            ay=intY
            dm.MoveTo ax, ay
            Delay 200
            If IsFirst = 1 Then 
                pingjun = GetAveragePrice(ax,ay)
                If pingjun < bprice and pingjun>0 Then 
                    TracePrint "####pingjun < bprice，pingjun="&pingjun &ChineseNameStr& "price=" & bprice
                    bprice = pingjun
                End If
            End If 
    
            danjia = GetSinglePrice(ax, ay)
            //            MessageBox "输出danjia:" & danjia
            If danjia <= bprice and danjia>0 Then 
                Delay 100
                zongjia = GetAPrice(ax, ay)
                //                MessageBox "输出zongjia:" & zongjia
                If zongjia<=maxPrice and zongjia>0 Then 
                    buyPrice=zongjia
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
                        LeftClick 1
                        Delay 200
                        KeyPress "Enter", 3
                        Delay 300
                        singlePrice=danjia
                        totalCost = totalCost + zongjia
                        bflag=true
                    Else 
                        TracePrint "可以买，但购买失败"
                    End If
                    Call 物品搜索()
                Else 
                    flag=1
                    Delay 200
                End If
            Else 
                //					MessageBox "太贵" & danjia & "pirce=" & price
                Delay 200
                flag = 1
                //                    Call 初始化搜索条件()
            End If
        Else 
            Call 翻页()
        End If
        If bflag = true Then 
            BuyOrNot = true
            //    	MessageBox "BuyOrNot = true"
        Else 
            BuyOrNot = false
            //    	MessageBox "BuyOrNot = false"
        End If
    End If
End Function

Function SpellStr(s)
    Call 确定()
    Call 初始化搜索条件()
    di=1
    For Len(s)
        KeyPress mid(s,di,1), 1
        Delay 200
        di=di+1
    Next
    KeyPress "Space",1//32,1//空格
    Delay 200
    KeyPress "Enter", 1
    Delay 200
    Call 确定()
End Function
