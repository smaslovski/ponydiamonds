	.LINK 1000

        EMT     14

	MOV    #233,R0  ; ����� 32 �������
	EMT    16	

	MOV	#0,R1   ; ������� �������
	MOV	#0,R2
	EMT	24

	MOV	#0,@#212  ; ���� � ���
	MOV	#125252,@#214   

	MOV	#12345, R4 ; ��������� ��������
	MOV	#377, R3 ; ������ ���������
CICLE:
        MOV	R4,R0
        MOV	#7,R2
        COM	R2
        BIC	R2,R0
        MOV	R0,-(SP)   ; ��������� ��������� �����                    
        MOV	#BUF,-(SP) ; ��������� �� �����                           
        MOV	#0,-(SP)  ; ������ ������� ����� ��� #0, ���� ��� �������
        JSR PC, @#INT2STR
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������
	
	MOV	#BUF,R1     ; ����� ������ � �����
	MOV	#0,R2
	EMT	20

	MOV	#40,R0      ; ������
	EMT	16

	; R4 - ������ ��������
	MOV	R4,R5
	ROL     R5
	XOR	R5,R4

	MOV	R4,R5
	ROR     R5
	XOR	R5,R4

	MOV	R4,R5
	ROL     R5
	XOR	R5,R4
        
	SOB	R3,CICLE

	HALT

.include "proc_int2str.inc"

BUF:    .BYTE   0,0,0,0,0,0 
        .EVEN
        .END

make_bk0010_rom "test_rnd.bin", 1000

