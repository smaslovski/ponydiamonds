	.LINK 1000

        EMT     14  ; ������ �����

	MOV	#55000,R3  ; ������� �����
        MOV	#45000,R4

	; ��������� ���������� �� ����������, ����� �� ������ ����
	MOV	#100,@#177660 

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
        	
        TSTB    @#177660 ; �������� ����������, ���� �� �������
        BPL     NO_KEY   ; ���� ���, �� ������� ��������� ������

	MOV	@#177662,R0 ;��� ������� ������� � ������� R0
	CMP	R0,#10      ;������ ������� "������ �����"?
        BNE     NEXT1
	DEC	R4          ; ����� ������� �����
	 
NEXT1:	CMP	R0,#31      ;������ ������� "������ ������"?
	BNE     NEXT2
       	INC	R4          ; ����� ������� �����
NEXT2:  

NO_KEY:

        INC     R3          ; � ����� ������ ������� ������ �����

	JMP	START

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
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	MOVB	#0,(R0)+
	RTS PC    

        ; ��������� ����� ����� �������� NOP
PAUSE:
	MOV	#7777,R0
DELAY:	NOP
	SOB	R0,DELAY
	RTS PC

make_bk0010_rom "test_keyboard.bin", 1000
