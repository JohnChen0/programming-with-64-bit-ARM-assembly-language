

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: codesnippets distance fpcomp

%.o : %.s
	as -march="armv8.2-a+fp16" $(DEBUGFLGS) $(LSTFLGS) $< -o $@

codesnippets: codesnippets.o
	ld $(DEBUGFLGS) -o codesnippets codesnippets.o

distance: distance.s main.s
	gcc $(DEBUGFLGS) -o distance distance.s main.s

fpcomp: fpcomp.s maincomp.s
	gcc $(DEBUGFLGS) -o fpcomp fpcomp.s maincomp.s

clean:
	rm -f codesnippets distance fpcomp *.o
