; ��������� ��������� � R0 �����-����� � ��������� �����, 
; �� ������� ����� ������� �����
; �������� #7 - 111 - ����� �������� ����� �� 0 �� 7
;          #377 - 11111111 - ����� �������� ����� �� 0 �� 255
; ���������� � R0 ����� � �������� ���������
;  ����� ���������:
;  x ^= x << 7;
;  x ^= x >> 9;
;  x ^= x << 8;
GENRNDVALUE:
        ; ���������� ���������
        MOV	R1,-(SP)
        MOV	R2,-(SP)
        MOV	R3,-(SP)

	MOV 	@#TEKRNDVALUE,R1

	MOV	R1,R2
	MOV	#7,R3
G1:     ROL     R2
        SOB	R3,G1
	XOR	R2,R1

	MOV	R1,R2
	MOV	#11,R3
G2:	ROR     R2
        SOB	R3,G2
	XOR	R2,R1

	MOV	R1,R2
	MOV	#10,R3
G3:	ROL     R2
        SOB	R3,G3
	XOR	R2,R1

	MOV 	R1,@#TEKRNDVALUE

	; ������� �� �������� �����
        COM	R0
        BIC	R0,R1
        MOV	R1,R0

        ; �������������� ���������
	MOV     (SP)+,R3
	MOV     (SP)+,R2
	MOV     (SP)+,R1

        RTS PC

; ��������� ���������� �������� ����������
SETRNDSEED:
        MOV	R0, @#TEKRNDVALUE
        RTS PC

TEKRNDVALUE:    .WORD   0
