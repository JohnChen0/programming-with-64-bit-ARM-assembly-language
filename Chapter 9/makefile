LIBOBJS = upper.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: addexamp2 uppertst uppertst2 uppertst3 uppertst4

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

addexamp2: addexamp2.s debug.s
	gcc $(DEBUGFLGS) -o addexamp2 addexamp2.s

uppertst: uppertst.c upper.s
	gcc $(DEBUGFLGS) -o uppertst uppertst.c upper.s

libupper.a: $(LIBOBJS)
	ar -cvq libupper.a upper.o

uppertst2: uppertst.c libupper.a
	gcc $(DEBUGFLGS) -o uppertst2 uppertst.c libupper.a

libup.so.1.0: $(LIBOBJS)
	gcc -shared -Wl,-soname,libup.so.1 -o libup.so.1.0 $(LIBOBJS)
	ln -sf libup.so.1.0 libup.so.1
	ln -sf libup.so.1.0 libup.so

uppertst3: libup.so.1.0
	gcc $(DEBUGFLGS) -o uppertst3 uppertst.c libup.so.1.0

uppertst4: uppertst4.c
	gcc $(DEBUGFLGS) -o uppertst4 uppertst4.c

clean:
	rm -f addexamp2 uppertst uppertst[2-4] libupper.a *.o libup.so*
