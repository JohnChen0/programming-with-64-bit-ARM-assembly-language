
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: divexamp divexamp2 mulexamp matrixmult

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

divexamp: divexamp.s debug.s
	gcc $(DEBUGFLGS) -o divexamp divexamp.s

divexamp2: divexamp2.s debug.s
	gcc $(DEBUGFLGS) -o divexamp2 divexamp2.s

mulexamp: mulexamp.s debug.s
	gcc $(DEBUGFLGS) -o mulexamp mulexamp.s

matrixmult: matrixmult.s
	gcc $(DEBUGFLGS) -o matrixmult matrixmult.s

clean:
	rm -f divexamp divexamp2 mulexamp matrixmult
