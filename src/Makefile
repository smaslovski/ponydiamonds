PRG=ponydiamonds
BIN_RU=$(PRG)_ru.bin
BIN_EN=$(PRG)_en.bin

all: $(BIN_RU) $(BIN_EN)

clean:
	rm -f *.lst *.obj *.bin strings.inc

$(BIN_RU):
	iconv -f utf-8 -t koi8-r <strings-ru.utf8 >strings.inc
	make $(PRG).bin
	mv $(PRG).bin $(BIN_RU)

$(BIN_EN):
	iconv -f utf-8 -t ascii <strings-en.utf8 >strings.inc
	make $(PRG).bin
	mv $(PRG).bin $(BIN_EN)

$(PRG).bin: $(PRG).obj
	obj2bin --bkbin --base=01000 --outfile=$@ $<

%.obj: %.asm
	macro11 -o $@ -l $*.lst -rt11 -yus -ysl 64 $<

.PHONY: all clean
