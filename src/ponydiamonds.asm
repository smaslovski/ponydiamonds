	.LINK 1000

        EMT     14
	MOV    #233,R0  ; ����� 32 �������
	EMT    16
	MOV    #232,R0  ; ������� �������
	EMT    16
	; ��������� ���������� �� ����������, ����� �� ������ ����
	BIS	#100,@#177660 

	; ��������� ������� ����, ��������, ������
	MOV	#200,@#PONYX
	MOV	@#PONYX,@#PONYRENDERX
	MOV	#0,@#PONYDX
	MOV	#4,@#PONYDIR

        ; ������������� ������� ������ �� �������
        MOV	#ARR_SPRITES,R0
        MOV	#SPRDIAMOND1,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND2,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND3,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND4,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND5,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND6,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND7,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND8,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND9,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND10,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND11,(R0)
        ADD	#2,R0
        MOV	#SPRDIAMOND12,(R0)
        ADD	#2,R0

	; ������������� ������� �������
	MOV	#ARR_DIAMONDS,R0
        MOV	@#ARR_DIAMONDS_SIZE,R1
CICLE_INIT:
	MOV	#-1,(R0)
	ADD	#2,R0
	MOV	#0,(R0)
	ADD	#2,R0
	MOV	#0,(R0)
	ADD	#2,R0
	SOB 	R1,CICLE_INIT

	; ��������� ������ �������	
        MOV	#ARR_DIAMONDS,R0
	MOV	#0,(R0)
	ADD	#2,R0
	MOV	#100,(R0)
	ADD	#2,R0
	MOV	#200,(R0)
	ADD	#2,R0

	MOV	#2,(R0)
	ADD	#2,R0
	MOV	#200,(R0)
	ADD	#2,R0
	MOV	#150,(R0)
	ADD	#2,R0

	MOV	#5,(R0)
	ADD	#2,R0
	MOV	#300,(R0)
	ADD	#2,R0
	MOV	#250,(R0)
	ADD	#2,R0

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

        ; ����� �������
	MOV	#ARR_DIAMONDS,R0
        MOV	@#ARR_DIAMONDS_SIZE,R1
CICLE_DIAMONDS_RENDER:
	MOV	(R0),R2
	CMP	R2,#-1
	BEQ	SKIP_ARRAY_ELEM

	MOV	#ARR_SPRITES,R3
	ADD	R2,R3
	ADD	R2,R3
        MOV	(R3),-(SP)   ; ������ ������
        ADD	#2,R0
        MOV	(R0),-(SP)   ; X
      	ADD	#2,R0
        MOV	(R0),-(SP)  ; Y
       	ADD	#2,R0
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        SOB 	R1,CICLE_DIAMONDS_RENDER
SKIP_ARRAY_ELEM:
        ADD	#6,R0
	SOB 	R1,CICLE_DIAMONDS_RENDER

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
ARR_DIAMONDS_SIZE: .WORD 32
ARR_DIAMONDS: .WORD 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0
              .WORD 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0
              .WORD 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0
              .WORD 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0
ARR_SPRITES: .WORD 0,0,0,0, 0,0,0,0, 0,0,0,0
.EVEN
.END

make_bk0010_rom "ponydiamonds.bin", 1000
