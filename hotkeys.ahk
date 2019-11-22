#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Require
; ウィンドウが画面の端に移動されたとき自動的に整列されないようにします が生きていること


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
Return


; Explorer
F13 & x::
Process,Exist,explorer.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,explorer.exe
Return


; Browser
F13 & b::
Process,Exist,iexplore.exe
If ErrorLevel<>0
    IfWinActive,ahk_pid %ErrorLevel%
        Send, ^{tab}
    else
        WinActivate,ahk_pid %ErrorLevel%
else
    Run,iexplore.exe
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
Return


; conemu/cmder
F13 & c::Send, ^@


F13 & h::Send, #^{Left}
F13 & l::Send, #^{Right}





