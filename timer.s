number: .word 1000
ldr r2,=number
ldr r2,[r2]

mloop:

mov r3,#1
mov r0,#0x02
swi 0x201
blal ltimer

mov r3,#1
mov r0,#0x01
swi 0x201
blal ltimer

bal mloop

stimer:
swi 0x6d
mov r1,r0
loop:
swi 0x6d
subs r0,r0,r1
cmp r0,r2
blt loop

ltimer:
cmp r3,#0
bxeq r14 @go back to whichever branch has called it.
subs r3,r3,#1
bal stimer
