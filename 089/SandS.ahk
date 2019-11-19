/* -------------------------------------------------------
    なんちゃって Space & Shift

        動作環境：Window NT系
        製作環境：XPSP2  Autohotkey Ver.1.0.47.06
                                    2008/09/21  eamat.
  ---------------------------------------------------------
*/
#NoEnv                  ; 変数名を解釈するとき、環境変数を無視する
#SingleInstance FORCE   ; 複数プロセスで実行の禁止
#WinActivateForce       ; タスクバーアイコン点滅防止

SAS_Init:
    ;------ user Setting -----------------------------------
    ;1:IME OFFの時だけSandSが機能するようにする 0:常に有効
    sas_ime_disable =  1

    ;1:IME OFFの時だけ[変換]を[スペース]キーにする 0:しない
    sas_h2space = 0

    ;1:IME OFFの時だけ[無変換]を[スペース]キーにする 0:しない
    sas_m2space = 0

    ;1:[無変換]+[変換]でIME ON/OFFを切り換える 0:しない
    sas_hs_ime_togle = 0

    ; SandS の実行方法を指定 (従来方式は 0)   2008.09.21
    ;  0 : [Space]押下中は [Shift]押しっぱなし※[!]や[#]の入力が効かないかも
    ;  1 : 送信時以外は [Shift]オフ           ※時々取りこぼしが発生するかも
    ;  2 : 1 かつ BlockInputを使用            ※判定中はﾏｳｽ操作も効かなくなる
    sas_ExeMode = 2

    ;SandS判定中のキーチェックタイムアウト値を指定(秒単位、小数点可)
    ; ※実行モード1で使用の場合、タイムアウト値を大きくすることで取りこぼしが
    ;   軽減されるかも知れません。
    ;   大きくしすぎると[Space]だけ入力したい場合に時間がかかります。
    sas_InputTimout := 0.1
    ;------------------------------------------------------

    ifEqual, sas_hs_ime_togle,1,    Hotkey, sc07B & sc079, SAS_ImeToggle
return
                   
;=============== Include =================
;#Include lib\IME.ahk

;-----------------------------------------------------------

;==============================================
;     HotKeys Event
;==============================================
;------- [Space] --------
$Space:: 
    if (sas_ime_disable & IME_GET())
            Send,{Space}
    else    SandS_Func(sas_ExeMode,sas_InputTimout)
return

;-------- [変換] -----------
sc079:: 
    if (sas_h2space & !IME_GET())
            Send,{Space}
     else   Send,{vk1Csc079}
return

;-------- [無変換] -----------
sc07B::
    if (sas_m2space & !IME_GET())
            Send,{Space}
     else   Send,{vk1Dsc07B}
return

;------ [無変換]+[変換] (sas_hs_ime_togle=1の時のみ) ----
SAS_ImeToggle:
  IME_SET(~IME_GET() & 0x01)
return

;==============================================
;     Shift & Space Functions
;==============================================
SandS_Func(ExeMode=1,ITimout="0.1")
{
    MatchList := "1,2,3,4,5,6,7,8,9,0,-,^,\,q,w,e,r,t,y,u,i,o,p,@,[,a,s,d,f,g,h,j,k,l,`;,:,],z,x,c,v,b,n,m,`,,.,/"
    EndKeys := "{Tab}{Enter}{Esc}{BS}{Del}{Ins}{Home}{End}{Pgup}{Pgdn}{Up}{Down}{Left}{Right}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{sc073}"    ; {sc073}:右下\

    Hotkey,$Space,OFF                   ;ｷｰﾘﾋﾟｰﾄ ｲﾍﾞﾝﾄ多発防止 2008.9.21
    SetBatchLines,-1
    SetKeyDelay,-1

    ifEqual,ExeMode,0,      Send,{Shift Down}
    ifEqual,ExeMode,2,      BlockInput,ON

    key_count := 0
    Loop 
    {
        Input,input_keys,I L1 T%ITimout%,%EndKeys%,%MatchList%

        ; 特殊キー： Send用に {} で包んどく
        ifInstring ErrorLevel, EndKey:
        {
            StringReplace,input_keys,ErrorLevel, EndKey:
            input_keys = {%input_keys%}
        }
        ;[^] : controlﾓﾃﾞﾌｧｲﾔとの混同防止  2008.09.21
        ifEqual,input_keys,^,   SetEnv,input_keys,{%input_keys%}
        ;[,] : ThinkPadだと何故か上手く送れないので変換しておく 2008.09.21
        StringReplace,input_keys,input_keys,`,,<

        StringReplace,input_keys,input_keys,%A_Space%,,ALL  ;Space除去
        len := StrLen(input_keys)
        if (len > 0)
        {   ;同時押し修飾キーチェック
            if (GetKeyState("Ctrl","P"))
                modifier_key := "^"
            if (GetKeyState("Alt","P"))
                modifier_key := "!" . modifier_key
            if (GetKeyState("LWin","P") || GetKeyState("RWin","P"))
                modifier_key := "#" . modifier_key

            ifNotEqual,ExeMode,0,      SetEnv,modifier_key,+%modifier_key%
            SendInput,%modifier_key%%input_keys%
            key_count += len
        }

        if !GetKeyState("Space","P")
            break
    }
    ifEqual,ExeMode,2,      BlockInput,OFF
    ifEqual,ExeMode,0,      Send,{Shift Up}

    ;入力文字が一つもない場合は Space 送信
    ifEqual key_count,0,   Send,{Space}
    Hotkey,$Space,ON                    ;ｷｰﾘﾋﾟｰﾄ ｲﾍﾞﾝﾄ多発防止 2008.9.21
}
