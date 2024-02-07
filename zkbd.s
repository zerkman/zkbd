; zkbd.s - Modern keyboard driver for Atari ST-compatible computers
;
; Copyright (c) 2024 Francois Galea <fgalea at free.fr>
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

	opt	o+,p=68000

	ifd	km_us
alt_is_alt	equ	1
	endif
	ifd	km_stfr
alt_is_alt	equ	1
	endif
	ifd	km_gr
dual_keymap	equ	1
	endif

; kbvbase system structure
	rsreset
kb_midivec	rs.l	1	; MIDI interrupt vector
kb_vkbderr	rs.l	1	; Keyboard error vector
kb_vmiderr	rs.l	1	; MIDI error vector
kb_statvec	rs.l	1	; Keyboard status
kb_mousevec	rs.l	1	; Keyboard mouse status
kb_clockvec	rs.l	1	; Keyboard clock
kb_joyvec	rs.l	1	; Keyboard joystick status
kb_midisys	rs.l	1	; System Midi vector
kb_kbdsys	rs.l	1	; Keyboard vector
ikbdstate	rs.b	1	; IKBD packet receive state
rembytes	rs.b	1	; remaining bytes

; Bconin ring buffer
rb_size		equ	256
	rsreset
rb_head		rs.w	1
rb_tail		rs.w	1
rb_buf		rs.b	rb_size

begin:
kbdvbase:	bra	install	; 4 bytes, will get kbdvbase pointer
p_kbshift:	dc.l	0	; Pointer to TOS kbshift
bconin_buf:	dc.w	0,0	; head, tail
		dcb.b	rb_size,0	; buf
packet:		dcb.b	8,0	; buffer for packets
kbdshift:	dc.b	0	; kbdshift value
keyrep_50hz:	dc.b	0	; 50 Hz counter
keyrep_code:	dc.b	0	; keycode for key repeat
		even
keyrep_dlcp:	dc.b	0	; counter for key repeat delay
keyrep_rtcp:	dc.b	0	; counter for key repeat rate
keyrep_delay:	dc.b	15	; key repeat response delay/0.02s
keyrep_rate:	dc.b	2	; key repeat rate/0.02s
dead_key_ptr:	dc.l	0	; pointer to dead key data
	ifd	dual_keymap
current_keymap:	dc.b	0	; current keymap
	endc

	even

	dc.l	'XBRA','ZKBD',0
ikbdsys:
	move.l	kbdvbase(pc),a3
	move.b	$fffffc00.w,d2	; ACIA control
	btst	#7,d2		; interrupt request
	beq.s	ikbdsys_end
	btst	#0,d2		; Rx data register full
	beq.s	no_new_byte

	move.l	d2,-(sp)
	bsr.s	manage_new_byte
	move.l	(sp)+,d2
no_new_byte:
	andi.b	#$20,d2		; Rx overrun
	beq.s	ikbdsys_end
	movea.l	kb_vkbderr(a3),a2
	move.b	$fffffc02.w,d0	; ACIA data
	jmp	(a2)		; jump to (rts by default)
ikbdsys_end:
	rts

manage_new_byte:
	moveq	#0,d0
	move.b	$fffffc02.w,d0	; ACIA data
	tst.b	ikbdstate(a3)	; ikbdstate = are we receiving a data packet?
	bne.s	next_packet_byte
	cmpi.b	#$f6,d0		; special status byte >= $f6
	bcs	keyboard_byte
	subi.b	#$f6,d0		; yes: new packet header byte

	moveq	#0,d1
	move.b	pktype(pc,d0.w),d1
	move.b	d1,ikbdstate(a3)	; ikbdstate (packet type)
	subq	#1,d1
	move.b	pksize(pc,d1.w),d1	; packet size
	subq	#1,d1		; remaining bytes
	move.b	d1,rembytes(a3)	; rembytes (packet size)
	addi.w	#$f6,d0
	cmpi.b	#$f8,d0
	blt.s	no_relmouse

	cmpi.b	#$fb,d0
	bgt.s	no_relmouse
	move.b	d0,packet	; $f8-$fb: relative mouse position header
	rts
