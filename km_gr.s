; km_gr.s - ZKBD keymap - PC Greek
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
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0','-','=',$08,$09	; ..1234567890-=..
	dc.b	';',$aa,$9c,$a8,$ab,$ac,$9f,$a0,$a6,$a7,'[',']',$0d,$00,$98,$a9	; ;ςερτυθιοπ[]..ασ
	dc.b	$9b,$ad,$9a,$9e,$a5,$a1,$a2,$c3,"'",'`',$00,'\',$9d,$ae,$af,$e0	; δφγηξκλ├'`.\ζχψω
	dc.b	$99,$a4,$a3,',','.','/',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; βνμ,./... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	$00,$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; ...()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shift
	dc.b	$00,$1b,'!','@','#','$','%','^','&','*','(',')','_','+',$08,$09	; ..!@#$%^&*()_+..
	dc.b	':',$91,$84,$90,$92,$93,$87,$88,$8e,$8f,'{','}',$0d,$00,$80,$91	; :ΣΕΡΤΥΘΙΟΠ{}..ΑΣ
	dc.b	$83,$94,$82,$86,$8d,$89,$8a,$c6,'"','~',$00,'|',$85,$95,$96,$97	; ΔΦΓΗΞΚΛ╞"~.|ΖΧΨΩ
	dc.b	$81,$8c,$8b,'<','>','?',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; ΒΝΜ<>?... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	$00,$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; ...()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; caps
	dc.b	$00,$1b,'1','2','3','4','5','6','7','8','9','0','-','=',$08,$09	; ..1234567890-=..
	dc.b	';',$91,$84,$90,$92,$93,$87,$88,$8e,$8f,'[',']',$0d,$00,$80,$91	; ;ΣΕΡΤΥΘΙΟΠ[]..ΑΣ
	dc.b	$83,$94,$82,$86,$8d,$89,$8a,$c3,"'",'`',$00,'\',$85,$95,$96,$97	; ΔΦΓΗΞΚΛ├'`.\ΖΧΨΩ
	dc.b	$81,$8c,$8b,',','.','/',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; ΒΝΜ,./... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	$00,$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; ...()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; shiftcaps
	dc.b	$00,$1b,'!','@','#','$','%','^','&','*','(',')','_','+',$08,$09	; ..!@#$%^&*()_+..
	dc.b	':',$aa,$9c,$a8,$ab,$ac,$9f,$a0,$a6,$a7,'{','}',$0d,$00,$98,$a9	; :ςερτυθιοπ{}..ασ
	dc.b	$9b,$ad,$9a,$9e,$a5,$a1,$a2,$c6,'"','~',$00,'|',$9d,$ae,$af,$e0	; δφγηξκλ╞"~.|ζχψω
	dc.b	$99,$a4,$a3,'<','>','?',$00,$00,$00,' ',$00,$00,$00,$00,$00,$00	; βνμ<>?... ......
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,'-',$00,$00,$00,'+',$00	; ..........-...+.
	dc.b	$00,$00,$00,$7f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...Δ............
	dc.b	$00,$00,$00,'(',')','/','*','7','8','9','4','5','6','1','2','3'	; ...()/*789456123
	dc.b	'0','.',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; 0...............
; alt
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$f8,$f1,$00,$00,$00	; ...........°±...
	dc.b	$fa,$00,$00,$be,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ·..╛............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$c3,$c7,$00,$00,$00,$00,$00,$bd,$00	; .......├╟.....╜.
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	'|',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; |...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftalt
	dc.b	$00,$00,$00,$fd,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...²............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$fa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ....·...........
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; altcaps
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$f8,$f1,$00,$00,$00	; ...........°±...
	dc.b	$fa,$00,$00,$be,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ·..╛............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$c3,$c7,$00,$00,$00,$00,$00,$bd,$00	; .......├╟.....╜.
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	'|',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; |...............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; shiftaltcaps
	dc.b	$00,$00,$00,$fd,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ...²............
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$fa,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ....·...........
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; ................
; dead acute
	dc.b	$c3,15,' ',$27,$80,$ea,$84,$eb,$86,$ec,$88,$ed,$8e,$ee,$93,$ef,$97,$f0,$98,$e1,$9c,$e2,$9e,$e3,$a0,$e5,$a6,$e6,$ac,$e7,$e0,$e9
; dead diaeresis
	dc.b	$c6,5,' ',$5c,$88,$f4,$93,$f5,$a0,$e4,$ac,$e8
; dead grave
	dc.b	$c7,2,' ',$60,$c7,$60
