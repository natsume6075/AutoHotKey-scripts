/* -------------------------------------------------------
    �Ȃ񂿂���� Space & Shift

        ������FWindow NT�n
        ������FXPSP2  Autohotkey Ver.1.0.47.06
                                    2008/09/21  eamat.
  ---------------------------------------------------------
*/
#NoEnv                  ; �ϐ��������߂���Ƃ��A���ϐ��𖳎�����
#SingleInstance FORCE   ; �����v���Z�X�Ŏ��s�̋֎~
#WinActivateForce       ; �^�X�N�o�[�A�C�R���_�Ŗh�~

SAS_Init:
    ;------ user Setting -----------------------------------
    ;1:IME OFF�̎�����SandS���@�\����悤�ɂ��� 0:��ɗL��
    sas_ime_disable =  1

    ;1:IME OFF�̎�����[�ϊ�]��[�X�y�[�X]�L�[�ɂ��� 0:���Ȃ�
    sas_h2space = 0

    ;1:IME OFF�̎�����[���ϊ�]��[�X�y�[�X]�L�[�ɂ��� 0:���Ȃ�
    sas_m2space = 0

    ;1:[���ϊ�]+[�ϊ�]��IME ON/OFF��؂芷���� 0:���Ȃ�
    sas_hs_ime_togle = 0

    ; SandS �̎��s���@���w�� (�]�������� 0)   2008.09.21
    ;  0 : [Space]�������� [Shift]�������ςȂ���[!]��[#]�̓��͂������Ȃ�����
    ;  1 : ���M���ȊO�� [Shift]�I�t           �����X��肱�ڂ����������邩��
    ;  2 : 1 ���� BlockInput���g�p            �����蒆��ϳ�����������Ȃ��Ȃ�
    sas_ExeMode = 2

    ;SandS���蒆�̃L�[�`�F�b�N�^�C���A�E�g�l���w��(�b�P�ʁA�����_��)
    ; �����s���[�h1�Ŏg�p�̏ꍇ�A�^�C���A�E�g�l��傫�����邱�ƂŎ�肱�ڂ���
    ;   �y������邩���m��܂���B
    ;   �傫�����������[Space]�������͂������ꍇ�Ɏ��Ԃ�������܂��B
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

;-------- [�ϊ�] -----------
sc079:: 
    if (sas_h2space & !IME_GET())
            Send,{Space}
     else   Send,{vk1Csc079}
return

;-------- [���ϊ�] -----------
sc07B::
    if (sas_m2space & !IME_GET())
            Send,{Space}
     else   Send,{vk1Dsc07B}
return

;------ [���ϊ�]+[�ϊ�] (sas_hs_ime_togle=1�̎��̂�) ----
SAS_ImeToggle:
  IME_SET(~IME_GET() & 0x01)
return

;==============================================
;     Shift & Space Functions
;==============================================
SandS_Func(ExeMode=1,ITimout="0.1")
{
    MatchList := "1,2,3,4,5,6,7,8,9,0,-,^,\,q,w,e,r,t,y,u,i,o,p,@,[,a,s,d,f,g,h,j,k,l,`;,:,],z,x,c,v,b,n,m,`,,.,/"
    EndKeys := "{Tab}{Enter}{Esc}{BS}{Del}{Ins}{Home}{End}{Pgup}{Pgdn}{Up}{Down}{Left}{Right}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{sc073}"    ; {sc073}:�E��\

    Hotkey,$Space,OFF                   ;����߰� ����đ����h�~ 2008.9.21
    SetBatchLines,-1
    SetKeyDelay,-1

    ifEqual,ExeMode,0,      Send,{Shift Down}
    ifEqual,ExeMode,2,      BlockInput,ON

    key_count := 0
    Loop 
    {
        Input,input_keys,I L1 T%ITimout%,%EndKeys%,%MatchList%

        ; ����L�[�F Send�p�� {} �ŕ��ǂ�
        ifInstring ErrorLevel, EndKey:
        {
            StringReplace,input_keys,ErrorLevel, EndKey:
            input_keys = {%input_keys%}
        }
        ;[^] : control���̧�ԂƂ̍����h�~  2008.09.21
        ifEqual,input_keys,^,   SetEnv,input_keys,{%input_keys%}
        ;[,] : ThinkPad���Ɖ��̂���肭����Ȃ��̂ŕϊ����Ă��� 2008.09.21
        StringReplace,input_keys,input_keys,`,,<

        StringReplace,input_keys,input_keys,%A_Space%,,ALL  ;Space����
        len := StrLen(input_keys)
        if (len > 0)
        {   ;���������C���L�[�`�F�b�N
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

    ;���͕���������Ȃ��ꍇ�� Space ���M
    ifEqual key_count,0,   Send,{Space}
    Hotkey,$Space,ON                    ;����߰� ����đ����h�~ 2008.9.21
}
