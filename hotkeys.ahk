#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

sc03A & m::
Process,Exist,OUTLOOK.EXE               ;アウトルックが起動しているかどうかを調べる
If ErrorLevel<>0                        ;起動していた場合(ErrorLevel変数にプロセスIDが格納される)
    WinActivate,ahk_pid %ErrorLevel%    ;そのプロセスのウィンドウをアクティブにする
else                                    ;起動していなかった場合
    Run,OUTLOOK.EXE                     ;アウトルックを起動する

sc03A & a::

; sc03A & t::Send, {Blind}{Ctrl DownTemp}{Shift DownTemp}
; sc03A & t Up::Send, {Blind}{Ctrl Up}{Shift Up}