no_relmouse:
	cmpi.b	#$fd,d0
	blt.s	no_joystick
	move.b	d0,packet	; $fd-$ff: joystick status
no_joystick:
	rts

pktype:	dc.b	1,2,3,3,3,3,4,5,6,7	; 1: status packet 2: absolute mouse position
					; 3: relative mouse position 4: Time of day 5: joystick report
					; 6: Joystick 0 event 7: Joystick 1 event
pksize:	dc.b	8,6,3,7,3,2,2		; packet sizes
	even

next_packet_byte:
	moveq	#0,d2
	move.b	ikbdstate(a3),d2	; packet type
	cmpi.b	#6,d2		; ikbdstate = joystick event type packet
	bcc	joystick_event

	subq	#1,d2		; type-1
	lea	packet(pc),a0
	move.l	a0,a1
	moveq	#0,d1
	move.b	pksize(pc,d2),d1	; packet size
	add.l	d1,a1		; packet end
	move.b	rembytes(a3),d1
	sub.l	d1,a1		; address for next byte
	move.b	vectbl(pc,d2),d2
	movea.l	(a3,d2.w),a2	; handler function address

	move.b	d0,(a1)		; write next byte
	subq.b	#1,rembytes(a3)	; decrement byte counter
	bne.s	endrout		; no bytes remaining (last byte?)

call_handler:
	move.l	a0,-(sp)	; data block address
	jsr	(a2)		; call handler with full data block
	addq.w	#4,sp
	clr.b	ikbdstate(a3)	; reset ikbdstate (packet fully processed)

endrout:
	rts

vectbl:	dc.b	kb_statvec,kb_mousevec,kb_mousevec,kb_clockvec,kb_joyvec
	even

; in case of joystick event ($fe/$ff), we update the joystick report data block
; and call joyvec just like this were a joystick report ($fd)
joystick_event:
	move.l	#$e6a,d1	; second byte of joystick report data
	add.b	d2,d1		; + joystick event value (6 or 7)
	subq.b	#6,d1		; joystick id (0 or 1)
	movea.l	d1,a2
	move.b	d0,(a2)		; update joystick 0 or 1 state in report data
	movea.l	kb_joyvec(a3),a2	; joyvec
	lea	packet(pc),a0	; joystick report data block
	bra.s	call_handler

; first, check modifier keys (shift,control,alt,caps)
keyboard_byte:
	moveq	#$7f,d1
	and	d0,d1		; clear release bit in keycode

	moveq	#0,d2
	cmpi.b	#$36,d1		; right shift
	beq.s	modkey_end
	addq	#1,d2
	cmpi.b	#$2a,d1		; left shift
	beq.s	modkey_end
	addq	#1,d2
	cmpi.b	#$1d,d1		; control
	beq.s	modkey_end
	addq	#1,d2
	cmpi.b	#$38,d1		; alternate
	beq.s	modkey_end
	addq	#4,d2
	cmpi.b	#$4c,d1		; altgr
	beq.s	modkey_end
	cmpi.b	#$3a,d0		; caps lock pressed
	bne	no_modifier
	bsr.s	keyclick
	bchg.b	#4,kbdshift	; toggle caps lock bit
modkey_rts:
	move.l	p_kbshift(pc),a0
	move.b	kbdshift(pc),(a0)
	rts
modkey_end:
	tst.b	d0
	bmi.s	modkey_release
	bset.b	d2,kbdshift	; set modifier key bit

	ifd	dual_keymap
	moveq	#8,d0		; alternate mask
	cmp.b	#$2a,d1		; left shift
	beq.s	dkm_test	; switch keymap if alt is on
	cmp.b	#$36,d1		; right shift
	beq.s	dkm_test
	moveq	#3,d0		; shift mask
	cmp.b	#$38,d1		; alternate
	bne.s	dkm_end
dkm_test:
	and.b	kbdshift(pc),d0	; test keyboard status
	beq.s	dkm_end		; other key not pressed
	bchg	#0,current_keymap
	endif
