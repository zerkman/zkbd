; km_dk.s - ZKBD keymap - PC Danish
;
; Copyright (c) 2024-2025 Francois Galea <fgalea at free.fr>
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.

; base
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0','+',$c3,$08,$09	; ..1234567890+ב..
	dc.b	'q','w','e','r','t','y','u','i','o','p',$86,$c8,$0d,$00,'a','s'	; qwertyuiopåז..as
	dc.b	'd','f','g','h','j','k','l',$91,$b3,$ab,$00,"'",'z','x','c','v'	; dfghjklæø½.'zxcv
	dc.b	'b','n','m',',','.','-',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; bnm,.-... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'<',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; <..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shift
	dc.b	$00,$1b,'!','"','#',$00,'%','&','/','(',')','=','?',$c9,$08,$09	; ..!"#.%&/()=?ח..
	dc.b	'Q','W','E','R','T','Y','U','I','O','P',$8f,$c6,$0d,$00,'A','S'	; QWERTYUIOPÅה..AS
	dc.b	'D','F','G','H','J','K','L',$92,$b2,$dd,$00,'*','Z','X','C','V'	; DFGHJKLÆØ§.*ZXCV
	dc.b	'B','N','M',';',':','_',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; BNM;:_... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'>',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; >..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; caps
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0','+',$c3,$08,$09	; ..1234567890+ב..
	dc.b	'Q','W','E','R','T','Y','U','I','O','P',$8f,$c8,$0d,$00,'A','S'	; QWERTYUIOPÅז..AS
	dc.b	'D','F','G','H','J','K','L',$92,$b2,$ab,$00,"'",'Z','X','C','V'	; DFGHJKLÆØ½.'ZXCV
	dc.b	'B','N','M',',','.','-',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; BNM,.-... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'<',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; <..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shiftcaps
	dc.b	$00,$1b,'!','"','#',$00,'%','&','/','(',')','=','?',$c9,$08,$09	; ..!"#.%&/()=?ח..
	dc.b	'q','w','e','r','t','y','u','i','o','p',$86,$c6,$0d,$00,'a','s'	; qwertyuiopåה..as
	dc.b	'd','f','g','h','j','k','l',$91,$b3,$dd,$00,'*','z','x','c','v'	; dfghjklæø§.*zxcv
	dc.b	'b','n','m',';',':','_',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; bnm;:_... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'>',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; >..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; alt
	dc.b	$00,$00,$ad,'@',$9c,'$',$ab,$9d,'{','[',']','}',$f1,'|',$00,$00	; ..¡@£$½¥{[]}±|..
	dc.b	'@',$00,$00,$be,$00,$00,$00,$00,$b4,$00,$c8,$ce,$00,$00,$00,$9e	; @..®....œ.זמ...ß
	dc.b	$00,$00,$00,$00,$cb,$00,$00,$c3,$c6,$00,$00,$00,$ae,$af,$bd,$00	; ....י..בה...«»©.
	dc.b	$00,$00,$e6,$c5,$fa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ..µד·...........
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	'\',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; \...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftalt
	dc.b	$00,$00,$00,$fd,$fe,$ac,$9b,$00,$f6,$ae,$af,$f8,$a8,$00,$00,$00	; ...²³¼¢.÷«»°¿...
	dc.b	$ea,$dd,$9b,$be,$00,$9d,$00,$00,$b5,$00,$c2,$00,$00,$00,$00,$00	; Ω§¢®.¥..Œ.א.....
	dc.b	$00,$00,$00,$00,$00,'&',$00,$00,$00,$bc,$00,$00,'<','>',$bd,$00	; .....&...¶..<>©.
	dc.b	$00,"'",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; .'..............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$aa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ¬...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; altcaps
	dc.b	$00,$00,$ad,'@',$9c,'$',$ab,$9d,'{','[',']','}',$f1,'|',$00,$00	; ..¡@£$½¥{[]}±|..
	dc.b	'@',$00,$00,$be,$00,$00,$00,$00,$b5,$00,$c8,$ce,$00,$00,$00,$00	; @..®....Œ.זמ....
	dc.b	$00,$00,$00,$00,$cb,$00,$00,$c3,$c6,$00,$00,$00,$ae,$af,$bd,$00	; ....י..בה...«»©.
	dc.b	$00,$00,$e6,$c5,$fa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ..µד·...........
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	'\',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; \...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftaltcaps
	dc.b	$00,$00,$00,$fd,$fe,$ac,$9b,$00,$f6,$ae,$af,$f8,$a8,$00,$00,$00	; ...²³¼¢.÷«»°¿...
	dc.b	$ea,$dd,$9b,$be,$00,$9d,$00,$00,$b4,$00,$c2,$00,$00,$00,$00,$9e	; Ω§¢®.¥..œ.א....ß
	dc.b	$00,$00,$00,$00,$00,'&',$00,$00,$00,$bc,$00,$00,'<','>',$bd,$00	; .....&...¶..<>©.
	dc.b	$00,"'",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; .'..............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$aa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ¬...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; dead abovering
	dc.b	$c2,4,' ',$f8,$c2,$f8,'A',$8f,'a',$86
; dead acute
	dc.b	$c3,8,' ',$ba,$c3,$ba,'E',$90,'a',$a0,'e',$82,'i',$a1,'o',$a2,'u',$a3
; dead cedilla
	dc.b	$c5,2,'C',$80,'c',$87
; dead circumflex
	dc.b	$c6,10,' ',$5e,$c6,$5e,'.',$fa,'2',$fd,'3',$fe,'a',$83,'e',$88,'i',$8c,'o',$93,'u',$96
; dead diaeresis
	dc.b	$c8,11,$c8,$b9,' ',$b9,'A',$8e,'O',$99,'U',$9a,'a',$84,'e',$89,'i',$8b,'o',$94,'u',$81,'y',$98
; dead grave
	dc.b	$c9,8,' ',$60,$c9,$60,'A',$b6,'a',$85,'e',$8a,'i',$8d,'o',$95,'u',$97
; dead hook
	dc.b	$cb,1,'f',$9f
; dead tilde
	dc.b	$ce,8,' ',$7e,$ce,$7e,'A',$b7,'N',$a5,'O',$b8,'a',$b0,'n',$a4,'o',$b1
