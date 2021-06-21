# OUTPUT: returns a status code. This can be viewed by typing
# echo $?
# "as {name}.s -o {output}.o"
# "ld {output}.o -o {name}"
# "echo $?"

# VARIABLES:
# %eax holds the system call number
# %ebx holds the return status
#

.section .data

.section .text
.globl _start
_start:
    movl $1, %eax   # command number (syscall) for exitinga program
    movl $0, %ebx   # status number to return to OS
    int $0x80       # wake kernel up to run exit command
