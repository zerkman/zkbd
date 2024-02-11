
TARGETS= \
  kb_bepo.prg \
  kb_de.prg \
  kb_dk.prg \
  kb_es.prg \
  kb_fr.prg \
  kb_gb.prg \
  kb_gr.prg \
  kb_nl.prg \
  kb_no.prg \
  kb_pl.prg \
  kb_se.prg \
  kb_stfr.prg \
  kb_us.prg \

AS=vasmm68k_mot
ASOPT=-m68000 -Ftos -tos-flags=7 -nosym
CC=gcc
CFLAGS=-g -Wall

all: $(TARGETS)

clean:
	rm -f $(TARGETS) *.o

kb_%.prg: zkbd.s km_%.s
	$(AS) $(ASOPT) -Dkm_$* $< -o $@
