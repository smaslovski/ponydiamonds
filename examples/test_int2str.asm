	.LINK 1000

        EMT     14

	MOV    #233,R0  ; ����� 32 �������
	EMT    16	

	MOV	#0,R1   ; ������� �������
	MOV	#0,R2
	EMT	24

	MOV	#0,@#212  ; ���� � ���
	MOV	#125252,@#214   

	MOV	#0, R5
	MOV	#1, R4
CICLE:
        MOV	R5,-(SP)   ; ��������� ��������� �����                    
        MOV	#BUF,-(SP) ; ��������� �� �����                           
        MOV	#60,-(SP)  ; ������ ������� ����� ��� #0, ���� ��� �������
        JSR PC, @#INT2STR
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������
	
	MOV	#BUF,R1     ; ����� ������ � �����
	MOV	#0,R2
	EMT	20

	MOV	#40,R0      ; ������
	EMT	16

	ADD     R4, R5  ; ����������� ����� � ��� ����
	ADD	#4, R4

	CMP 	R5,#62342
	BLT	CICLE

	HALT

.include "proc_int2str.inc"

BUF:    .BYTE   0,0,0,0,0,0 
        .EVEN
        .END

make_bk0010_rom "test_int2str.bin", 1000
