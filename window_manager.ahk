#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Require
; ウィンドウが画面の端に移動されたとき自動的に整列されないようにします が生きていること



; activate previous window
vk1D & z::
Send, !{tab}
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; expose
vk1D & a::Send, #{Tab}

; keypirinha
vk1D & space::Send, !{k}

; close focus window
vk1D & q::Send, !{F4}

DetectHiddenWindows, on

; outlook
vk1D & m::
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
vk1D & n::
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

; FileSeeker3
vk1D & f::
Process,Exist,FileSeeker3.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        WinMinimize,ahk_pid %ErrorLevel%
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,FileSeeker3
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; Explorer
vk1D & e::
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
vk1D & b::
Process,Exist,vivaldi.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,vivaldi.exe
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
Return

; Excel
vk1D & x::
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
vk1D & w::
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
vk1D & p::
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
vk1D & c::
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
vk1D & h::Send, #^{Left}
vk1D & l::Send, #^{Right}

; move focus window to next monitor
; vk1D & k::


#if GetKeyState("shift", "P")

vk1D & o::
Send, +#{Right}
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
return

vk1D & i::
Send, +#{Left}
WinGetPos, , , w, h, A
MouseMove, w/2, h/2
return

#If


;アクティブなアプリケーションと同一種類のウィンドウを水平垂直に並べる(最大4枚まで)
;アクティブウィンドウの左上座標が含まれるモニターに並べる
;元ネタ:http://neue.cc/2009/06/20_168.html
vk1D & t::TileMove()
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
