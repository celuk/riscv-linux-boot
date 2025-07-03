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
