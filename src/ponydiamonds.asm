	.LINK 1000

        EMT     14
	MOV    #233,R4  ; ����� 32 �������
	EMT    16
	MOV    #232,R4  ; ������� �������
	EMT    16
	; ��������� ���������� �� ����������, ����� �� ������ ����
	BIS	#100,@#177660 

	MOV	#200,@#PONYX
	MOV	@#PONYX,@#PONYRENDERX
	MOV	#0,@#PONYDX
	MOV	#4,@#PONYDIR
START:
	MOV	#3777,@#177706  ; ������������ ������ (3777 - �������� 10 FPS)
        MOV	#24,@#177712  ; ��������� ���� � ���������

; ===== ���� ������ ���������� ======
        JSR PC, @#KEY_TESTER

	CMP	R1,#0       ;�� ���� ������� � ��� ���������
        BEQ     END_KEY

        CMP	R1,#2       ; ���� ����� ��������� (2), ����������
        BEQ     END_KEY

        ; ����� ����� ������� (1) � �� ��� ������
	CMP	R0,#31      ; ������� "������ ������"?
	BNE     KEYSTEP1
       	MOV	#4,@#PONYDX ; ����� ��������
       	MOV	#4,@#PONYDIR; ����� ��������
KEYSTEP1:  
	CMP	R0,#10      ; ������� "������ �����"?
	BNE     KEYSTEP2
       	MOV	#-4,@#PONYDX ; ����� ��������
       	MOV	#-4,@#PONYDIR; ����� ��������
KEYSTEP2:
	CMP	R0,#40      ; ������� "������"?
	BNE     KEYSTEP3
       	MOV	#0,@#PONYDX ; ����� ��������
KEYSTEP3:

END_KEY:        

; ===== ���� ������ ������ ����� ======
        CMP	@#PONYX, @#PONYRENDERX
        BEQ	NO_CLEARZONE
        ;[!] �������� �����, ��� �������, ����� �������� ������ �������

	; ��������� ������� ����
        MOV	@#PONYRENDERX,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
        MOV	#40,-(SP)  ; DY
        JSR PC, @#CLEARZONE
        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

        ; ��������� ��������� ���� � �����
        MOV	@#PONYRENDERX,R0
	ADD	#34,R0
        MOV	R0,-(SP)   ; X - � ����� ������� ��� �������� ����
        MOV	#300,-(SP)  ; Y
        MOV	#1,-(SP)  ; DX - ������ ���������� ������� �� ��������
        MOV	#40,-(SP)  ; DY
        JSR PC, @#CLEARZONE
        ADD	#10, SP     ; ������������ ���� �� 2*����� ����������

NO_CLEARZONE:

; ===== ���� ������� ======

        CMP	@#PONYDIR,#4      ; ����� ���� �������
	BNE     MIRRPONYSPR
        MOV	#SPRUNICORN,-(SP)   ; ������
        JMP	DODRAWPONYSPR
MIRRPONYSPR:
        MOV	#SPRUNICORN_MIRR,-(SP)   ; ������
DODRAWPONYSPR:
        MOV	@#PONYX,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	@#PONYX,@#PONYRENDERX   ; �������� ������� �������

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

; ===== ���� ���������� ��������� ���� ======
	ADD	@#PONYDX,@#PONYX ; ��������
	CMP	@#PONYX,#0
	BGE     NEXT_FRAME_1
	MOV	#0,@#PONYX
NEXT_FRAME_1:
	CMP	@#PONYX,#340
	BLE     NEXT_FRAME_2
	MOV	#340,@#PONYX
NEXT_FRAME_2:

; ===== ���� ������������ ����� ������ ======
TIMERCICLEWAIT:
        BIT	#200,@#177712 ; ��������� ������� ������� ����� ���� - ��� 7
        BEQ	TIMERCICLEWAIT         ; ������, ���� �� �����

	JMP 	START

	HALT

.include "proc_drawsprite.inc"
.include "proc_keytester.inc"
.include "sprites.inc"

PONYX:      .WORD   0
PONYRENDERX:      .WORD   0
PONYDX:     .WORD   0
PONYDIR:    .WORD   0
.EVEN
.END

make_bk0010_rom "ponydiamondsgame.bin", 1000
