SUB_HITBOX:
        MOV	R0,-(SP)
        MOV	R1,-(SP)
        MOV	R2,-(SP)
        
        MOV	R4,R0  ; X ������
        MOV	R5,R1  ; Y ������

        MOV	#0,R4  ; �� ���������, �� ������� � �� ��������� ����
        MOV	#0,R5

        MOV	@#PONYY,R2 ; ���������� ������� ������� ����
        SUB	#40,R2
        CMP	R1,R2
	BLT	PONY_HIT_BOX ; ���� �� ����� �� ������� ���� ������

	CMP	R0,@#PONYX
	BLT	DIAMOND_ON_LEFT

	MOV	R0,R2
	SUB	@#PONYX,R2
	JMP 	CMP_ABS_DIST
DIAMOND_ON_LEFT:
	MOV	@#PONYX,R2
	SUB	R0,R2

CMP_ABS_DIST:
	CMP	#40,R2
	BLT	PONY_HIT_BOX

	MOV	#ARR_SCORES,R0 ; ��������� ������� � ������� ����� �� ��������
	ADD	R3,R0
	ADD	R3,R0
        MOV	#1,R4  ; ������ � ��������� ����
        MOV	(R0),R5

        JMP 	END_HIT_BOX

PONY_HIT_BOX:

        CMP	R1,@#LOWBORDER
	BNE	END_HIT_BOX

        MOV	#1,R4  ; ������ ������, ��� ���������� �����

END_HIT_BOX:

	MOV     (SP)+,R2
	MOV     (SP)+,R1
	MOV     (SP)+,R0

        RTS PC