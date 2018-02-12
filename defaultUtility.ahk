#SingleInstance Force           ; No dialog when restarting
SetTitleMatchMode RegEx
Menu, Tray, Icon, %A_WorkingDir%\defaultUtility.ico,,1
;간단한 autohotkey script를 등록합니다.

#Include word.ahk

;;;; shift+wheel로 마우스 좌/우 스크롤
~LShift & WheelUp::  ; Scroll left.
ControlGetFocus, fcontrol, A
Loop 5  ; <-- Increase or decrease this value to scroll faster or slower.
SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINERIGHT.
return

~LShift & WheelDown::  ; Scroll right.
ControlGetFocus, fcontrol, A
Loop 5  ; <-- Increase or decrease this value to scroll faster or slower.
SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINELEFT.
return


;*RCtrl::Send {Blind}{LWin Down} 
*RWin::AppsKey

 

;;^Esc::ExitApp  ; Ctrl+Escape closes this script


#a::
loginSSO(temp)    
return

SiteLGEP:="LGEP .*"                             ;암호 입력전 site
SiteLGEP_Logined:="LGEP 2.*"                 ;암호 입력후 site
SiteLGEP_prepred:="SiteMinder Password Services .*"



loginSSO(url){
    ;함수내에서 전역변수를 사용하기 위해서 표기해야함.
    global IE
    global SiteLGEP
    global SiteLGEP_Logined
    
    
    
    IfWinExist, %SiteLGEP_Logined%
    {
        WinActivate, %SiteLGEP_Logined% 
        return true
    }
    else
    {
        url=
        (LTrim %
            https://sso.lge.com/portalRedirect.jsp?target=-SM-HTTPS%3A%2F%2Fsso.lge.com%2FportalRedirect.jsp%3Ftarget%3DHTTPS-%25253A-%25252F-%25252Fsso.lge.com-%25252Findex.jsp-%25253Flang-%25253Dkr
        )
        Run, iexplore.exe %url%
        WinWaitActive, % SiteLGEP_prepred, , 3
    
        If WinExist("ahk_class #32770") or WinExist(%SiteLGEP_prepred%)
            MsgBox, 1234143132
            
        return
        Sleep, 500
        Send, joongkeun.kim
        Send, {Tab}
        Sleep, 1000
        Send, {Tab}
        Sleep, 500
        Send, {Enter}
        url=
        (LTrim %
            newep.lge.com
        )
        Run, iexplore.exe %url%

        WinShow, %SiteLGEP%
        ;IE_SBDone(%SiteLGEP%)   
        return false
    }
    
}




