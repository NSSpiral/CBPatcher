BIN = /usr/bin
GCC_BIN = $(BIN)/gcc
GCC_UNIVERSAL = $(GCC_BASE)


all:
	cc -mmacosx-version-min=10.11 CBPatch.c CBPatcher.c CBPUtils.c -o CBPatcher
deca5: CBPatch.o CBPatcher.o CBPUtils.o

	libtool -static CBPatch.o CBPatcher.o CBPUtils.o -o libcbpatcher.a 
	
%.o: %.c
	cc -c -o $@ $<

clean:
	rm -rf *.o