dkm_end:
	bra.s	modkey_rts

modkey_release:
	bclr.b	d2,kbdshift	; clear modifier key bit
	bra.s	modkey_rts

keyclick_data:
	dc.b	$00,$3b,$01,$00,$02,$00,$03,$00,$04,$00,$05,$00,$06,$00,$07,$fe
	dc.b	$08,$10,$0d,$03,$0b,$80,$0c,$01,$ff,$00
keyclick:
	btst	#0,$484.w	; bit 0 of conterm : key click
	beq.s	keyclick_end
	movem.l	d0/a0-a1,-(sp)
	lea	keyclick_data(pc),a0
	lea	$ffff8800.w,a1	; sound chip register
keyclick_loop:
	move.w	(a0)+,d0
	bmi.s	keyclick_endloop
	movep.w	d0,0(a1)
	bra.s	keyclick_loop
keyclick_endloop:
	movem.l	(sp)+,d0/a0-a1
keyclick_end:
	rts

no_modifier:
	btst	#7,d0		; test key press or release
	bne.s	key_released

	cmp.b	#$53,d0		; delete
	bne.s	no_delete

	moveq	#$ffffffef,d2	; remove caps
	and.b	kbdshift(pc),d2	; kbshift without caps
	cmp.b	#$0c,d2		; ctrl+alt+Delete
	beq	warm_reset	; warm reset
	cmp.b	#$0d,d2
	beq	cold_reset	; ctrl+alt+rshift+Delete

no_delete:
	lea	keyrep_code(pc),a0
	move.b	d0,(a0)
	move.w	keyrep_delay(pc),keyrep_dlcp-keyrep_code(a0)	; reset delay and rate
	move.b	#4,keyrep_50hz-keyrep_code(a0)
	bra.s	emit_character

key_released:
	move.b	d0,d1
	bclr	#7,d1		; scan code of released key
	cmp.b	keyrep_code(pc),d1	; was it the latest pressed key ?
	bne.s	keep_repeat

; released key was the latest pressed key: stop key repeat
	moveq	#0,d1
	move.b	d1,keyrep_code	; clear code of latest pressed key
	move.b	d1,keyrep_dlcp	; key repeat response delay
	move.b	d1,keyrep_rtcp	; key repeat rate

keep_repeat:
	cmpi.b	#$c7,d0		; clr/home released
	beq.s	key_mouseemu_but
	cmpi.b	#$d2,d0		; insert released
	bne	func_return
key_mouseemu_but:
	btst	#3,kbdshift(pc)	; alternate pressed ?
	beq	func_return

; emit a keyboard event (scan code and character)
emit_character:
; determine keymap
	moveq	#0,d2
	move.b	kbdshift(pc),d1	; altgr & b0 & b1 & caps & alt & ctrl & lshift & rshift
	lsr.b	#1,d1
	bcc.s	detkm_norshift
	or.b	#1,d1		; altgr & b0 & b1 & caps & alt & ctrl & shift
detkm_norshift:
	ifnd	alt_is_alt
	roxl.b	#2,d1		; altgr
	addx	d2,d2
	roxl.b	#3,d1		; caps
	else
	roxr.b	#3,d1		; alt
	addx	d2,d2
	roxr.b	#1,d1		; caps
	endif
	addx	d2,d2
	roxl.b	#3,d1		; shift
	addx	d2,d2
	lsl	#7,d2		; keymap id*128
	ifd	dual_keymap
	lea	kmap2(pc),a0
	tst	current_keymap
	bne.s	detkm_km2
	endif
	lea	kmap(pc),a0
detkm_km2:
	adda.w	d2,a0		; keymap address

	moveq	#0,d1
	move.b	d0,d1		; scan code+release bit (32 bit)
	andi.w	#$7f,d0		; clear release bit (16 bit)

	moveq	#3,d2
	and.b	kbdshift(pc),d2	; left or right shift
	beq.s	no_f1_f10

