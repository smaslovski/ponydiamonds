	.LINK 1000

        EMT     14

	MOV    #233,R0  ; ����� 32 �������
	EMT    16	
	MOV    #232,R0  ; ������� �������
	EMT    16

	; ��������� ����������
	MOV	#7,@#X
	MOV	#22,@#Y
	MOV	#1,@#DX
	MOV	#-1,@#DY

START:
        JSR PC, @#DRAW_SYMB

        JSR PC, @#DEBUG_PRINT

	MOV	@#PAUSE,R0
        JSR PC, @#DO_DELAY

	JSR PC, @#CLEAR_SYMB
 
	ADD	@#DX,@#X
	ADD	@#DY,@#Y

	JSR PC,	@#UPDATE_SPEED

	JMP	START

.include "procbody.inc"

; ���� ���������� ��� �����
X:      .WORD   0
Y:      .WORD   0
DX:     .WORD   0
DY:     .WORD   0
GREEN:  .WORD   125252
SYMB:   .WORD   44
PAUSE:  .WORD   7777
        .EVEN
        .END

make_bk0010_rom "test_proc.bin", 1000
