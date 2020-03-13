@author : PaletiKrishnasai



file1: .asciz "file1.txt" @ create a text file with name file1.txt and write some data into the file manually
.align			  @ .align is to make sure 'improper read' doesnt take place 	
file2: .asciz "file2.txt" @ create a text file with name file2.txt and write some data into the file manually
.align			  @ .align is to make sure 'improper read' doesnt take place

status1: .asciz "1"	  @ 1 means the strings are equal
.align
status2: .asciz "0"	  @ 0 means the strings are not equal.

fh: .word 0
.align

ldr r0,=file1
mov r1,#0
swi 0x66

ldr r1,=fh
str r0,[r1]


ldr r1,=string1
mov r2,#100 		  @ when we call swi0x6a we require 3 parameters(r2 needs size.so we used the size we gave in .skip{last line})
swi 0x6a

ldr r1,=fh
ldr r0,[r1]
ldr r1,=string2
mov r2,#100
swi 0x6a
swi 0x68

ldr r4,=status1		@ normal code to compare strings byte by byte.
ldr r1,=string1
ldr r2,=string2

loop:
ldrb r0, [r1], #1	@ldrb represents loading a string byte by byte . we load the first byte of r1 and then we increment the pointer by #1.
ldrb r3, [r2], #1	@if it is [r2 #1] instead of [r2], #1 ...it then increments first(byte) then read the byte. 
cmp r0,r3		@the above explanation is something like {a=i;i++;}  {i++;a=i;}  respectively.
bne s1

cmp r0,#0
beq end

cmp r3,#0
beq end

bal loop
s1:
ldr r4,=status2
bal end

end:
mov r0,r4
swi 0x02

swi 0x11

string1: .skip 100	  @ declaring and initializing the size of a variable string1
string2: .skip 100	  @ declaring and initializing the size of a variable string2