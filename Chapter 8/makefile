FLASHOBJS = main.o
FLASHMEMOBJS = mainmem.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

ifdef DEVMEM
MEMFLAG = -DDEVMEM
else
MEMFLAG =
endif

all: flash flashmem

%.o : %.S
	gcc $(DEBUGFLGS) $(LSTFLGS) $(MEMFLAG) -c $< -o $@

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

$(FLASHOBJS): gpiomacros.S fileio.S

$(FLASHMEMOBJS): gpiomem.S fileio.S

flash: $(FLASHOBJS)
	ld -o flash $(FLASHOBJS)

flashmem: $(FLASHMEMOBJS)
	ld -o flashmem $(FLASHMEMOBJS)

clean:
	rm -f flash flashmem *.o
