string1: .asciz "hi"
.align
string2: .asciz "i"
.align
status1: .asciz "1"
.align
status2: .asciz "0"
.align

ldr r4,=status1
ldr r1,=string1
ldr r2,=string2

loop:
ldrb r0, [r1], #1
ldrb r3, [r2], #1
cmp r0,r3
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