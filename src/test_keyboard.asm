	.LINK 1000

        EMT     14  ; ������ �����

	MOV	#55000,R3  ; ������� �����
        MOV	#45000,R4

	; ��������� ���������� �� ����������, ����� �� ������ ����
	BIS	#100,@#177660 

START:	
        MOV	R3,R0          ; ������ ���� �����
        JSR PC, @#DRAW_LINE

        MOV	R4,R0          ; ������ ������ �����
        JSR PC, @#DRAW_LINE
        
	JSR PC, PAUSE          ; ������ �����

	MOV	R3,R0          ; ������� ���� �����
	JSR PC,	@#CLEAR_LINE

	MOV	R4,R0          ; ������� ������ �����
	JSR PC,	@#CLEAR_LINE
        	
        JSR PC, @#KEY_TESTER

	CMP	R1,#0       ;�� ���� ������� � ��� ���������
        BEQ     NO_KEY

        CMP	R1,#1       ; ���� ����� ������� (1), ���� � KEY1
        BEQ     KEY1
	 
	; ��������� ������ ��� ���������
	CMP	R0,#31      ; ������������ ������� "������ ������"?
	BNE     S1
       	INC	R4          ; ����� ������� ����� �����������
S1:  
	CMP	R0,#10      ; ������������ ������� "������ �����"?
	BNE     S2
       	DEC	R4          ; ����� ������� ����� �����������

S2:
        JMP	NO_KEY
KEY1:
        ; ��������� ������ ��� �������
	CMP	R0,#33      ; ������ ������� "������ ����"?
	BNE     S3
       	ADD	#400, R4    ; ����� ������� ����� ���������
S3:  
	CMP	R0,#32      ; ������ ������� "������ �����"?
	BNE     S4
       	SUB	#400, R4    ; ����� ������� ����� ���������

S4:

NO_KEY:

        INC     R3          ; � ����� ������ ������� ������ �����
     
	JMP	START

.include "proc_keytester.inc"

        ; ��������� ��������� ����� �����������
        ; R0 - ������� ������
DRAW_LINE:
	MOVB	#377,(R0)+
	MOVB	#377,(R0)+
	MOVB	#377,(R0)+
	MOVB	#252,(R0)+
	MOVB	#252,(R0)+
	MOVB	#252,(R0)+
	MOVB	#125,(R0)+
	MOVB	#125,(R0)+
	MOVB	#125,(R0)+
	RTS PC

        ; ��������� �������� ����� �����������
        ; R0 - ������� ������
CLEAR_LINE:
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	CLRB	(R0)+
	RTS PC    

        ; ��������� ����� ����� �������� NOP
PAUSE:
	MOV	#7777,R0
DELAY:	NOP
	SOB	R0,DELAY
	RTS PC

make_bk0010_rom "test_keyboard.bin", 1000