; left or right shift pressed
	cmpi.b	#$3b,d0		; F1
	bcs.s	no_f1_f10
	cmpi.b	#$44,d0		; F10
	bhi.s	no_f1_f10
	addi.w	#$19,d1		; F1-F10 -> F11-F20
	moveq	#0,d0
	bra	decode_done

no_f1_f10:
	move.b	(a0,d0.w),d0	; read char from keymap

	btst	#2,kbdshift(pc)	; control pressed ?
	beq.s	no_control
	cmpi.b	#$d,d0		; control + CR
	bne.s	no_ctrl_cr
	moveq	#$a,d0		; replace with LF
	bra	decode_done
no_ctrl_cr:
	cmpi.b	#$47,d1		; clr/home
	bne.s	no_ctrl_clrhome
	addi.w	#$30,d1		; Control + clr/home -> $77
	bra	decode_done
no_ctrl_clrhome:
	cmpi.b	#$4b,d1		; left arrow
	bne.s	no_ctrl_left
	moveq	#$73,d1		; control + left arrow
	moveq	#0,d0		; no associated character
	bra	decode_done
no_ctrl_left:
	cmpi.b	#$4d,d1		; right arrow
	bne.s	no_ctrl_right
	moveq	#$74,d1		; control + right arrow
	moveq	#0,d0
	bra	decode_done
no_ctrl_right:
	cmpi.b	#$32,d0		; control + '2'
	bne.s	no_ctrl_2
	moveq	#0,d0		; null character
	bra	decode_done
no_ctrl_2:
	cmpi.b	#$36,d0		; control + '6'
	bne.s	no_ctrl_6
	moveq	#$1e,d0		; record separator character
	bra	decode_done
no_ctrl_6:
	cmpi.b	#$2d,d0		; control + -
	bne.s	no_ctrl_minus
	moveq	#$1f,d0		; unit separator
	bra	decode_done
no_ctrl_minus:

no_control:
	btst	#3,kbdshift(pc)	; alternate pressed ?
	beq	no_alternate

	cmpi.b	#$62,d1		; help
	bne.s	no_alt_help
	addq.w	#1,$4ee.w	; _dumpflg
	bra	func_return

kbdclickbut:	dc.b	$47,$c7,$52,$d2	; home,/home,insert,/insert
no_alt_help:
	moveq	#3,d2
msclick_loop:
	cmp.b	kbdclickbut(pc,d2.w),d1
	beq	mouse_click
	dbra	d2,msclick_loop

	moveq	#3,d2
	and.b	kbdshift(pc),d2	; shift status
	beq.s	no_shift
	moveq	#1,d2
	bra.s	test_arrows
no_shift:
	moveq	#8,d2

test_arrows:
	cmpi.b	#$48,d1		; up arrow
	bne.s	no_alt_up
	moveq	#0,d1		; x pos: +0
	neg	d2		; y pos: -1/-8 (already in d2)
	bra	mouse_move
no_alt_up:
	cmpi.b	#$4b,d1		; left arrow
	bne.s	no_alt_left
	neg	d2
	move	d2,d1		; x pos: -1/-8
	moveq	#0,d2		; y pos: +0
	bra	mouse_move
no_alt_left:
	cmpi.b	#$4d,d1		; right arrow
	bne.s	no_alt_right
	move	d2,d1		; x pos: +1/+8
	moveq	#0,d2		; y pos: +0
	bra	mouse_move
no_alt_right:
	cmpi.b	#$50,d1		; down arrow
	bne.s	no_alt_down
	moveq	#0,d1		; x pos: +0
	bra	mouse_move	; y pos: +1/+8 (already in d2)
no_alt_down:

	btst	#2,kbdshift(pc)	; control ?
	bne.s	control

	cmpi.b	#2,d1		; 1
	bcs.s	no_upper_row
	cmpi.b	#$d,d1		; -
	bhi.s	no_upper_row
	addi.b	#$76,d1		; alternate + upper row keys, add $76 ?
	bra.s	character_zero
no_upper_row:
	cmpi.b	#$41,d0		; A
	bcs.s	no_a_to_z
	cmpi.b	#$5a,d0		; Z
	bhi.s	no_a_to_z
