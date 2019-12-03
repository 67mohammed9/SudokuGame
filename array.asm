; CSC 21000
; ASSEMBLY PROJECT -12x12 SUDOKU GAME by MOHAMMED BHUIYAN
;Professor: M. Vulis


.model small
.386
.data 
boar_col   db ?
x_pos   db ?
y_pos   db ?
ind_ex db ?
save db ?
save2 db ?
save3 db ?
save4 db ?


prob      db 1,2,0,4,0,10,0,3,11,0,0,0
		  db 0,0,12,6,9,0,7,1,0,0,0,2
		  db 0,9,0,0,0,0,0,0,0,8,3,0
		  db 0,5,0,0,0,6,0,0,8,0,0,0
		  db 0,8,0,0,7,0,0,10,0,6,0,12
		  db 0,4,0,1,0,0,12,0,0,3,0,0
		  db 0,0,9,0,0,4,0,0,10,0,11,0
		  db 2,0,5,0,8,0,0,12,0,0,7,0
		  db 0,0,0,10,0,0,2,0,0,0,6,0
		  db 0,10,11,0,0,0,0,0,0,0,5,0
		  db 3,0,0,0,10,5,0,7,9,12,0,0
		  db 0,0,0,5,4,0,3,0,2,0,1,11,'$'
		  
prob1      db 1,2,0,4,0,10,0,3,11,0,0,0;DEFAULT
		  db 0,0,12,6,9,0,7,1,0,0,0,2
		  db 0,9,0,0,0,0,0,0,0,8,3,0
		  db 0,5,0,0,0,6,0,0,8,0,0,0
		  db 0,8,0,0,7,0,0,10,0,6,0,12
		  db 0,4,0,1,0,0,12,0,0,3,0,0
		  db 0,0,9,0,0,4,0,0,10,0,11,0
		  db 2,0,5,0,8,0,0,12,0,0,7,0
		  db 0,0,0,10,0,0,2,0,0,0,6,0
		  db 0,10,11,0,0,0,0,0,0,0,5,0
		  db 3,0,0,0,10,5,0,7,9,12,0,0
		  db 0,0,0,5,4,0,3,0,2,0,1,11,'$'
		 
user_in  db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,'$'
		 
		 
sol       db 1,2,8,4,5,10,6,3,11,9,12,7
		  db 11,3,12,6,9,8,7,1,5,4,10,2
		  db 5,9,10,7,2,12,4,11,6,8,3,1
		  db 7,5,3,12,1,6,9,4,8,11,2,10
		  db 9,8,2,11,7,3,5,10,1,6,4,12
		  db 10,4,6,1,11,2,12,8,7,3,9,5
		  db 12,7,9,8,6,4,1,5,10,2,11,3
		  db 2,6,5,3,8,11,10,12,4,1,7,9
		  db 4,11,1,10,3,7,2,9,12,5,6,8
		  db 6,10,11,9,12,1,8,2,3,7,5,4
		  db 3,1,4,2,10,5,11,7,9,12,8,6
		  db 8,12,7,5,4,9,3,6,2,10,1,11,'$'
		  		 
sol1      db 1,2,8,4,5,10,6,3,11,9,12,7;DEFAULT
		  db 11,3,12,6,9,8,7,1,5,4,10,2
		  db 5,9,10,7,2,12,4,11,6,8,3,1
		  db 7,5,3,12,1,6,9,4,8,11,2,10
		  db 9,8,2,11,7,3,5,10,1,6,4,12
		  db 10,4,6,1,11,2,12,8,7,3,9,5
		  db 12,7,9,8,6,4,1,5,10,2,11,3
		  db 2,6,5,3,8,11,10,12,4,1,7,9
		  db 4,11,1,10,3,7,2,9,12,5,6,8
		  db 6,10,11,9,12,1,8,2,3,7,5,4
		  db 3,1,4,2,10,5,11,7,9,12,8,6
		  db 8,12,7,5,4,9,3,6,2,10,1,11,'$'
		  
		  
		  
		  
		 
empty_board  db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0,'$'	

prob2    db 2,0,0,6,0,12,8,0,10,0,7,0
         db 0,0,12,11,6,3,0,0,0,1,0,5
		 db 0,8,0,0,0,10,0,0,6,12,0,0
		 db 0,2,0,0,4,0,0,0,0,7,10,8
		 db 0,0,0,3,0,0,0,1,0,0,0,0
		 db 5,0,9,0,0,0,0,0,0,4,3,0
		 db 0,6,5,0,0,0,0,0,0,11,0,9
		 db 0,0,0,0,9,0,0,0,12,0,0,0
		 db 9,10,8,0,0,0,0,7,0,0,2,0
		 db 0,0,11,9,0,0,2,0,0,0,1,0
		 db 7,0,10,0,0,0,9,4,11,6,0,0
		 db 0,3,0,8,0,1,11,0,2,0,0,12,'$'



sol2     db 2,9,1,6,5,12,8,11,10,3,7,4
         db 10,7,12,11,6,3,4,2,8,1,9,5
		 db 4,8,3,5,1,10,7,9,6,12,11,2
		 db 11,2,6,1,4,9,3,12,5,7,10,8
		 db 8,4,7,3,10,11,5,1,9,2,12,6
		 db 5,12,9,10,2,7,6,8,1,4,3,11
		 db 1,6,5,12,8,2,10,3,7,11,4,9
		 db 3,11,2,7,9,4,1,5,12,8,6,10
		 db 9,10,8,4,11,6,12,7,3,5,2,1
		 db 12,5,11,9,3,8,2,6,4,10,1,7
		 db 7,1,10,2,12,5,9,4,11,6,8,3
		 db 6,3,4,8,7,1,11,10,2,9,5,12,'$'
		 
