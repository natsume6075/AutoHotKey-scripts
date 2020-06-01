#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Include lib\IME.ahk

Shift::
if  ( WinActive("ahk_class VirtualConsoleClass")   ){
  IME_SET(0)
  Send, çlang2
}else{
  IME_SET(0)
}
return

vk1C::
if  ( WinActive("ahk_class VirtualConsoleClass")   ){
  IME_SET(1)
  Send, çlang1{F10}{Enter} ; これだと大文字で送られる
}else{
  IME_SET(1)
}
return




j::
WinGet, vcurrentwindow, ID, A
vimestate := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
if (vimestate == 1){
  KeyWait, j
    if (A_PriorHotkey == A_ThisHotkey) && (400 > A_TimeSincePriorHotkey)
    {
      send, j{Return}
    } else {
      Send, j
    }
} else {
  Send, j
}
return


sc028::Send, +{sc027}
+sc027::Send, {sc028}
+sc028::Send, +{sc028}

@::+7
+@::+2
+2::Send, @
+7::+@




/**
 * 長押しでSpaceを殺す
 */
Space::
;[Space]キーの押し下げ状態を300ミリ秒待機
KeyWait, Space, T0.3

If (ErrorLevel)
{
  ;指定時間が経過した場合、なにもしない
    ;;指定時間経過前にキーが離された場合、バルーンメッセージを表示
    ;TrayTip, ヘルプの表示, ヘルプを表示するには[F1]キーを長押ししてください。, 10, 17
}
Else
{
  Send,{Blind}{Space}
}
KeyWait, Space
Return


/**
 * Console でのみ Space 装飾を Ctrl にする
 * それ以外ではオリジナルで emacs like な操作を実現する
 */

Space & q::Send, {Blind}{}
Space & w::Send, ^{BS}
Space & e::Send, {Blind}{End}
Space & r::Send, {AppsKey}
Space & t::Send, {Blind}{}
Space & y::Send, {Blind}{}
Space & u::Send, {Blind}+{Home}{BS}
Space & i::Send, {Blind}{}
Space & o::Send, {Blind}{}
Space & p::Send, {Blind}{up}

Space & a::Send, {Blind}{Home}
Space & s::Send, {Blind}{}
Space & d::Send, {Blind}{Delete}
Space & f::Send, {Blind}{right}
Space & g::Send, {Blind}{}
Space & h::Send, {Blind}{BS}
Space & j::Send, {Blind}{Enter}
Space & k::Send, {Blind}+{End}{BS}
Space & l::Send, {Blind}{Tab}

Space & z::Send, {Blind}{}
Space & x::Send, {Blind}{}
Space & c::Send, {Blind}{Esc}
Space & v::Send, {Blind}{}
Space & b::Send, {Blind}{Left}
Space & n::Send, {Blind}{down}
Space & m::Send, {Blind}{Enter}

