#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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
