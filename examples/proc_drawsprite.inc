; ��������� � �����: ����� �������, X, Y
DRAWSPRITE:
        ; ���������� ���������
        MOV	R0,-(SP)
        MOV	R1,-(SP)
        MOV	R2,-(SP)
        MOV	R3,-(SP)
        MOV	R4,-(SP)
        MOV	R5,-(SP)

        ; ���������� ����������
        ADD	#16,SP
        MOV     (SP)+,R2 ; Y
        MOV     (SP)+,R1 ; X
        MOV     (SP),R0 ; ����� �������
        SUB	#22,SP

	MOV	#40000,R3 ; ��������� ������� � �����������
	ASR	R1	
	ASR	R1
	ADD	R1,R3
CALCY:	ADD	#100,R3   ; ������������� ��������� #100 �� Y
	SOB	R2,CALCY	
	MOV	R3,R1     ; � R1 ������ �������� ����� ����������
	
        MOV	(R0),R4	  ; �������� ������� �������
        ADD	#2,R0
        MOV	(R0),R5	
        ADD	#2,R0
        
	MOV	R5,R3

ROW:    MOV	R4,R2
        
COL:	MOVB	(R0)+,(R1)+  ; ������������, ���� ����� ������� 2 �����
	SOB	R2,COL

	ADD	#100,R1
	SUB	R4,R1

	SOB	R3,ROW

        ; �������������� ���������
	MOV     (SP)+,R5
	MOV     (SP)+,R4
	MOV     (SP)+,R3
	MOV     (SP)+,R2
	MOV     (SP)+,R1
	MOV     (SP)+,R0

        RTS PC

; ��������� � �����: ����� �������, X, Y
CLEARSPRITE:
        ; ���������� ���������
        MOV	R0,-(SP)
        MOV	R1,-(SP)
        MOV	R2,-(SP)
        MOV	R3,-(SP)
        MOV	R4,-(SP)
        MOV	R5,-(SP)

        ; ���������� ����������
        ADD	#16,SP
        MOV     (SP)+,R2 ; Y
        MOV     (SP)+,R1 ; X
        MOV     (SP),R0 ; ����� �������
        SUB	#22,SP
                          ; ����� ������������ � ����� ����
	MOV	#40000,R3 ; ��������� ������� � �����������
	ASR	R1	
	ASR	R1
	ADD	R1,R3
CALCY1:	ADD	#100,R3   ; ������������� ��������� #100 �� Y
	SOB	R2,CALCY1	
	MOV	R3,R1     ; � R1 ������ �������� ����� ����������
	
        MOV	(R0),R4	  ; �������� ������� �������
        ADD	#2,R0
        MOV	(R0),R5	
        ADD	#2,R0
        
	MOV	R5,R3

ROW1:    MOV	R4,R2
        
COL1:	MOVB	#0,(R1)+  ; ������������, ���� ����� ������� 2 �����
	SOB	R2,COL1

	ADD	#100,R1
	SUB	R4,R1

	SOB	R3,ROW1

        ; �������������� ���������
	MOV     (SP)+,R5
	MOV     (SP)+,R4
	MOV     (SP)+,R3
	MOV     (SP)+,R2
	MOV     (SP)+,R1
	MOV     (SP)+,R0

        RTS PC

; ��������� � �����: X, Y, DX, DY
CLEARZONE:
        ; ���������� ���������
        MOV	R0,-(SP)
        MOV	R1,-(SP)
        MOV	R2,-(SP)
        MOV	R3,-(SP)
        MOV	R4,-(SP)
        MOV	R5,-(SP)

        ; ���������� ����������
        ADD	#16,SP
        MOV     (SP)+,R5 ; DY
        MOV     (SP)+,R4 ; DX
        MOV     (SP)+,R2 ; Y
        MOV     (SP),R1 ; X
        SUB	#24,SP
                          ; ����� ������������ � ����� ����
	MOV	#40000,R3 ; ��������� ������� � �����������
	ASR	R1	
	ASR	R1
	ADD	R1,R3
CALCY2:	ADD	#100,R3   ; ������������� ��������� #100 �� Y
	SOB	R2,CALCY2	
	MOV	R3,R1     ; � R1 ������ �������� ����� ����������
       
	MOV	R5,R3

ROW2:	MOV	R4,R2
        
COL2:	MOVB	#0,(R1)+  ; ������������, ���� ����� ������� 2 �����
	SOB	R2,COL2

	ADD	#100,R1
	SUB	R4,R1

	SOB	R3,ROW2

        ; �������������� ���������
	MOV     (SP)+,R5
	MOV     (SP)+,R4
	MOV     (SP)+,R3
	MOV     (SP)+,R2
	MOV     (SP)+,R1
	MOV     (SP)+,R0

        RTS PC
