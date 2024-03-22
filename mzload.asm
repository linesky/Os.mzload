org 0x100
push ds
mov bx,0b800h
mov ds,bx
mov bx,1
mov cx,2000
mov al,17h
newf:
    ds
    mov [bx],al
    inc bx
    inc bx
    dec cx
    jnz newf
    mov bx,0b800h
mov ds,bx
mov bx,0
mov cx,2000
mov al,32
newfs:
    ds
    mov [bx],al
    inc bx
    inc bx
    dec cx
    jnz newfs
pop ds
;calculator of next 64 segment
	mov ax,cs
	mov bx,0x1000
	clc
	add ax,bx
	;push es
	push ax
;----------------------------------	
;open file
        mov ax,cs
        mov es,ax
	mov ax,6
	mov si,file1
	int 0x22
	mov ecx,eax
;----------------------------------
;read file	
        mov ax,7
        mov bx,0
        pop es
	int 0x22
;----------------------------------
;close file
	mov ax,8
	int 0x22
mov ax,es
mov ds,ax
;pop es
;----------------------------------
;cs load
mov ax,ds
mov bx,0x8
ds
mov cx,[bx]
add ax,cx
mov bx,0x16
ds
mov cx,[bx]
add ax,cx
mov si,ax
;----------------------------------
;ip load
mov bx,0x14
ds
mov cx,[bx]
mov di,cx
;----------------------------------
;ss load
mov ax,ds
mov sp,0xFFFF
mov bx,0x0e
ds
mov cx,[bx]
add ax,cx
mov ss,ax
;----------------------------------
;sp load
mov bx,0x10
ds
mov cx,[bx]
mov sp,cx
;----------------------------------
push si
push di
mov ax,cs
mov ds,ax
mov es,ax
mov si,0
mov di,0
mov bx,0
mov dx,0
mov cx,32000
mov ax,0
retf
call printe
	mov ah,0
int 0x21
halt:
jmp halt
printe:
	mov ax,ds
	mov es,ax
	mov ax,cs
	mov ds,ax
	mov bl,7
	mov cx,256
	mov dl,1
	mov dh,1
	mov al,1
	mov bp,0
	mov ah,0x13
int 0x10
	mov bp,sp
		mov ah,0
int 0x21
ret
file1 db "LOAD.EXE",0
