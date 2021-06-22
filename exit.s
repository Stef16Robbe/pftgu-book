.section .data

.section .text
.globl _start
_start:
    movl $1, %eax   # command number (syscall) for exiting program
    movl $0, %ebx   # status number to return to OS
    int $0x80       # wake kernel up to run exit command
