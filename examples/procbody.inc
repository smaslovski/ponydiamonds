DRAW_SYMB:
      	MOV	@#X,R1   ; ������� �������
	MOV	@#Y,R2
	EMT	24

	MOV	#0,@#212   ;������ ���
	MOV	@#GREEN,@#214   ;������� ����
	MOV	@#SYMB,R0
	EMT	16

        RTS PC

CLEAR_SYMB:
	MOV	@#X,R1   ; ������� �������
	MOV	@#Y,R2
	EMT	24

	MOV	#0,@#212   ;������ ���;
	MOV	#0,@#214   ;������ ����
	MOV	@#SYMB,R0
	EMT	16

        RTS PC

DO_DELAY:
	MOV 	R0,R3
DELAY:	NOP
	SOB	R3,DELAY
        RTS PC

DEBUG_PRINT:
        ; ���������� ������ DX � DY
	MOV	#102,R0
	ADD     @#DX,R0
	MOV	#0,R1
        EMT	22
	MOV	#102,R0
	ADD     @#DY,R0
	MOV	#1,R1
        EMT	22
        RTS PC

UPDATE_SPEED:
	; ��������� �� ����
	CMP	@#X,#35
	BNE     NEXT1
	MOV     #-1,@#DX
NEXT1:
	CMP	@#X,#0
	BNE     NEXT2
	MOV     #1,@#DX
NEXT2: 
	CMP	@#Y,#24
	BNE     NEXT3
	MOV     #-1,@#DY
NEXT3:
	CMP	@#Y,#0
	BNE     NEXT4
	MOV     #1,@#DY
NEXT4:
        RTS PC