character_zero:
	moveq	#0,d0
	bra.s	decode_done
no_a_to_z:
	cmpi.b	#$61,d0		; a
	bcs.s	decode_done
	cmpi.b	#$7a,d0		; z
	bhi.s	decode_done
	bra.s	character_zero

no_alternate:
	btst	#2,kbdshift(pc)	; control
	beq.s	decode_done

control:
	andi.w	#$1f,d0		; generate command characters

decode_done:
	asl.w	#8,d1
	add.w	d1,d0		; scancode<<8 | ascii

; dead keys management
	moveq	#0,d2
	move.l	dead_key_ptr(pc),d1
	beq.s	no_dead_key

	clr.l	dead_key_ptr
	move.l	d1,a0
	move.b	(a0)+,d2	; number of chars
	subq.w	#1,d2
dead_key_char_loop:
	cmp.b	(a0)+,d0	; character match?
	beq.s	dead_key_match
	addq.l	#1,a0
	dbra	d2,dead_key_char_loop
	rts			; character not found, do nothing
dead_key_match:
	move.b	(a0)+,d0	; replace character
	bra.s	dead_key_done

no_dead_key:
	ifd	dual_keymap
	lea	kmap2+1024(pc),a0
	tst	current_keymap
	bne.s	dead_key_loop
	endif
	lea	kmap+1024(pc),a0	; dead keys definitions
dead_key_loop:
	move.b	(a0)+,d2	; next character
	beq.s	dead_key_done
	cmp.b	d2,d0		; compare next character
	beq.s	dead_key_found
	move.b	(a0)+,d2	; number of combos for current key
	add.b	d2,d2
	add.w	d2,a0		; next key
	bra.s	dead_key_loop

dead_key_found:
	move.l	a0,dead_key_ptr	; save key data ptr
	rts

dead_key_done:
	bsr	keyclick

	lea	bconin_buf(pc),a0
	move.w	rb_tail(a0),d1	; tail of character ring buffer
	addq.w	#4,d1		; increment the tail index
	cmp.w	#rb_size,d1	; behind last position ?
	bcs.s	rb_nolast
	moveq	#0,d1		; loop to beginning
rb_nolast:
	cmp.w	rb_head(a0),d1	; have we reached buffer head?
	beq.s	func_return	; yes: ignore the new char
	lea	rb_buf(a0,d1.w),a2

	btst	#3,$484.w	; integrate kbshift in Bconin data
	beq.s	no_set_kbshift
	swap	d0
	move.b	kbdshift(pc),d0	; kbshift byte
	swap	d0
no_set_kbshift:
	lsl.l	#8,d0
	lsr.w	#8,d0		; Bconin value
	move.l	d0,(a2)		; write entry in ring buffer
	move.w	d1,rb_tail(a0)	; update ring buffer tail
func_return:
	rts

; Alternate + home or insert pressed or released
; d1: key code with press/release bit
mouse_click:
	moveq	#5,d3		; right button
	btst	#4,d1		; differentiate between insert / clrhome
	beq.s	msck_leftbut
	moveq	#6,d3		; left button
msck_leftbut:
	btst	#7,d1		; set/release
	beq.s	msck_press
	bclr	d3,kbdshift
	bra.s	msck_release
msck_press:
	bset	d3,kbdshift
msck_release:
	move.l	p_kbshift(pc),a0
	move.b	kbdshift(pc),(a0)
	moveq	#0,d1		; x movement
	moveq	#0,d2		; y movement

; d1: x movement, d2: y movement
mouse_move:
	lea	packet(pc),a0	; mouse movement string buffer
	movea.l	kb_mousevec(a3),a2
	clr.l	d0

	moveq	#$60,d0		; mouse buttons mask
	and.b	kbdshift(pc),d0	; mouse buttons
	lsr.b	#5,d0		; move to lsb
	addi.b	#$f8,d0		; ikbd relative move code with mouse buttons
	move.b	d0,0(a0)
	move.b	d1,1(a0)
	move.b	d2,2(a0)
	jsr	(a2)

	rts

