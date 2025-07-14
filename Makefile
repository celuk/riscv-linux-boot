CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu-

hello: hello.elf
	${CROSS_COMPILE}objcopy -O binary hello.elf hello.bin

hello.elf: hello.o hello.ld
	${CROSS_COMPILE}ld -T hello.ld --no-dynamic-linker -m elf32lriscv -static -nostdlib -s -o hello.elf hello.o

hello.o: hello.s
	${CROSS_COMPILE}as -march=rv32imac_zicsr_zifencei -mabi=ilp32 -o hello.o -c hello.s

clean:
	rm -f hello.o hello.elf hello.bin

