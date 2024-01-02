; km_stfr.s - ZKBD keymap - Atari ST French
;
; Copyright (c) 2023 Francois Galea <fgalea at free.fr>
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
	dc.b	$00,$1b,'&',$82,'"',"'",'(',$dd,$8a,'!',$87,$85,')','-',$08,$09	; ..&é"'(§è!çà)-..
	dc.b	'a','z','e','r','t','y','u','i','o','p',$c6,'$',$0d,$00,'q','s'	; azertyuiop^$..qs
	dc.b	'd','f','g','h','j','k','l','m',$97,'`',$00,'#','w','x','c','v'	; dfghjklmù`.#wxcv
	dc.b	'b','n',',',';',':','=',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; bn,;:=... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'<',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; <..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shift
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0',$f8,'_',$08,$09	; ..1234567890°_..
	dc.b	'A','Z','E','R','T','Y','U','I','O','P',$c8,'*',$0d,$00,'Q','S'	; AZERTYUIOP¨*..QS
	dc.b	'D','F','G','H','J','K','L','M','%',$9c,$00,'|','W','X','C','V'	; DFGHJKLM%£.|WXCV
	dc.b	'B','N','?','.','/','+',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; BN?./+... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,'7','8',$00,'-','4',$00,'6','+',$00	; .......78.-4.6+.
	dc.b	'2',$00,'0',$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 2.0Δ............
	dc.b	'>',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; >..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; caps
	dc.b	$00,$1b,'&',$90,'"',"'",'(',$dd,$8a,'!',$80,$b6,')','-',$08,$09	; ..&É"'(§è!ÇÀ)-..
	dc.b	'A','Z','E','R','T','Y','U','I','O','P',$c6,'$',$0d,$00,'Q','S'	; AZERTYUIOP^$..QS
	dc.b	'D','F','G','H','J','K','L','M',$97,'`',$00,'#','W','X','C','V'	; DFGHJKLMù`.#WXCV
	dc.b	'B','N',',',';',':','=',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; BN,;:=... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	'<',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; <..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shiftcaps
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0',$f8,'_',$08,$09	; ..1234567890°_..
	dc.b	'A','Z','E','R','T','Y','U','I','O','P',$c8,'*',$0d,$00,'Q','S'	; AZERTYUIOP¨*..QS
	dc.b	'D','F','G','H','J','K','L','M','%',$9c,$00,'|','W','X','C','V'	; DFGHJKLM%£.|WXCV
	dc.b	'B','N','?','.','/','+',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; BN?./+... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,'7','8',$00,'-','4',$00,'6','+',$00	; .......78.-4.6+.
	dc.b	'2',$00,'0',$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 2.0Δ............
	dc.b	'>',$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; >..()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; alt
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'[',']',$00,$00,$00,$00	; ..........[]....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,'\',$00,$00,'@',$00,$00,$00,$00	; ........\..@....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftalt
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'{','}',$00,$00,$00,$00	; ..........{}....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'~',$00,$00,$00,$00	; ...........~....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; altcaps
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'[',']',$00,$00,$00,$00	; ..........[]....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,'\',$00,$00,'@',$00,$00,$00,$00	; ........\..@....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftaltcaps
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'{','}',$00,$00,$00,$00	; ..........{}....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'~',$00,$00,$00,$00	; ...........~....
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; dead circumflex
	dc.b	$c6,10,' ',$5e,$c6,$5e,'.',$fa,'2',$fd,'3',$fe,'a',$83,'e',$88,'i',$8c,'o',$93,'u',$96
; dead diaeresis
	dc.b	$c8,11,$c8,$b9,' ',$5c,'A',$8e,'O',$99,'U',$9a,'a',$84,'e',$89,'i',$8b,'o',$94,'u',$81,'y',$98
; dead grave