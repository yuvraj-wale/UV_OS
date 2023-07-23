#change the value of CROSSCOMP to your cross compiler's location
#example: /home/usr/opt/cross/bin/i686-elf
readonly CROSSCOMP=path/to/cross/compiler

#assemble boot.s file
$CROSSCOMP-as --32 boot.s -o boot.o

#compile kernel.c file
$CROSSCOMP-gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#linking the kernel with kernel.o and boot.o files
$CROSSCOMP-ld -m elf_i386 -T linker.ld kernel.o boot.o -o MyOS.bin -nostdlib

#check MyOS.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot MyOS.bin

#building the iso file
mkdir -p isodir/boot/grub
cp MyOS.bin isodir/boot/MyOS.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o MyOS.iso isodir

#run it in qemu
qemu-system-i386 -cdrom MyOS.iso