UPPEROBJS = main.o upper.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: upper

main.o: fileio.S

%.o : %.S
	gcc $(DEBUGFLGS) $(LSTFLGS) -E $< -o $*.s
	as $(DEBUGFLGS) $(LSTFLGS) $*.s -o $@

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

upper: $(UPPEROBJS)
	ld -o upper $(UPPEROBJS)

upper.txt: upper main.S
	./upper

clean:
	rm -f upper *.o upper.txt main.s
