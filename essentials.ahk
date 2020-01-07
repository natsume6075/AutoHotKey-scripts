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




F1::
WinGet, vcurrentwindow, ID, A
vimestate := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
Msgbox, %vimestate% `n 0はOFF `n 1はON
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



+;::Send, :

@::+7
+@::+2
+2::Send, @
+7::+@


; ホットストリング
::kita-::
Clipboard = ｷﾀ━━━━━━(ﾟ∀ﾟ)━━━━━━ !!!!!
Send,^v
Return





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

Space & a::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^a
}else{
  Send, {Blind}{Home}
}
return

Space & b::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^b
}else{
  Send, {Blind}{Left}
}
return

Space & c::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^c
}else{
  Send, {Blind}{Esc}
}
return

Space & d::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^d
}else{
  Send, {Blind}{Delete}
}
return

Space & e::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^e
}else{
  Send, {Blind}{End}
}
return

Space & f::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^f
}else{
  Send, {Blind}{right}
}
return

Space & g::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^g
}else{

}
return

Space & h::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^h
}else{
  Send, {Blind}{BS}
}
return

Space & i::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^i
}else{

}
return

Space & j::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^j
}else{
  Send, {Blind}{Enter}
}
return

Space & k::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^k
}else{
  Send, {Blind}+{End}{BS}
}
return

Space & l::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, {Blind}{Tab}
}else{
  Send, {Blind}{Tab}
}
return

Space & m::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^m
}else{
  Send, {Blind}{Enter}
}
return

Space & n::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^n
}else{
  Send, {Blind}{down}
}
return

Space & o::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^o
}else{

}
return

Space & p::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^p
}else{
  Send, {Blind}{up}
}
return

Space & q::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^q
}else{

}
return

Space & r::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^r
}else{
  Send, {AppsKey}
}
return

Space & s::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^s
}else{

}
return

Space & t::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^t
}else{

}
return

Space & u::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^u
}else{
  Send, {Blind}+{Home}{BS}
}
return

Space & v::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^v
}else{

}
return

Space & w::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^w
}else{

}
return

Space & x::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^x
}else{

}
return

Space & y::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^y
}else{

}
return

Space & z::
if  ( WinActive("ahk_class VirtualConsoleClass") || WinActive("ahk_exe Hyper.exe")   ){
  Send, ^z
}else{

}
return

