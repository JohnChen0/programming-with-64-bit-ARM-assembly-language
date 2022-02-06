
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

all: distance matrixmultneon

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

distance: distance.s main.s
	gcc $(DEBUGFLGS) -o distance distance.s main.s

matrixmultneon: matrixmultneon.s
	gcc $(DEBUGFLGS) -o matrixmultneon matrixmultneon.s

clean:
	rm -f distance matrixmultneon