prob3        db 0,0,5,1,0,0,0,0,0,3,4,0
			 db 0,11,0,0,0,0,0,10,1,8,6,0
			 db 12,0,0,0,1,0,0,0,0,0,0,0
			 db 5,0,4,0,0,0,1,7,10,6,0,0
			 db 11,0,0,12,0,2,5,0,0,0,9,8
			 db 0,2,0,0,0,0,11,0,0,5,0,1
			 db 4,0,12,0,0,6,0,0,0,0,8,0
			 db 6,10,0,0,0,12,8,0,11,0,0,4
			 db 0,0,2,3,4,9,0,0,0,12,0,5
			 db 0,0,0,0,0,0,0,2,0,0,0,9
			 db 0,6,10,8,7,0,0,0,0,0,11,0
			 db 0,9,7,0,0,0,0,0,3,1,0,0,'$'	

sol3         db 10,7,5,1,8,11,6,9,2,3,4,12
			 db 9,11,3,2,5,4,12,10,1,8,6,7
			 db 12,4,8,6,1,7,2,3,9,11,5,10
			 db 5,8,4,9,12,3,1,7,10,6,2,11
			 db 11,3,1,12,10,2,5,6,4,7,9,8
			 db 7,2,6,10,9,8,11,4,12,5,3,1
			 db 4,5,12,11,2,6,10,1,7,9,8,3
			 db 6,10,9,7,3,12,8,5,11,2,1,4
			 db 8,1,2,3,4,9,7,11,6,12,10,5
			 db 1,12,11,4,6,5,3,2,8,10,7,9
			 db 3,6,10,8,7,1,9,12,5,4,11,2
			 db 2,9,7,5,11,10,4,8,3,1,12,6,'$'	
		 	
 row_num db ?
 col_num db ?
 

.code

