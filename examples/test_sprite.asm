	.LINK 1000

        EMT     14	

	MOV	#10,R0
	MOV	#320,R1
START:

        MOV	#SPRUNICORN_MIRR,-(SP)   ; ������
        MOV	R0,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRUNICORN,-(SP)   ; ������
        MOV	R1,-(SP)   ; X
        MOV	#200,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRUNICORN_MIRR,-(SP)   ; ������
        MOV	R0,-(SP)   ; X
        MOV	#100,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

	MOV 	#30000,R2
PAUSE1:	NOP
	SOB	R2,PAUSE1

	; ��������� ������� ����
        MOV	R0,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
        MOV	#40,-(SP)  ; DY
        JSR PC, @#CLEARZONE
        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

        ; ��������� ��������� ���� � �����
        MOV	R1,R2
	ADD	#34,R2
        MOV	R2,-(SP)   ; X - � ����� ������� ��� �������� ����
        MOV	#200,-(SP)  ; Y
        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
        MOV	#40,-(SP)  ; DY
        JSR PC, @#CLEARZONE
        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

	; ��������� ������� ����
        MOV	R0,-(SP)   ; X
        MOV	#100,-(SP)  ; Y
        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
        MOV	#40,-(SP)  ; DY
        JSR PC, @#CLEARZONE
        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

	ADD	#4,R0
	SUB	#4,R1

	JMP 	START

	HALT

.include "proc_drawsprite.inc"
.include "sprites_data.inc"

.EVEN
.END

make_bk0010_rom "test_sprite.bin", 1000
