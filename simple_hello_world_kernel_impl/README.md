# A simple "Hello World!" kernel implementation (Bare-Bones)

This is a simple hello world kernel that is able to start up, print a message to the output device and then loop endlessly. While simple and useless, it serves as a great starting point for a real system.

## Requirements
- GNU/Linux : Any distribution
- Assembler : GNU Assembler(or NASM)
- GCC : GNU Compiler Collection, C compiler.
- Xorriso : A package that creates, loads, manipulates ISO 9660 filesystem images.
- grub-mkrescue : Make a GRUB rescue image, this package internally calls the xorriso functionality to build an iso image.
- QEMU : Quick EMUlator to boot our kernel in virtual machine without rebooting the main system.

## Usage
- Before using the following command change the values of `CROSSCOMP` in `run.sh` file to your crosscompiler's location (you need to set up a cross compiler first, check [this](https://wiki.osdev.org/GCC_Cross-Compiler)).
- `cd` in root directory at `simple_hello_world_kernel_impl`.
- Now run the following command :
  ```
  sh run.sh
  ```
- Output files generated :
  - `root.o`
  - `kernel.o`
  - `MyOS.bin`
  - `MyOS.iso`
  - `isodir/boot` folder.

