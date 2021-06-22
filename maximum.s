#
# %edi - holds the index of the data item being examined
# %ebx - largest data item found
# %eax - current data item
#
# memory locations:
# data_items - contains the item data. 0 = terminate
#

.section .data
data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
    movl $0, %edi                       # move 0 into the index register
    movl data_items(, %edi, 4), %eax    # load the first byte of data
    movl %eax, %ebx                     # since this is the first item, %eax is the biggest

start_loop:
    cmpl $0, %eax                       # check to see if we’ve hit the end
    je loop_exit
    incl %edi                           # load next value
    movl data_items(, %edi, 4), %eax
    cmpl %ebx, %eax                     # compare values
    jle start_loop

    movl %eax, %ebx
    jmp start_loop

loop_exit:
    # %ebx is the status code for the exit system call
    # and it already has the maximum number

    movl $1, %eax                       # 1 is the exit() syscall
    int $0x80
