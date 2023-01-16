#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode,2
#InstallKeybdHook
#UseHook

Shift::vk1D
LCtrl::LAlt
vk1D::Shift

#include layout_symbol_like_US.ahk
#include layout_with_MacBootCamp.ahk
#include control_IME.ahk
#include window_manager.ahk
#include space_emacs.ahk
#include ten_key.ahk

