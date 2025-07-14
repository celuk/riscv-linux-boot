MEMORY {
  kernel_space (rwx) : ORIGIN = 0x80400000, LENGTH = 128
}

SECTIONS {
  .text : {
    hello.o(.text.kernel)
  } > kernel_space
}

