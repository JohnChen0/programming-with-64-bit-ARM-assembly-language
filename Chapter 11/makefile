
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: divexamp mulexamp matrixmult

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

divexamp: divexamp.s debug.s
	gcc $(DEBUGFLGS) -o divexamp divexamp.s

mulexamp: mulexamp.s debug.s
	gcc $(DEBUGFLGS) -o mulexamp mulexamp.s

matrixmult: matrixmult.s
	gcc $(DEBUGFLGS) -o matrixmult matrixmult.s

clean:
	rm -f divexamp mulexamp matrixmult
