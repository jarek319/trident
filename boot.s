/* Based on wiki.osdev.org/Bare_Bones */
/* Multiboot Header Constants */
.set ALIGN,     1<<0                /* align on page boundaries */
.set MEMINFO,   1<<1                /* memory map */
.set FLAGS,     ALIGN | MEMINFO     /* Multiboot flag */
.set MAGIC,     0x1BADB002          /* bootloader magic number */
.set CHECKSUM,  -( MAGIC + FLAGS )  /* Multiboot checksum */
/* magic numbers to mark the program as a multiboot kernel */
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM
/* allocate a small 16384 byte stack with two symbols */
.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:
/* _start is the entry point to the kernel */
.section .text
.global _start
.type _start, @function
_start:
    /* now in multiboot-standard defined environment */
    /* we hav da powa */
    /* set esp register to point to top of stack */
    mov $stack_top, %esp
    /* initialize processor state */

    /* enter high level kernel */
    call kernel_main
    /* put computer into infinite loop */
    cli
1:  hlt
    jmp 1b

/* set size of _start symbol */
.size _start, . - _start
