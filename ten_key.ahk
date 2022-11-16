#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
 * 変換キー(vk1C) と同時押しで、数字を入力する。
 * m,.jkluio- -> 1234567890
 */

vk1C & m::Send, {Blind}{Numpad1}
vk1C & ,::Send, {Blind}{Numpad2}
vk1C & .::Send, {Blind}{Numpad3}
vk1C & j::Send, {Blind}{Numpad4}
vk1C & k::Send, {Blind}{Numpad5}
vk1C & l::Send, {Blind}{Numpad6}
vk1C & u::Send, {Blind}{Numpad7}
vk1C & i::Send, {Blind}{Numpad8}
vk1C & o::Send, {Blind}{Numpad9}
vk1C & -::Send, {Blind}{Numpad0}

