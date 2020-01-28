#Persistent
!c::
StringRight,cb,Clipboard,8
StringLeft,cb,cb,6
If cb = </NDL>                      ; この then 節の中に、クリップボードの中身が notes link だった場合の処理を記述する。
  tmp = notes://
  MsgBox, %tmp%
Return

; StringLeft,l,Clipboard,7            ;文字列の先頭7文字を切り出し
; StringRight,r,Clipboard,4           ;文字列の末尾4文字を切り出し
; If l = http://                      ;先頭が http://で
;     If r in jpeg,.jpg               ;末尾が jpeg .jpgのどちらかなら
;         Run,app.exe %Clipboard%     ;そのURLを引数にプログラムを起動
; Return                              ;サブルーチンを終了
; 
; 
; CS仕様書・技術系ストレージ - 個人情報保護 まとめ
; <NDL>
; <REPLICA 4925811D:001F5F8A>
; <VIEW OFF0941DF3:03965418-ON49256C9B:0022B786>
; <NOTE OFE05CD796:0EFDF2FE-ON492581CB:00090A75>
; <HINT>CN=NSHGT302/OU=HGT/OU=SRV/O=HONDA</HINT>
; <REM>Database 'CS仕様書・技術系ストレージ', View '2.カテゴリ別', Document '個人情報保護 まとめ'</REM>
; </NDL>

; 情報系 18M_PF DB - PF1　業務推進検討会議
; <NDL>
; <REPLICA 49257CE5:002809CE>
; <VIEW OF0B737CCC:0F425BF7-ON49256C3E:007C44D1>
; <NOTE OF99F6EA59:D83E7163-ON4925822D:0026482B>
; <HINT>CN=NSHGT302/OU=HGT/OU=SRV/O=HONDA</HINT>
; <REM>Database '情報系 18M_PF DB', View 'カテゴリー別', Document 'PF1　業務推進検討会議'</REM>
; </NDL>
; 
; notes://NSHGT302/49257CE5002809CE/0B737CCC0F425BF749256C3E007C44D1/99F6EA59D83E71634925822D0026482B
; 
; HINT
; REPLICA
; VIEW
; NOTE
