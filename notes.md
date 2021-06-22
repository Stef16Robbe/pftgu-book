# Chapter 3

## Commands:
**Compiling and running:** 
* as test.s -o test.o
* ld test.o -o test
* echo $?
         
## Registers:
**General-purpose registers:**
* %eax: holds the system call number
* %ebx: holds the return status (0 - 255)
* %ecx
* %edx
* %edi
* %esi

**Special-purpose registers:**
* %ebp
* %esp
* %eip
* %eflags: status register (result of comparison is stored here)

## Memory:
**Data allocation:**
* .byte: bytes that take up 1 storage location for each number (0-255)
* .int: actual ints. 2 storage locations per number (0-65535)
* .long: take up 4 storage locations (0-4294967295)
* .ascii: characters. 1 storage location (byte)
    * \0: terminating character (end of characters)
    * \n: newline
    * \t: tab

**Adressing modes:**
* direct addressing mode
    * This loads %register with the value at memory address ADDRESS
    * movl ADDRESS, %register
* indexed addressing mode
    *  let’s say that we had a string of bytes as string_start and wanted to access the third one, and %ecx held the value 2. If you wanted to load it into %eax you could do the following:
    * movl string_start(, %register1, 1), %register2
* indirect addressing mode
    * if %eax held an address, we could move the value at that address to %ebx by doing the following:
    * movl (%eax), %ebx
* base pointer addressing mode
    * Base-pointer addressing is similar to indirect addressing, except that it adds a constant value to the address in the register. For example, if you have a record where the age value is 4 bytes into the record, and you have the address of therecord in %eax, you can retrieve the age into %ebx by issuing the following instruction:
    * movl  4(%eax), %ebx
* immediate mode
    * load values directly into a register:
    * movl $number, %register
* register addressing mode
    * Register mode simply moves data in or out of a register. In all of our examples, register addressing mode was used for the other operand
    * 

## Imp code lines:
* movl x,y
    * move long (4 bytes)
    * copies value x into y
* movl data_items(, %edi, 4), %eax
    * writing indexed addressing mode instructions
    * movl ADDRESS_OR_OFFSET(%BASE_OR_OFFSET,%INDEX,MULTIPLIER)
        * calculating address: 
            FINAL ADDRESS = ADDRESS_OR_OFFSET + %BASE_OR_OFFSET + MULTIPLIER * %INDEX
* jump statements:
    * je: jump if compared values were equal
    * jg: jump if second value greater than first value
    * jge: jump if second value greater than or equal to first value
    * jle: jump if second value less than or equal to first value
    * jmp: jump no matter what
* incl: increment long (by one)
* cmpl: compare longs
* movb: move a byte

## Misc:
* '\$' in front of number for immedate mode addressing (no '\$' = "grab whats at adress x")
* "int" = interrupt, "An 'interrupt' interrupts the normal program flow, and transfers control from our program to Linux so that it will do a system call"
* 32-bit registers have an 'e' in front, 64-bit registers have a 'r'

# Chapter 4


