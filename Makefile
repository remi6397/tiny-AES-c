#CC           = avr-gcc
#CFLAGS       = -Wall -mmcu=atmega16 -Os -Wl,-Map,test.map
#OBJCOPY      = avr-objcopy
CC           = gcc
CFLAGS       = -Wall -O3 -Wl,-Map,test.map

.SILENT:
.PHONY:  clean

test.o : test.c
	# compiling test.c
	$(CC) $(CFLAGS) -c test.c -o test.o

aes.o : aes.h aes.c
	# compiling aes.c
	$(CC) $(CFLAGS) -c aes.c -o aes.o

test.out : aes.o test.o
	# linking object code to binary
	$(CC) $(CFLAGS) aes.o test.o -o test.out

clean:
	rm -f *.o *.out *.map