start:
	mov ax, @DATA
	mov ds, ax
	
	
	
	changePage:
	mov ah, 0Fh
	mov bh, 2
	int 10h
	mov ah, 05h
	mov al, 2
	int 10h
	MOV AX, 0600h        ; AH=06(scroll up window), AL=00(entire window)
	MOV BH, 72h    ; left nibble for background (blue), right nibble for foreground (light gray)
	MOV CX, 0000h        ; CH=00(top), CL=00(left)
	MOV DX, 184Fh        ; DH=19(bottom), DL=50(right)
	INT 10h
	
	

	;Home Page
    mov al,1
	mov bh, 2
	mov bl, 71h
	mov cx, msg0end - offset msg0
	mov dl, 25
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg0
	mov ah, 13h
	int 10h
	jmp msg0end
	msg0 db "Sudoku by Mohammed Bhuiyan"
	msg0end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg1end - offset msg1
	mov dl, 6
	mov dh, 5
	push cs
	pop es
	mov bp, offset msg1
	mov ah, 13h
	int 10h
	jmp msg1end
	msg1 db "HOW TO PLAY: "
	msg1end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg2end - offset msg2
	mov dl, 6
	mov dh, 6
	push cs
	pop es
	mov bp, offset msg2
	mov ah, 13h
	int 10h
	jmp msg2end
	msg2 db "Use ARROW KEYS to move."
	msg2end:
   
    

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg3end - offset msg3
	mov dl, 6
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg3
	mov ah, 13h
	int 10h
	jmp msg3end
	msg3 db "Use NUMBER KEYS to ENTER or REPLACE numbers 1-9 "
	msg3end:
   
    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg4end - offset msg4
	mov dl, 6
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg4
	mov ah, 13h
	int 10h
	jmp msg4end
	msg4 db "To Enter or Replace '10' press (a)"
	msg4end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg5end- offset msg5
	mov dl, 6
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg5
	mov ah, 13h
	int 10h
	jmp msg5end
    msg5 db "To Enter or Replace '11' press (b)"
	msg5end:


    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg6end- offset msg6
	mov dl, 6
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg6
	mov ah, 13h
	int 10h
	jmp msg6end
    msg6 db "To Enter or Replace '12' press (c)"
	msg6end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg7end- offset msg7
	mov dl, 6
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg7
	mov ah, 13h
	int 10h
	jmp msg7end
    msg7 db "Press (s) to display the answer"
	msg7end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg8end- offset msg8
	mov dl, 6
	mov dh, 12
	push cs
	pop es
	mov bp, offset msg8
	mov ah, 13h
	int 10h
	jmp msg8end
    msg8 db "Press (t) to go back to your progress"
	msg8end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg9end- offset msg9
	mov dl, 6
	mov dh, 13
	push cs
	pop es
	mov bp, offset msg9
	mov ah, 13h
	int 10h
	jmp msg9end
    msg9 db "Press (j) to clear your board"
	msg9end:
     mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg10end- offset msg10
	mov dl, 6
	mov dh, 14
	push cs
	pop es
	mov bp, offset msg10
	mov ah, 13h
	int 10h
	jmp msg10end
    msg10 db "Press (k) to submit your answer"
	msg10end:

     mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg11end- offset msg11
	mov dl, 6
	mov dh, 15
	push cs
	pop es
	mov bp, offset msg11
	mov ah, 13h
	int 10h
	jmp msg11end
    msg11 db "Press (p) to play"
	msg11end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg12end- offset msg12
	mov dl, 6
	mov dh, 16
	push cs
	pop es
	mov bp, offset msg12
	mov ah, 13h
	int 10h
	jmp msg12end
    msg12 db "Press (r) to return to this page"
	msg12end:
	mov ah, 00h 
	int 16h 
	cmp al, 75h; press u
	je startGame
	cmp al, 27d
	je QUIT
	
	startGame:
   ;CODE FOR SETTING BACKGROUND COLOR
    MOV AH,00h      ; Set video mode
	MOV AL,03h      ; Mode 3 (Color text)
	INT 10H
	mov ah, 05h
	mov al, 1
	int 10h
	mov boar_col,   70h
	mov ind_ex , 0h
	mov row_num , 0h
	mov col_num , 0h
	
	
	
	
	
	MOV AX, 0600h        ; AH=06(scroll up window), AL=00(entire window)
	MOV BH, 72h    ; left nibble for background (blue), right nibble for foreground (light gray)
	MOV CX, 0000h        ; CH=00(top), CL=00(left)
	MOV DX, 184Fh        ; DH=19(bottom), DL=50(right)
	INT 10h
	;Endofcode for background color change
	
	Hor_line MACRO Row, Column, Color,Character
	mov ah, 2
	mov dh, Row
	mov dl, Column
	mov bh, 1
	int 10h

    mov ah, 09h
	mov al, Character
	mov bh, 1
	mov bl, Color
	mov cx, 58
	int 10h 
    

  	ENDM
   S_line MACRO Row, Column, Color,Character
	mov ah, 2
	mov dh, Row
	mov dl, Column
	mov bh, 1
	int 10h

    mov ah, 09h
	mov al, Character
	mov bh, 1
	mov bl, Color
	mov cx, 1
	int 10h 
    
  	ENDM
    Ver_line MACRO Row, Column, Color, Character,endd,start,loopss
    mov dh, endd
    loopss:
    S_line  dh,Row,Color,Character
    add dh,-1
    cmp dh,start
    JGE loopss
    ENDM
	;BUILDING OF 12x12 BOARD==========START======
    Hor_line    0,4,boar_col,205d
    Hor_line    2,4,boar_col,196d
    Hor_line    4,4,boar_col,196d
    Hor_line    6,4,boar_col,205d
    Hor_line    8,4,boar_col,196d
    Hor_line    10,4,boar_col,196d
    Hor_line    12,4,boar_col,205d
    Hor_line    14,4,boar_col,196d
    Hor_line    16,4,boar_col,196d
    Hor_line    18,4,boar_col,205d
	Hor_line    20,4,boar_col,196d
	Hor_line    22,4,boar_col,196d
	Hor_line    24,4,boar_col,205d
	S_line       0,3,boar_col,201d
	S_line       0,62,boar_col,187d
	S_line       24,3,boar_col,200d
	S_line       24,62,boar_col,188d
	S_line       6,3,boar_col,204d
	S_line       6,62,boar_col,185d
	S_line       12,3,boar_col,204d
	S_line       12,62,boar_col,185d
	S_line       18,3,boar_col,204d
	S_line       18,62,boar_col,185d
	S_line       4,3,boar_col,199d
	S_line       4,62,boar_col,182d
	S_line       8,3,boar_col,199d
	S_line       8,62,boar_col,182d
	S_line       10,3,boar_col,199d
	S_line       10,62,boar_col,182d
	S_line       14,3,boar_col,199d
	S_line       14,62,boar_col,182d
	S_line       16,3,boar_col,199d
	S_line       16,62,boar_col,182d
	S_line       20,3,boar_col,199d
	S_line       20,62,boar_col,182d
	S_line       22,3,boar_col,199d
	S_line       22,62,boar_col,182d
	
	;outside vertical borders
	Ver_line    3,10,boar_col,186d,23,1,v0
	Ver_line    62,10,boar_col,186d,23,1,v13
	
	; intersections double border
	Ver_line    22,10,boar_col,186d,23,1,v5
	Ver_line    42,10,boar_col,186d,23,1,v9
	S_line      0,22 ,boar_col,203d
	S_line      0,42 ,boar_col,203d
	S_line      6,22 ,boar_col,206d
	S_line      6,42 ,boar_col,206d
	S_line      12,22 ,boar_col,206d
	S_line      12,42 ,boar_col,206d
	S_line      18,22 ,boar_col,206d
	S_line      18,42 ,boar_col,206d
	S_line      24,22 ,boar_col,202d
	S_line      24,42 ,boar_col,202d
	;3x4 first column
	Ver_line    8,10,boar_col,179d,23,1,v2
	Ver_line    13,10,boar_col,179d,23,1,v3
	Ver_line    18,10,boar_col,179d,23,1,v4
	S_line      0,8 ,boar_col,209d
	S_line      0,13 ,boar_col,209d
	S_line      0,18 ,boar_col,209d
	S_line      6,8 ,boar_col,216d
	S_line      6,13 ,boar_col,216d
	S_line      6,18 ,boar_col,216d
	S_line      2,8 ,boar_col,197d
	S_line      4,8 ,boar_col,197d
	S_line      2,13 ,boar_col,197d
	S_line      4,13 ,boar_col,197d
	S_line      2,18 ,boar_col,197d
	S_line      4,18 ,boar_col,197d
	S_line      2,22 ,boar_col,182d
	S_line      4,22 ,boar_col,182d
	
	S_line      8,8 ,boar_col,197d
	S_line      10,8 ,boar_col,197d
	S_line      8,13 ,boar_col,197d
	S_line      10,13 ,boar_col,197d
	S_line      8,18 ,boar_col,197d
	S_line      10,18 ,boar_col,197d
	S_line      8,22 ,boar_col,182d
	S_line      10,22 ,boar_col,182d
	S_line      12,8 ,boar_col,216d
	S_line      12,13 ,boar_col,216d
	S_line      12,18 ,boar_col,216d
	
	S_line      14,8 ,boar_col,197d
	S_line      16,8 ,boar_col,197d
	S_line      14,13 ,boar_col,197d
	S_line      16,13 ,boar_col,197d
	S_line      14,18 ,boar_col,197d
	S_line      16,18 ,boar_col,197d
	S_line      14,22 ,boar_col,182d
	S_line      16,22 ,boar_col,182d
	S_line      18,8 ,boar_col,216d
	S_line      18,13 ,boar_col,216d
	S_line      18,18 ,boar_col,216d
	
	S_line      20,8 ,boar_col,197d
	S_line      22,8 ,boar_col,197d
	S_line      20,13 ,boar_col,197d
	S_line      22,13 ,boar_col,197d
	S_line      20,18 ,boar_col,197d
	S_line      22,18 ,boar_col,197d
	S_line      20,22 ,boar_col,182d
	S_line      22,22 ,boar_col,182d
	S_line      24,8 ,boar_col,207d
	S_line      24,13 ,boar_col,207d
	S_line      24,18 ,boar_col,207d
	;3x4 second column
	Ver_line    27,10,boar_col,179d,23,1,v6
	Ver_line    32,10,boar_col,179d,23,1,v7
	Ver_line    37,10,boar_col,179d,23,1,v8
	S_line      0,27 ,boar_col,209d
	S_line      0,32 ,boar_col,209d
	S_line      0,37 ,boar_col,209d
	S_line      6,27 ,boar_col,216d
	S_line      6,32 ,boar_col,216d
	S_line      6,37 ,boar_col,216d
	S_line      2,27 ,boar_col,197d
	S_line      4,27 ,boar_col,197d
	S_line      2,32 ,boar_col,197d
	S_line      4,32 ,boar_col,197d
	S_line      2,37 ,boar_col,197d
	S_line      4,37 ,boar_col,197d
	S_line      2,42 ,boar_col,182d
	S_line      4,42 ,boar_col,182d
	
	S_line      8,27 ,boar_col,197d
	S_line      10,27 ,boar_col,197d
	S_line      8,32 ,boar_col,197d
	S_line      10,32 ,boar_col,197d
	S_line      8,37 ,boar_col,197d
	S_line      10,37 ,boar_col,197d
	S_line      8,42 ,boar_col,182d
	S_line      10,42 ,boar_col,182d
	S_line      12,27 ,boar_col,216d
	S_line      12,32 ,boar_col,216d
	S_line      12,37 ,boar_col,216d
	
	S_line      14,27 ,boar_col,197d
	S_line      16,27 ,boar_col,197d
	S_line      14,32 ,boar_col,197d
	S_line      16,32 ,boar_col,197d
	S_line      14,37 ,boar_col,197d
	S_line      16,37 ,boar_col,197d
	S_line      14,42 ,boar_col,182d
	S_line      16,42 ,boar_col,182d
	S_line      18,27 ,boar_col,216d
	S_line      18,32 ,boar_col,216d
	S_line      18,37 ,boar_col,216d
	
	S_line      20,27 ,boar_col,197d
	S_line      22,27 ,boar_col,197d
	S_line      20,32 ,boar_col,197d
	S_line      22,32 ,boar_col,197d
	S_line      20,37 ,boar_col,197d
	S_line      22,37 ,boar_col,197d
	S_line      20,42 ,boar_col,182d
	S_line      22,42 ,boar_col,182d
	S_line      24,27 ,boar_col,207d
	S_line      24,32 ,boar_col,207d
	S_line      24,37 ,boar_col,207d
	;3x4 last column
	Ver_line    47,10,boar_col,179d,23,1,v10
	Ver_line    52,10,boar_col,179d,23,1,v11
	Ver_line    57,10,boar_col,179d,23,1,v12
	S_line      0,47 ,boar_col,209d
	S_line      0,52 ,boar_col,209d
	S_line      0,57 ,boar_col,209d
	S_line      6,47 ,boar_col,216d
	S_line      6,52 ,boar_col,216d
	S_line      6,57 ,boar_col,216d
	S_line      2,47 ,boar_col,197d
	S_line      4,47,boar_col,197d
	S_line      2,52 ,boar_col,197d
	S_line      4,52 ,boar_col,197d
	S_line      2,57 ,boar_col,197d
	S_line      4,57 ,boar_col,197d
	S_line      2,62 ,boar_col,182d
	S_line      4,62 ,boar_col,182d
	
	S_line      8,47 ,boar_col,197d
	S_line      10,47 ,boar_col,197d
	S_line      8,52 ,boar_col,197d
	S_line      10,52 ,boar_col,197d
	S_line      8,57 ,boar_col,197d
	S_line      10,57 ,boar_col,197d
	S_line      8,62 ,boar_col,182d
	S_line      10,62 ,boar_col,182d
	S_line      12,47 ,boar_col,216d
	S_line      12,52 ,boar_col,216d
	S_line      12,57 ,boar_col,216d
	
	S_line      14,47 ,boar_col,197d
	S_line      16,47 ,boar_col,197d
	S_line      14,52 ,boar_col,197d
	S_line      16,52 ,boar_col,197d
	S_line      14,57 ,boar_col,197d
	S_line      16,57 ,boar_col,197d
	S_line      14,62 ,boar_col,182d
	S_line      16,62 ,boar_col,182d
	S_line      18,47 ,boar_col,216d
	S_line      18,52 ,boar_col,216d
	S_line      18,57 ,boar_col,216d
	
	S_line      20,47 ,boar_col,197d
	S_line      22,47 ,boar_col,197d
	S_line      20,52 ,boar_col,197d
	S_line      22,52 ,boar_col,197d
	S_line      20,57 ,boar_col,197d
	S_line      22,57 ,boar_col,197d
	S_line      20,62 ,boar_col,182d
	S_line      22,62 ,boar_col,182d
	S_line      24,47 ,boar_col,207d
	S_line      24,52 ,boar_col,207d
	S_line      24,57 ,boar_col,207d
	;BUILDING OF 12x12 BOARD==========END=======
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg36end - offset msg36
	mov dl, 64
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg36
	mov ah, 13h
	int 10h
	jmp msg36end
	msg36 db "PUZZLE 1"
	msg36end:

	;reset user_in and clear "correct" and "wrong"
	clearBoard:
	mov al,1
	mov bh, 1
	mov bl, 70h
	mov cx, msg29end - offset msg29
	mov dl, 64
	mov dh, 4
	push cs
	pop es
	mov bp, offset msg29
	mov ah, 13h
	int 10h
	jmp msg29end
	msg29 db "Press (r)"
	msg29end:
	
	mov al,1
	mov bh, 1
	mov bl, 70h
	mov cx, msg30end - offset msg30
	mov dl, 64
	mov dh, 5
	push cs
	pop es
	mov bp, offset msg30
	mov ah, 13h
	int 10h
	jmp msg30end
	msg30 db "to go back to"
	msg30end:
	
		
	mov al,1
	mov bh, 1
	mov bl, 70h
	mov cx, msg31end - offset msg31
	mov dl, 64
	mov dh, 6
	push cs
	pop es
	mov bp, offset msg31
	mov ah, 13h
	int 10h
	jmp msg31end
	msg31 db "Instructions"
	msg31end:
	
	mov al,1
	mov bh, 1
	mov bl, 74h
	mov cx, msg28end - offset msg28
	mov dl, 67
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg28
	mov ah, 13h
	int 10h
	jmp msg28end
	msg28 db "              "
	msg28end:
	mov al,1
	mov bh, 1
	mov bl, 74h
	mov cx, msg34end - offset msg34
	mov dl, 67
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg34
	mov ah, 13h
	int 10h
	jmp msg34end
	msg34 db "              "
	msg34end:
	
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg41end - offset msg41
	mov dl, 63
	mov dh, 12
	push cs
	pop es
	mov bp, offset msg41
	mov ah, 13h
	int 10h
	jmp msg41end
	msg41 db "CHANGE PUZZLE"
	msg41end:
	
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg42end - offset msg42
	mov dl, 63
	mov dh, 13
	push cs
	pop es
	mov bp, offset msg42
	mov ah, 13h
	int 10h
	jmp msg42end
	msg42 db "Press(u)-Puzzle 1"
	msg42end:
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg39end - offset msg39
	mov dl, 63
	mov dh, 14
	push cs
	pop es
	mov bp, offset msg39
	mov ah, 13h
	int 10h
	jmp msg39end
	msg39 db "Press(i)-Puzzle 2"
	msg39end:
	
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg40end - offset msg40
	mov dl, 63
	mov dh, 15
	push cs
	pop es
	mov bp, offset msg40
	mov ah, 13h
	int 10h
	jmp msg40end
	msg40 db "Press(o)-Puzzle 3"
	msg40end:
	
	mov x_pos, 5d
	mov y_pos, 1d
	mov si, OFFSET prob
	mov di, OFFSET user_in
	mov cx, 144
	call Copy
	jmp Load
	
	;change puzzle
	change_prob:
    cmp al,75h; u
    je Puzzle1
	cmp al,69h; i
    je Puzzle2
	cmp al,6Fh; o
    je Puzzle3
	
	
	
	
	Puzzle1:
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg37end - offset msg37
	mov dl, 64
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg37
	mov ah, 13h
	int 10h
	jmp msg37end
	msg37 db "PUZZLE 1"
	msg37end:
    mov si, offset[prob1]
    mov di, offset[prob]
    mov cx,144
    call Copy
    mov si, offset[sol1]
    mov di, offset[sol]
    mov cx,144
    call Copy
    mov x_pos,5
    mov y_pos,1  
    jmp clearBoard
	
	Puzzle2:
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg38end - offset msg38
	mov dl, 64
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg38
	mov ah, 13h
	int 10h
	jmp msg38end
	msg38 db "PUZZLE 2"
	msg38end:
    mov si, offset[prob2]
    mov di, offset[prob]
    mov cx,144
    call Copy
    mov si, offset[sol2]
    mov di, offset[sol]
    mov cx,144
    call Copy
    mov x_pos,5
    mov y_pos,1  
    jmp clearBoard
	
	Puzzle3:
	mov al,1
	mov bh, 1
	mov bl, 79h
	mov cx, msg43end - offset msg43
	mov dl, 64
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg43
	mov ah, 13h
	int 10h
	jmp msg43end
	msg43 db "PUZZLE 3"
	msg43end:
    mov si, offset[prob3]
    mov di, offset[prob]
    mov cx,144
    call Copy
    mov si, offset[sol3]
    mov di, offset[sol]
    mov cx,144
    call Copy
    mov x_pos,5
    mov y_pos,1  
    jmp clearBoard
	
	
	;saved user data displayed on board
	showUser_in:
	mov x_pos, 5d
	mov y_pos, 1d
	mov si, OFFSET user_in
	jmp write
	
	;display answer
	showSolution:
	mov x_pos, 5d
	mov y_pos, 1d
	mov si, OFFSET sol
	jmp write
	
	
	Copy PROC
	mov  al, [si]
	mov [di], al
	inc si
	inc di
	loop Copy
	ret
	Copy ENDP

	
	
	Load:
	mov si, OFFSET user_in
	;display arrays
	write:
	mov al,[si]
	mov save3, al
	cmp al, '$'
	je cursor
	cmp al, 0
	je putNULL
	cmp al,10
	jl add48
	cmp al,10
	jge add55
	
	putNULL:
	mov cl, 144
	cmp cl, 0
	jne set
	
	add48:
	add al, 48
	mov cl, 144
	cmp cl, 0
	jne set

	add55:
	mov cl, 144
	cmp cl, 0
	jne set5

	
	set5:
	mov ah,02h  
    mov dh,y_pos    
    mov dl,x_pos
	mov bh, 1
    int 10h
	mov al, 49d
	mov ah,09h
    mov bl,79h
	mov bh, 1
    mov cx,1    
    int 10h 
	jmp compareSecondDigit
	
	compareSecondDigit:
	cmp save3, 10
	je set2
	cmp save3,11
	je set3
	cmp save3, 12
	je set4
	
	
	set2:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 48d
 	mov ah,09h
    mov bl,79h
	mov bh, 1
    mov cx,1  
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	cmp x_pos, 60d	
	je reset
	
	add x_pos,5h 
    dec cl
	inc si
	jmp write
	
	set3:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 49d
 	mov ah,09h
    mov bl,79h
	mov bh,1
    mov cx,1  
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	cmp x_pos, 60d	
	je reset
	
	add x_pos,5h 
    dec cl
	inc si
	jmp write
	
	set4:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 50d
 	mov ah,09h
    mov bl,79h
	mov bh, 1
    mov cx,1  
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	cmp x_pos, 60d	
	je reset
	
	add x_pos,5h 
    dec cl
	inc si
	jmp write
	
	
	
	set:
	mov ah,02h  
    mov dh,y_pos    
    mov dl,x_pos
	mov bh,1
    int 10h
	
	mov ah,09h
    mov bl,79h
    mov cx,1
    mov bh,1    
    int 10h 
	
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh,1
	int 10h
	mov al, 0d
 	mov ah,09h
    mov bl,79h
    mov cx,1  
	mov bh,1
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	cmp x_pos, 60d	
	je reset
	
	add x_pos,5h 
    dec cl
	inc si
	jmp write
	
	reset:
	mov x_pos, 5d
	add y_pos, 2d
	dec cl
	inc si
	jmp write
	
	

	
	

		;----Define Cursor-------
	cursor:
	mov x_pos, 5d
	mov y_pos, 1d
    mov ch, 7
    mov cl, 5
    mov ah, 1 
    int 10h
    mov ah,2
	mov dh,y_pos
	mov dl,x_pos
	mov bh,1
	int 10h
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	USER:
	mov ah, 00h 
	int 16h 
    cmp al, 27d
	je QUIT 

	cmp ah, 48h 
	je UP

	cmp ah, 4Bh
	je LEFT

	cmp ah, 50h
	je DOWN

	cmp ah,4Dh
	je RIGHT
	
	cmp al,49d
    je check_spot
    cmp al,50d
    je check_spot
    cmp al,51d
    je check_spot
    cmp al,52d
    je check_spot
    cmp al,53d
    je check_spot
    cmp al,54d
    je check_spot
    cmp al,55d
    je check_spot
    cmp al,56d
    je check_spot
    cmp al,57d
    je check_spot
	cmp al,97d
    je check_spot
	cmp al,98d
    je check_spot
	cmp al,99d
    je check_spot
	cmp al,74h;press t
    je showUser_in
	cmp al,6Ah ;press j
    je clearBoard
	cmp al, 73h
	je showSolution
	cmp al, 6Bh; press k
	je submitAnswer
	cmp al, 72h; press r
	je goBack2
	cmp al, 70h; press p
	je goBack
	cmp al, 75h; press u 
	je change_prob
	cmp al, 69h; press i
	je change_prob
	cmp al, 6Fh; press o
	je change_prob
	jmp USER
	
	
	
	UP: 
	cmp y_pos, 1d
	je USER
	sub y_pos, 2d
	
	mov ah, 2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp USER
	
	
	DOWN: 
	cmp y_pos, 23d
	je USER
	add y_pos, 2d
	
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh,1
	int 10h
	jmp USER
	
	
	LEFT: 
	cmp x_pos, 5d
	je USER
	sub x_pos, 5d
	
	mov ah, 2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp USER
	
	
	RIGHT: 
	cmp x_pos, 60d
	je USER
	add x_pos, 5d
	
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp USER
	

