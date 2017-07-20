all: Image

.PHONY=clean run-qemu

run-qemu: bootsect.o
	qemu-system-i386 -boot a -fda bootsect

bootsect.o:
	as  --32 bootsect.S -o bootsect.o

bootsect: ld-bootsect.ld bootsect.o
	ld -T ld-bootsect.ld bootsect.o -o bootsect
	objcopy -O binary -j .text bootsect

clean:
	rm -f *.o