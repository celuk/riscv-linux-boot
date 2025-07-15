# riscv-linux-boot

```bash
sudo apt install gcc-riscv64-linux-gnu
export ARCH=riscv
export CROSS_COMPILE=riscv64-linux-gnu-
```

```bash
export RISCV_PREFIX=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv64-unknown-linux-gnu-
```

```bash
make ARCH=riscv PLATFORM_RISCV_XLEN=32 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=template FW_DYNAMIC=y FW_TEXT_START=0x80000100

python3 bin2hex.py fw_dynamic.elf > fw_dynamic.hex

riscv64-linux-gnu-objdump -d -M numeric,no-aliases fw_dynamic.elf > fw_dynamic.dump
```

## Compiling Linux

```bash
make mrproper

make clean

make ARCH=riscv CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu- 32-bit.config

make ARCH=riscv CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu- -j16
```

## Compiling OpenSBI with Linux Payload

```bash
make distclean

dtc -I dts -O dtb -o ./platform/template/custom.dtb ./platform/template/custom.dts

make ARCH=riscv PLATFORM_RISCV_XLEN=32 CROSS_COMPILE=/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu- PLATFORM_RISCV_ISA=rv32imac_zicsr_zifencei PLATFORM=template FW_TEXT_START=0x80000000 FW_FDT_PATH=./platform/template/custom.dtb FW_FDT_PADDING=4 FW_PAYLOAD=y FW_PAYLOAD_OFFSET=0x00040000 FW_PAYLOAD_PATH=../linux/arch/riscv/boot/Image

python3 /home/shc/projects/cva-soc/tools/bin2hex.py ./build/platform/template/firmware/fw_payload.bin > ./build/platform/template/firmware/fw_dynamic.hex

/media/shc/0EDEBC4906059163/tools/riscv-toolchain-linux/_install/bin/riscv32-unknown-linux-gnu-objdump -d -M numeric,no-aliases ./build/platform/template/firmware/fw_payload.elf > ./build/platform/template/firmware/fw_dynamic.dump
```
