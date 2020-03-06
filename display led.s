.equ S_COUNT, 250   ;
.equ L_COUNT, 2000  ;
.equ ONE,  0x60       ;  OR 
.equ TWO,  0xCE       ;
.equ THREE,  0xEA       ;
.equ FOUR,  0x63       ;
.equ FIVE,  0xAB       ;
.equ SIX,  0xAF       ;
.equ SEVEN,  0xE0       ;
.equ EIGHT,  0xEF       ;
.equ NINE,  0xEB       ;
.equ ZERO,  0xED       ;
.equ DISPLAY, 0X200  ;
.equ HALT,     0X11 ;

SEGMENT_DISPLAY:
MOV R0, #ONE;
SWI DISPLAY ;
MOV R5,PC;
B L_LOOP;
MOV R0,#TWO;
SWI DISPLAY;
MOV R5,PC;
B L_LOOP;
MOV R0, #THREE;
SWI DISPLAY ;
MOV R5,PC;
B L_LOOP;
MOV R0,#FOUR;
SWI DISPLAY;
MOV R5,PC;
B L_LOOP;
MOV R0, #FIVE;
SWI DISPLAY ;
MOV R5,PC;
B L_LOOP;
MOV R0,#SIX;
SWI DISPLAY;
MOV R5,PC;
B L_LOOP;
MOV R0, #SEVEN;
SWI DISPLAY ;
MOV R5,PC;
B L_LOOP;
MOV R0,#EIGHT;
SWI DISPLAY;
MOV R5,PC;
B L_LOOP;
MOV R0, #NINE;
SWI DISPLAY ;
MOV R5,PC;
B L_LOOP;
MOV R0,#ZERO;
SWI DISPLAY;
MOV R5,PC;
B L_LOOP;
B SEGMENT_DISPLAY;

SWI HALT      ;

L_LOOP:
MOV r2, #L_COUNT ;

LT_LOOP:
BL S_LOOP        ;
SUBS r2,r2,#1    ;
BNE LT_LOOP      ;

MOV PC,R5        ;





S_LOOP:
MOV r1,#S_COUNT ;

ST_LOOP:

SUBS r1,r1,#1   ;
BNE ST_LOOP      ;
MOV PC,LR       ;