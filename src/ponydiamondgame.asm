	.LINK 1000

        EMT     14	

	MOV	#200,R0
START:

        MOV	#SPRUNICORN,-(SP)   ; ������
        MOV	R0,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND1,-(SP)   ; ������
        MOV	#50,-(SP)   ; X
        MOV	#100,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND2,-(SP)   ; ������
        MOV	#50,-(SP)   ; X
        MOV	#200,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND3,-(SP)   ; ������
        MOV	#150,-(SP)   ; X
        MOV	#100,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND4,-(SP)   ; ������
        MOV	#150,-(SP)   ; X
        MOV	#200,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND5,-(SP)   ; ������
        MOV	#250,-(SP)   ; X
        MOV	#100,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND6,-(SP)   ; ������
        MOV	#250,-(SP)   ; X
        MOV	#200,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND7,-(SP)   ; ������
        MOV	#50,-(SP)   ; X
        MOV	#150,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND8,-(SP)   ; ������
        MOV	#50,-(SP)   ; X
        MOV	#250,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND9,-(SP)   ; ������
        MOV	#150,-(SP)   ; X
        MOV	#150,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND10,-(SP)   ; ������
        MOV	#150,-(SP)   ; X
        MOV	#250,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND11,-(SP)   ; ������
        MOV	#250,-(SP)   ; X
        MOV	#150,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRDIAMOND12,-(SP)   ; ������
        MOV	#250,-(SP)   ; X
        MOV	#250,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

	MOV 	#30000,R2
PAUSE1:	NOP
	SOB	R2,PAUSE1

	; ��������� ������� ����
;        MOV	R0,-(SP)   ; X
;        MOV	#300,-(SP)  ; Y
;        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
;        MOV	#40,-(SP)  ; DY
;        JSR PC, @#CLEARZONE
;        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

        ; ��������� ��������� ���� � �����
;        MOV	R1,R2
;	ADD	#34,R2
;        MOV	R2,-(SP)   ; X - � ����� ������� ��� �������� ����
;        MOV	#200,-(SP)  ; Y
;        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
;        MOV	#40,-(SP)  ; DY
;        JSR PC, @#CLEARZONE
;        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

;	ADD	#4,R0

	JMP 	START

	HALT

.include "proc_drawsprite.inc"
.include "sprites.inc"

.EVEN
.END

make_bk0010_rom "ponydiamondsgame.bin", 1000
