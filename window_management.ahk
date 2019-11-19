#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.






/**
 * Space を Control っぽく動作させる
 */
Space & Shift::Send, {Space}
Space & h::Send, {BS}
Space & d::Send, {Delete}
Space & j::Send, {Enter}
Space & m::Send, {Enter}
Space & n::Send, {down}
Space & p::Send, {up}
Space & f::Send, {right}
Space & b::Send, {left}
Space & l::Send, {Tab}
Space & a::Send, {Home}
Space & e::Send, {End}
Space & c::Send, {Esc}

