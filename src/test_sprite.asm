	.LINK 1000

        EMT     14	

        MOV	#SPRUNICORN_MIRR,-(SP)   ; ������
        MOV	#10,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

        MOV	#SPRUNICORN,-(SP)   ; ������
        MOV	#320,-(SP)   ; X
        MOV	#300,-(SP)  ; Y
        JSR PC, @#DRAWSPRITE
        ADD	#6, SP     ; ������������ ���� �� 2*����� ����������

	HALT

.include "proc_drawsprite.inc"
.include "sprites_data.inc"

.EVEN
.END

make_bk0010_rom "test_sprite.bin", 1000
