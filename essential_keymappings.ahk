#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/**
 * シフトキーで IME OFF
 * 変換キー(vk1C) で IME ON
 */
#Include lib\IME.ahk
Shift:: IME_SET(0)
vk1C:: IME_SET(1)

/**
 * セミコロンキー(sc027)でセミコロンとコロンを打つ。
 * コロンキーで(sc028)でプラスとアスタリスクを打つ。
 */
sc028::Send, +{sc027}
+sc027::Send, {sc028}
+sc028::Send, +{sc028}

/**
 * 2(sc003)とシフトでアットマーク
 * 7(sc008)とシフトでアクサングラーブ
 * アットマークキー(sc01a)でアポストロフィとダブルクォーテーションを打つ。
 */
+sc003::Send, {sc01a}
+sc008::Send, +{sc01a}
sc01a::Send, +{sc008}
+sc01a::Send, +{sc003}