cold_reset:
	move	#$2700,sr
	lea	clrmem(pc),a0
	move.w	#$f,d0
	movea.w	#8,a1
cdcp_loop:
	move.l	(a0)+,(a1)+
	dbra	d0,cdcp_loop
	jmp	8.w

clrmem:
	lea	warm_reset(pc),a0
	move.l	a0,8.w		; bus error
	lea	clrmem_addr(pc),a0
	moveq	#0,d0
	move.l	d0,d1
	move.l	d0,d2
	move.l	d0,d3
	move.l	d0,d4
	move.l	d0,d5
	move.l	d0,d6
	move.l	d0,d7
; Infinite memory clear loop, will end with bus error
clrmem_loop:
	movem.l	d0-d7,(a0)
	adda.w	#$20,a0
	bra.s	clrmem_loop

warm_reset:
	movea.l	4.w,a0		; reset vector
	jmp	(a0)
clrmem_addr:

	dc.l	'XBRA','ZKBD',0
xbios:
	lea	xbios_tbl(pc),a1
	move.l	xbios-4(pc),-(sp)
	bra.s	biosmain

	dc.l	'XBRA','ZKBD',0
bios:
	lea	bios_tbl(pc),a1
	move.l	bios-4(pc),-(sp)
biosmain:
	move	usp,a0		; user call stack
	btst.b	#5,(sp)		; called from supervisor mode?
	beq.s	bsusr
	lea	6(sp),a0	; supervisor call stack
	tst	$59e.w		; _longframe
	beq.s	bsusr
	addq.l	#2,a0		; two additional bytes on 030+
bsusr:
	move	(a0)+,d1	; calling opcode
bsloop:
	move	(a1)+,d0	; opcode
	bmi.s	bsup		; end of opcode list
	addq.l	#2,a1		; next entry
	cmp	d1,d0		; matching opcode?
	bne.s	bsloop
	move	-(a1),d1
	lea	xbios_tbl(pc),a1
	adda.w	d1,a1
	addq.l	#4,sp
	jmp	(a1)		; make the call
bsup:
	rts			; go to OS code

xbios_tbl:	dc.w	35,kbrate-xbios_tbl
		dc.w	-1
bios_tbl:	dc.w	11,kbshift-xbios_tbl
		dc.w	-1

kbrate:
	moveq	#0,d0
	move.w	keyrep_delay(pc),d0
	move	(a0)+,d1	; new delay
	bmi.s	kbrt_nodelay
	move.b	d1,keyrep_delay
kbrt_nodelay:
	move	(a0)+,d1	; new rate
	bmi.s	kbrt_norate
	move.b	d1,keyrep_rate
kbrt_norate:
	rte

bconstat_2:
	moveq	#0,d0
	move.w	bconin_buf+rb_head(pc),d0
	sub.w	bconin_buf+rb_tail(pc),d0
	beq.s	bcst_end
	moveq	#-1,d0
bcst_end:
	rts

bconin_2_wait:
	stop	#$2300
bconin_2:
	move.w	bconin_buf+rb_head(pc),d0
	cmp.w	bconin_buf+rb_tail(pc),d0
	beq.s	bconin_2_wait
	move	sr,-(sp)
	move	#$2700,sr
	lea	bconin_buf(pc),a0
	move.w	rb_head(a0),d1
	cmp.w	rb_tail(a0),d1
	beq.s	bconin_end
	addq.w	#4,d1
	cmp.w	#rb_size,d1
	bcs.s	bconin_nowrap
	moveq	#0,d1
bconin_nowrap:
	move.l	rb_buf(a0,d1.w),d0
	move.w	d1,rb_head(a0)
bconin_end:
	move	(sp)+,sr
	rts

kbshift:
	moveq	#0,d0
	move.b	kbdshift(pc),d0
	move	(a0),d1		; mode
	bmi.s	kbshift_end
	move.b	d1,kbdshift
	move.l	p_kbshift(pc),a0
	move.b	d1,(a0)
kbshift_end:
	rte

	dc.l	'XBRA','ZKBD',0