reset_index proc
	mov ind_ex , 0h
	mov row_num , 0h
	mov col_num , 0h
	ret
reset_index ENDP 

get_index PROC
  call get_col
  call get_row
  mov bl, col_num
  add bl, row_num
  mov ind_ex, bl
  ret
get_index ENDP
	
	
	;check spot before displaying it on board and storing it in user_in array
	check_spot:
	call reset_index
	mov si, OFFSET prob
	call get_index
	jmp compare

	compare:
	cmp ind_ex, 0d
	jne inc_si
	jmp putNumber
	
	inc_si:
	inc si
	add ind_ex , -1d
	jmp compare
	
	putNumber:
	mov bl,[si]
	cmp bl, 0d
	je ElevenTenOrTwelve
	jmp USER
	
	;displayin 10, 11, or 12
	ElevenTenOrTwelve:
	cmp al,97d
	je PrintSpecNumber
	cmp al, 98d
	je PrintSpecNumber
	cmp al, 99d
	je PrintSpecNumber
	jmp PrintRegNumber
	
	PrintSpecNumber:
	mov save2, al
	mov al, 49d
 	mov ah,09h
    mov bl,72h
	mov bh,1
    mov cx,1  
    int 10h 
	cmp save2, 97d
	je print0
	cmp save2, 98d
	je print1
	cmp save2, 99d
	je print2
	
	print0:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 48d
 	mov ah,09h
    mov bl,72h
	mov bh,1
    mov cx,1  
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp asciiConvertSpec_num
	
	
	
	print1:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 49d
 	mov ah,09h
    mov bl,72h
    mov cx,1  
	mov bh,1
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp asciiConvertSpec_num
	
	
	print2:
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 50d
 	mov ah,09h
    mov bl,72h
    mov cx,1
	mov bh,1	
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp asciiConvertSpec_num
	
	
	; display 1-9
	PrintRegNumber:
	mov save,al
 	mov ah,09h
    mov bl,72h
    mov cx,1 
    mov bh,1	
    int 10h 
	add x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	mov al, 0d
 	mov ah,09h
    mov bl,72h
    mov cx,1 
    mov bh,1	
    int 10h 
	sub x_pos, 1d
	mov ah,2
	mov dh, y_pos
	mov dl, x_pos
	mov bh, 1
	int 10h
	jmp asciiConvertReg_num
	
	
	asciiConvertReg_num:
	sub save, 48d
	mov al, save
	jmp StoreNum
	
	asciiConvertSpec_num:
	sub save2, 87d
	mov al, save2
	jmp StoreNum
	
	
	StoreNum:
	mov si, offset [user_in]
	call reset_index
	call get_index
	jmp compare2
	
	compare2:
	cmp ind_ex, 0d
	jne inc_si2
	jmp finalPrint
	
	finalPrint:
	mov [si], al
	jmp USER
	
	inc_si2:
	inc si
	add ind_ex, -1d
	jmp compare2
	
	;---IGNORE--------------------------
	; clearBoard2:
	; mov x_pos, 5d
	; mov y_pos, 1d
	; mov si, OFFSET sol
	; mov di, OFFSET user_in
	; mov cx, 144
	; jmp Copy2
	
	; Copy2:
	; mov  al, [si]
	; mov [di], al
	; inc si
	; inc di
	; loop Copy2
	;---IGNORE--------------------------
	

	submitAnswer:
	mov si, OFFSET user_in
	mov di, OFFSET sol
	mov cl, 144
	jmp submitAns
	
	submitAns:
	mov al, [si]
	cmp cl, 0;If counter reaches 0 Then user_in matches with solution
	je SolutionCorrect
	cmp al, [di]; Go to next to check if its also equal
	je goNext
	jmp SolutionIncorrect; if there is no match at any point Solution is incorrect
	
	
	goNext:
	inc si
	inc di
	sub cl, 1
	jmp submitAns

	
	
	SolutionCorrect:; if it is correct "CORRECt!" will be printed 
	mov al,1
	mov bh, 1
	mov bl, 74h
	mov cx, msg35end - offset msg35
	mov dl, 67
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg35
	mov ah, 13h
	int 10h
	jmp msg35end
	msg35 db "         "
	msg35end:
	
	mov al,1
	mov bh, 1
	mov bl, 72h
	mov cx, msg26end - offset msg26
	mov dl, 67
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg26
	mov ah, 13h
	int 10h
	jmp msg26end
	msg26 db "CORRECT!"
	msg26end:
	jmp USER
	
	SolutionIncorrect:; if it is correct "WRONG! TRY AGAIN" will be printed 
	mov al,1
	mov bh, 1
	mov bl, 74h
	mov cx, msg27end - offset msg27
	mov dl, 67
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg27
	mov ah, 13h
	int 10h
	jmp msg27end
	msg27 db "WRONG!  "
	msg27end:
	
	mov al,1
	mov bh, 1
	mov bl, 74h
	mov cx, msg32end - offset msg32
	mov dl, 67
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg32
	mov ah, 13h
	int 10h
	jmp msg32end
	msg32 db "Try Again"
	msg32end:
	jmp USER
	
	
	goBack:
	mov ah, 05h
	mov al, 1
	int 10h
	jmp USER
	
	goback2:
	mov ah, 0Fh
	int 10h
	mov ah, 05h
	mov al, 2
	int 10h
	MOV AX, 0600h       
	MOV BH, 72h    
	MOV CX, 0000h        
	MOV DX, 184Fh       
	INT 10h
	
	

	;hOW TO PLAY PAGE
    mov al,1
	mov bh, 2
	mov bl, 71h
	mov cx, msg13end - offset msg13
	mov dl, 25
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg13
	mov ah, 13h
	int 10h
	jmp msg13end
	msg13 db "Sudoku by Mohammed Bhuiyan"
	msg13end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg14end - offset msg14
	mov dl, 6
	mov dh, 5
	push cs
	pop es
	mov bp, offset msg14
	mov ah, 13h
	int 10h
	jmp msg14end
	msg14 db "HOW TO PLAY: "
	msg14end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg15end - offset msg15
	mov dl, 6
	mov dh, 6
	push cs
	pop es
	mov bp, offset msg15
	mov ah, 13h
	int 10h
	jmp msg15end
	msg15 db "Use ARROW KEYS to move."
	msg15end:
   
    

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg16end - offset msg16
	mov dl, 6
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg16
	mov ah, 13h
	int 10h
	jmp msg16end
	msg16 db "Use NUMBER KEYS to ENTER or REPLACE numbers 1-9 "
	msg16end:
   
    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg17end - offset msg17
	mov dl, 6
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg17
	mov ah, 13h
	int 10h
	jmp msg17end
	msg17 db "To Enter or Replace '10' press (a)"
	msg17end:

    mov al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg18end- offset msg18
	mov dl, 6
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg18
	mov ah, 13h
	int 10h
	jmp msg18end
    msg18 db "To Enter or Replace '11' press (b)"
	msg18end:


    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg19end- offset msg19
	mov dl, 6
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg19
	mov ah, 13h
	int 10h
	jmp msg19end
    msg19 db "To Enter or Replace '12' press (c)"
	msg19end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg25end- offset msg25
	mov dl, 6
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg25
	mov ah, 13h
	int 10h
	jmp msg25end
    msg25 db "Press (s) to display the answer"
	msg25end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg20end- offset msg20
	mov dl, 6
	mov dh, 12
	push cs
	pop es
	mov bp, offset msg20
	mov ah, 13h
	int 10h
	jmp msg20end
    msg20 db "Press (t) to go back to your progress"
	msg20end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg21end- offset msg21
	mov dl, 6
	mov dh, 13
	push cs
	pop es
	mov bp, offset msg21
	mov ah, 13h
	int 10h
	jmp msg21end
    msg21 db "Press (j) to clear your board"
	msg21end:
     mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg22end- offset msg22
	mov dl, 6
	mov dh, 14
	push cs
	pop es
	mov bp, offset msg22
	mov ah, 13h
	int 10h
	jmp msg22end
    msg22 db "Press (k) to submit your answer"
	msg22end:

     mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg23end- offset msg23
	mov dl, 6
	mov dh, 15
	push cs
	pop es
	mov bp, offset msg23
	mov ah, 13h
	int 10h
	jmp msg23end
    msg23 db "Press (p) to play"
	msg23end:

    mov  al,1
	mov bh, 2
	mov bl, 70h
	mov cx, msg24end- offset msg24
	mov dl, 6
	mov dh, 16
	push cs
	pop es
	mov bp, offset msg24
	mov ah, 13h
	int 10h
	jmp msg24end
    msg24 db "Press (r) to return to this page"
	msg24end:
	jmp USER
	
	
	
	 
