#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Require
; ウィンドウが画面の端に移動されたとき自動的に整列されないようにします が生きていること



; activate previous window
F13 & z::
Send, !{tab}
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; close focus window
F13 & a::Send, #{Tab}

; close focus window
F13 & q::Send, !{F4}

DetectHiddenWindows, on

; outlook
F13 & m::
Process,Exist,outlook.exe                 ;アウトルックが起動しているかどうかを調べる
If ErrorLevel<>0                          ;起動していた場合(ErrorLevel変数にプロセスIDが格納される)
    IfWinActive,ahk_pid %ErrorLevel%      ;アウトルックがアクティブならば
        WinMinimize,ahk_pid %ErrorLevel%  ;そのプロセスのウィンドウを最小化する
    else                                  ;アクティブでないなら
        WinActivate,ahk_pid %ErrorLevel%  ;そのプロセスのウィンドウをアクティブにする
else                                      ;起動していなかった場合
    Run,OUTLOOK.EXE                       ;アウトルックを起動する
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; lotus notes
F13 & n::
Process,Exist,nlnotes.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        WinMinimize,ahk_pid %ErrorLevel%
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,nlnotes.exe
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return


; Explorer
F13 & e::
Process,Exist,explorer.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,explorer.exe
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return


; Browser
F13 & b::
Process,Exist,chrome.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,iexplore.exe
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; Excel
F13 & x::
Process,Exist,EXCEL.EXE
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,EXCEL.EXE
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; Word
F13 & w::
Process,Exist,WINWORD.EXE
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,WINWORD.EXE
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; PowerPoint
F13 & p::
Process,Exist,POWERPNT.EXE
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,POWERPNT.EXE
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return


; Hyper
F13 & c::
Process,Exist,Hyper.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        WinMinimize,ahk_pid %ErrorLevel%
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,Hyper.exe
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; focus previous/next virtual desktop
F13 & h::Send, #^{Left}
F13 & l::Send, #^{Right}

; move focus window to next monitor
; F13 & k::


#if GetKeyState("shift", "P")

F13 & k::
Send, +#{Right}
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
return

#If


;アクティブなアプリケーションと同一種類のウィンドウを水平垂直に並べる(最大4枚まで)
;アクティブウィンドウの左上座標が含まれるモニターに並べる
;元ネタ:http://neue.cc/2009/06/20_168.html
F13 & t::TileMove()
TileMove()
{
  WinGet, activeWindowID, ID, A
    WinGetPos, x, y, w, h, ahk_id %activeWindowID%
    SysGet, monitorCount, MonitorCount
    Loop, %monitorCount%
    {
      SysGet, m, MonitorWorkArea, %a_index%
        if (mLeft <= x && x <= mRight && mTop <= y && y <= mBottom)
        {
          WinGetClass, activeWindowClass, ahk_id %activeWindowID%
            WinGet, id, list, ahk_class %activeWindowClass%
            Loop, %id%
            {
w := (mRight - mLeft) / 2
     h := (id > 2) ? (mBottom - mTop) / 2 : mBottom - mTop
     x := (Mod(a_index, 2) == 1) ? mLeft : mLeft + w
     y := (a_index <= 2) ? mTop : mTop + h

     StringTrimRight, this_id, id%a_index%, 0
     WinActivate, ahk_id %this_id%
     WinWaitActive, ahk_id %this_id%
     WinMove, ahk_id %this_id%,,%x%, %y%, %w%, %h%
            }
          break
        }
    }
}