timer_c:
	tst.b	keyrep_rtcp	; key repeat is on?
	beq.s	tc_up
	subq.b	#1,keyrep_50hz
	bne.s	tc_up
	move.b	#4,keyrep_50hz
	tst.b	keyrep_dlcp	; has delay passed?
	beq.s	tc_rt
	subq.b	#1,keyrep_dlcp	; decrement repeat counter
	bne.s	tc_up
	bra.s	tc_send		; counter=0, send keycode
tc_rt:	sub.b	#1,keyrep_rtcp	; has repeat delay passed?
	bne.s	tc_up
	move.b	keyrep_rate(pc),keyrep_rtcp
tc_send:
	movem.l	d0-d3/a0-a3,-(sp)
	move.l	kbdvbase(pc),a3
	moveq	#0,d0
	move.b	keyrep_code(pc),d0
	bsr	emit_character
	movem.l	(sp)+,d0-d3/a0-a3
tc_up:	move.l	timer_c-4(pc),-(sp)
	rts

kmap:
	ifd	km_bepo
	include	"km_bepo.s"
	endif
	ifd	km_de
	include	"km_de.s"
	endif
	ifd	km_dk
	include	"km_dk.s"
	endif
	ifd	km_es
	include	"km_es.s"
	endif
	ifd	km_fr
	include	"km_fr.s"
	endif
	ifd	km_gb
	include	"km_gb.s"
	endif
	ifd	km_gr
	include	"km_us.s"
	dc.b	0
kmap2:	include	"km_gr.s"
	endif
	ifd	km_nl
	include	"km_nl.s"
	endif
	ifd	km_no
	include	"km_no.s"
	endif
	ifd	km_pl
	include	"km_pl.s"
	endif
	ifd	km_se
	include	"km_se.s"
	endif
	ifd	km_stfr
	include	"km_stfr.s"
	endif
	ifd	km_us
	include	"km_us.s"
	endif

	dc.b	0
	even

end_resident:

install:
	lea	hello_txt(pc),a0
	bsr	cconws

	move	#34,-(sp)	; Kbdvbase
	trap	#14
	addq.l	#2,sp
	move.l	d0,kbdvbase

	pea	sup_install(pc)
	move	#38,-(sp)	; Supexec
	trap	#14
	addq.l	#6,sp

	tst	d0		; error?
	beq.s	term_res

	lea	err_tos_txt(pc),a0
	bsr	cconws
	clr	-(sp)		; Pterm
	trap	#1

term_res:
	clr	-(sp)
	move.l	#end_resident-begin+256,-(sp)
	move	#$31,-(sp)	; Ptermres
	trap	#1

sup_install:
	move.l	$4f2.w,a0	; _sysbase
	move	2(a0),d0	; TOS version
	cmp	#$102,d0	; must be >= 1.02
	bcc.s	tos_ok
	moveq	#1,d0		; error code
	rts

tos_ok:
	move.l	$24(a0),p_kbshift
	move	sr,-(sp)
	move	#$2700,sr

	move.l	kbdvbase(pc),a0
	move.l	kb_kbdsys(a0),ikbdsys-4
	move.l	#ikbdsys,kb_kbdsys(a0)

	move.l	$b4.w,bios-4
	move.l	#bios,$b4.w
	move.l	$b8.w,xbios-4
	move.l	#xbios,$b8.w
	move.l	$114.w,timer_c-4
	move.l	#timer_c,$114.w

	move.l	#bconstat_2,$51e+8.w	; xconstat[2]
	move.l	#bconin_2,$53e+8.w	; xconin[2]

	move	(sp)+,sr
	moveq	#0,d0		; no error
	rts

cconws:
	move.l	a0,-(sp)
	move	#9,-(sp)	; Cconws
	trap	#1
	addq.l	#6,sp
	rts

hello_txt:
	dc.b	13,10
	dc.b	27,"p- ZKBD keyboard driver v1.1 -",27,"q",13,10
	dc.b	"by Fran",$87,"ois Galea",13,10,0
err_tos_txt:
	dc.b	"Does not work on TOS <1.02 !",13,10,0
