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

; @::+7
; +@::+2
; +2::Send, @
; +7::+@

/*
 * Space と同時押しで、emacs like な操作を実現する
 * Space 単推しではスペース
 */
Space:: Send,{Blind}{Space}
Space & q::Send, {Blind}{}
Space & w::Send, {Blind}^{BS}           ; 単語削除
Space & e::Send, {Blind}{End}
Space & r::Send, {AppsKey}              ; 右クリック
Space & t::Send, {Blind}{}
Space & y::Send, {Blind}{}
Space & u::Send, {Blind}+{Home}{BS}     ; 行のカーソル以前を削除
Space & i::Send, {Blind}{}
Space & o::Send, {Blind}^{o}
Space & p::Send, {Blind}{up}            ; Ctrl O を入力する。Vimのために。

Space & a::Send, {Blind}{Home}
Space & s::Send, {Blind}{}
Space & d::Send, {Blind}{Delete}
Space & f::Send, {Blind}{right}
Space & g::Send, {Blind}{}
Space & h::Send, {Blind}{BS}
Space & j::Send, {Blind}{Enter}
Space & k::Send, {Blind}+{End}{BS}      ; 行のカーソル以降を削除
Space & l::Send, {Blind}{Tab}

Space & z::Send, {Blind}{}
Space & x::Send, {Blind}{}
Space & c::Send, {Blind}{Esc}
Space & v::Send, {Blind}{}
Space & b::Send, {Blind}{Left}
Space & n::Send, {Blind}{down}
Space & m::Send, {Blind}{Enter}
