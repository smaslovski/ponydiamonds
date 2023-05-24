	.LINK 1000

        EMT     14

	MOV    #233,R0  ; ����� 32 �������
	EMT    16	

	MOV	#0,R1   ; ������� �������
	MOV	#0,R2
	EMT	24

	MOV	#0,@#212  ; ���� � ���
	MOV	#125252,@#214   

	MOV	#MSG,R1     ; ����� ������ �� ��������� � ����� �� �����
	MOV	#0,R2               
	EMT	20               
        
        ; ��������� ���������� �������� �� �������� ����������
        MOV	#0,R2	
KEYWAIT:
        INC	R2
        JSR PC, @#KEY_TESTER
	CMP	R1,#0       ;�� ���� ������� � ��� ���������
        BEQ     KEYWAIT

        MOV	R2,R0 ; ��������� ��������
        JSR PC, @#SETRNDSEED

	MOV	#377, R3 ; ������ ���������

CICLE:
        MOV	#17,R0 ; ��������� ����� � ��������� �� 0 �� 15
        JSR PC, @#GENRNDVALUE

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
        
	SOB	R3,CICLE

	MOV	#MSG,R1     ; ����� ������ �� ��������� � ����� �� �����
	MOV	#0,R2               
	EMT	20               

KEYWAIT2:        
        JSR PC, @#KEY_TESTER
	CMP	R1,#0       ;�� ���� ������� � ��� ���������
        BEQ     KEYWAIT2

	EMT     14

	MOV	#40000, R1 ; ������ �����������
	MOV	#40000, R3 ; ������ ���������
CICLE2:
        MOV	#377,R0 ; ��������� ����� � ��������� �� 0 �� 255
        JSR PC, @#GENRNDVALUE

	MOVB	R0,(R1)+

        SOB	R3,CICLE2

	HALT

.include "proc_genrnd.inc"
.include "proc_int2str.inc"
.include "proc_keytester.inc"

BUF:    .BYTE   0,0,0,0,0,0 
MSG:    .ASCIZ  "Press any key"
        .EVEN
        .END

make_bk0010_rom "test_rnd.bin", 1000