;get specific x and y position to create an index
get_row proc
  cmp y_pos,1d
  je set_row_1
  cmp y_pos,3d
  je set_row_2
  cmp y_pos,5d
  je set_row_3
  cmp y_pos,7d
  je set_row_4
  cmp y_pos,9d
  je set_row_5
  cmp y_pos,11d
  je set_row_6
  cmp y_pos,13d
  je set_row_7
  cmp y_pos,15d
  je set_row_8
  cmp y_pos,17d
  je set_row_9
  cmp y_pos,19d
  je set_row_10
  cmp y_pos,21d
  je set_row_11
  cmp y_pos,23d
  je set_row_12
get_row ENDP
    set_row_1:
		mov row_num, 0d
		ret
    set_row_2:
		mov row_num, 12d
		ret
    set_row_3:
		mov row_num, 24d
		ret
    set_row_4:
		mov row_num, 36d
		ret
    set_row_5:
		mov row_num, 48d
		ret
    set_row_6:
		mov row_num, 60d
		ret
    set_row_7:
		mov row_num, 72d
		ret
    set_row_8:
		mov row_num, 84d
		ret
    set_row_9:
		mov row_num, 96d
		ret
	set_row_10:
		mov row_num, 108d
		ret
	set_row_11:
		mov row_num, 120d
		ret
	set_row_12:
		mov row_num, 132d
		ret
