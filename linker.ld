/* bootloader entry point */
ENTRY( _start )
/* kernal image sections map */
SECTIONS
{
    /* begin at 1M by convention */
    . = 1M;
    /* Multiboot header is first */
    .text BLOCK( 4K ) : ALIGN( 4K )
    {
        *( .multiboot )
        *( .text )
    }
    /* readonly data */
    .rodata BLOCK( 4K ) : ALIGN( 4K )
    {
        *( .rodata )
    }
    /* initialized readwrite data */
    .data BLOCK( 4K ) : ALIGN( 4K )
    {
        *( .data )
    }
    /* uninitialized readwrite data and stack */
    .bss BLOCK( 4K ) : ALIGN( 4K )
    {
        *( COMMON )
        *( .bss )
    }
    /* tbc */
}