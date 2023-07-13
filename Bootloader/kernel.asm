org 0x7e00
jmp 0x0000:start

margem db '------------------------------------',0
score_player: db 0
;Menu
titulo	db	'SUBWAY SURFS', 0
opcao1 	db	'1 - PLAY', 0
opcao2	db	'2 - INSTRUCTIONS', 0
opcao3	db	'3 - CREDITS', 0

bug db ' ',0
;Creditos
alunos 	db 'ALUNOS :', 0
raas 	db '<raas>', 0
imm2 	db '<imm2>', 0
jvfr 	db '<jvfr>', 0
hlpaa 	db '<hlpaa>', 0
esc 	db 'press ESC to return', 0

;Instrucoes/ ALTERAR
como 	db	'-Para jogar basta usar seta pra cima e pra baixo.', 0
score	db 	'-Com o passar do tempo sua pontuacao aumenta.', 0
lose	db	'-Se bater em algum obstaculo perde.', 0

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    call Menu

jmp $

Menu:

	mov ax, 13;VGA mode 13h 320x200
    int 10h

    ;Mudando a cor do background
  	mov ah, 0xb ; escolhe a cor da tela
	mov bh, 0
	mov bl, 9   ;COR
	int 10h     ;VIDEO
	
	;margem superior
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 2   ;Coluna
	int 10h
	mov bl, 14
	mov si, margem
	call print_string
	
	;Titulo-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 14   ;Coluna
	int 10h
	mov bl, 14
	mov si, titulo
	call print_string
	
	;Play-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 9    ;Linha
	mov dl, 12   ;Coluna
	int 10h
	mov bl, 14
	mov si, opcao1
	call print_string
	
	;Instructions-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 12   ;Linha
	mov dl, 12   ;Coluna
	int 10h
	mov bl, 14
	mov si, opcao2
	call print_string
	
	;credits-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 15   ;Linha
	mov dl, 12   ;Coluna
	int 10h
	mov bl, 14
	mov si, opcao3
	call print_string
	
	ler_opcao:
		mov ah, 0
		int 16h ; teclado al-> recebe ASCII 
		
		cmp al, '1'
		je loop_game
		
		cmp al, '2'
		je intructions
		
		cmp al, '3'
		je credits
		
		jne ler_opcao
		

credits:
	
	mov ax, 13; VGA mode 13h 320x200
    int 10h
	
	;Mudando a cor do background
  	mov ah, 0xb ; escolhe a cor da tela
	mov bh, 0
	mov bl, 9   ;COR
	int 10h     ;VIDEO
	
	;margem superior
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 2    ;Coluna
	int 10h
	mov bl, 14
	mov si, margem
	call print_string
	
	;Titulo-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 14   ;Coluna
	int 10h
	mov bl, 14
	mov si, titulo
	call print_string
	
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 3    ;Linha
	mov dl, 2    ;Coluna
	int 10h
	mov bl, 14
	mov si, alunos
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 6   ;Linha
	mov dl, 4   ;Coluna
	int 10h
	mov bl, 14
	mov si, raas
	call print_string_delay

	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 9    ;Linha
	mov dl, 4    ;Coluna
	int 10h
	mov bl, 14
	mov si, imm2
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 12   ;Linha
	mov dl, 4    ;Coluna
	int 10h
	mov bl, 14
	mov si, jvfr
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 15   ;Linha
	mov dl, 4    ;Coluna
	int 10h
	mov bl, 14
	mov si, hlpaa
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 22   ;Linha
	mov dl, 10   ;Coluna
	int 10h
	mov bl, 14
	mov si, esc
	call print_string
	
	mov ah, 0
	int 16h ; teclado al-> recebe ASCII 

	call instruction_wait
	
intructions:
	
	mov ax, 13; VGA mode 13h 320x200
    int 10h
	
	;Mudando a cor do background
  	mov ah, 0xb ; escolhe a cor da tela
	mov bh, 0
	mov bl, 9   ;COR
	int 10h     ;VIDEO
	
	;margem superior
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 2   ;Coluna
	int 10h
	mov bl, 14
	mov si, margem
	call print_string
	
	;Titulo-str
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 1    ;Linha
	mov dl, 14   ;Coluna
	int 10h
	mov bl, 14
	mov si, titulo
	call print_string
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 5   ;Linha
	mov dl, 0   ;Coluna
	int 10h
	mov bl, 14
	mov si, como
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 10   ;Linha
	mov dl, 0   ;Coluna
	int 10h
	mov bl, 14
	mov si, score
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 15   ;Linha
	mov dl, 0   ;Coluna
	int 10h
	mov bl, 14
	mov si, lose
	call print_string_delay
	
	mov ah, 02h  ;move o cursor para o lugar certo
	mov bh, 0    ;Pagina 0
	mov dh, 22   ;Linha
	mov dl, 10   ;Coluna
	int 10h
	mov bl, 14
	mov si, esc
	call print_string
	
	mov ah, 0
	int 16h ; teclado al-> recebe ASCII 

	call instruction_wait

instruction_wait:
	
	mov ah, 0
	int 16h
	
	cmp al, 27
	je Menu
	jne instruction_wait
	
loop_game:

	mov ax, 13
	int 10h

	;Mudando a cor do background
  	mov ah, 0xb ; escolhe a cor da tela
	mov bh, 0
	mov bl, 12   ;COR
	int 10h     ;VIDEO

	mov si, personagem
	call _print_sprite

	mov ah, 0
	int 16h ; teclado al-> recebe ASCII 

	cmp al, 27
	je Menu


print_string_delay:
	lodsb
	cmp al,0
	je end

	mov ah, 0eh
	mov bl, 14
	int 10h

	mov dx, 0
	.delay_print:
	inc dx
	mov cx, 0
		.time:
			inc cx
			cmp cx, 40000
			jne .time

	cmp dx, 1000
	jne .delay_print

	jmp print_string_delay

	end:
		mov ah, 0eh
		mov al, 0xd
		int 10h
		mov al, 0xa
		int 10h
		ret

_print_sprite:                   ; imprime um sprite (guardado em SI) na posição coluna=cx, linha= dx

	push dx
	push cx
	
	.loop:
		lodsb   
		cmp al,'0'
		je .fim

		cmp al,'.'	
		je .next_line

		.next_pixel:
			call _print_pixel
			inc cx
			jmp .loop	
		
		.next_line:	
			
			pop cx      		 ;reseta cx para o valor inicial, o começo de uma nova linha
			push cx

			inc dx
			lodsb
			jmp .next_pixel
		
		.fim:
			pop cx
			pop dx
			;call _sleep
			;popa			
			ret 


_print_pixel:      	  			; printa um pixel na posição coluna = dx , linha = dx
        mov ah, 0ch
        mov bh, 0
        int 10h
        ret

print_string:
	lodsb
	cmp al, 0
	je .done

	mov ah, 0eh ; codigo para imprimir caractere em al
	int 10h ; interrupcao de video

	jmp print_string
	.done:
ret