get_col proc
  cmp x_pos,5d
  je set_col_1
  cmp x_pos,10d
  je set_col_2
  cmp x_pos,15d
  je set_col_3
  cmp x_pos,20d
  je set_col_4
  cmp x_pos,25d
  je set_col_5
  cmp x_pos,30d
  je set_col_6
  cmp x_pos,35d
  je set_col_7
  cmp x_pos,40d
  je set_col_8
  cmp x_pos,45d
  je set_col_9
  cmp x_pos,50d
  je set_col_10
  cmp x_pos,55d
  je set_col_11
  cmp x_pos,60d
  je set_col_12
get_col ENDP
  
	set_col_1:
		mov col_num, 0d
		ret
    set_col_2:
		mov col_num,1d 
		ret
    set_col_3:
		mov col_num, 2d
		ret
    set_col_4:
		mov col_num, 3d
		ret
    set_col_5:
		mov col_num, 4d
		ret
    set_col_6:
		mov col_num, 5d
		ret
    set_col_7:
		mov col_num, 6d
		ret
    set_col_8:
		mov col_num, 7d
		ret
    set_col_9:
		mov col_num, 8d
		ret
	set_col_10:
		mov col_num, 9d
		ret
    set_col_11:
		mov col_num, 10d
		ret
	set_col_12:
		mov col_num, 11d
		ret
 
	QUIT:
	mov ax, 0600h 
	mov bh, 07h 
	mov cx, 0000h
	mov dx, 184fh 
	int 10h 
	
	mov ah, 4ch
	int 21h
END start