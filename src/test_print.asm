	.LINK 1000

        EMT     14

	MOV    #233,R0  ; ����� 32 �������
	EMT    16	
	MOV    #232,R0  ; ������� �������
	EMT    16	

START:	MOV	#40000,R1
	MOV	#177,R2
ROW:	MOV	#20,R3
COL:	MOVB	#377,(R1)+
	MOVB	#252,(R1)+
	MOVB	#125,(R1)+
	MOVB	#000,(R1)+
	DEC	R3
	CMP	R3,#0
	BNE	COL
	DEC	R2
	CMP	R2,#0
	BNE	ROW

	MOV	#7,R1   ; ������� �������
	MOV	#16,R2
	EMT	24

	MOV	#177777,@#212   ;������� ���;
	MOV	#52525,@#214   ;����� ����;
	MOV	#101,R0
	EMT	16

	MOV	#52525,@#212   ;����� ���;
	MOV	#177777,@#214  ;������� ����;
	MOV	#60,R0
	EMT	16

	MOV	#52525,@#212   ;����� ���;
        MOV	#125252,@#214   ;������� ����
	MOV	#44,R0
	EMT	16

	MOV	#0,@#212    ;������ ���;
        MOV	#125252,@#214   ;������� ����
	MOV	#102,R0
	EMT	16

	MOV	#125252,@#212    ;������� ���;
        MOV	#0,@#214   ;������ ����
	MOV	#103,R0
	EMT	16

	JMP	START

make_bk0010_rom "test_print.bin", 1000
