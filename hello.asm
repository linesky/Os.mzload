format mz
start:
		
          mov edi,0b8001h
          mov ecx,80*26*2
          mov al,017h
          mov edx,2
          call fill32
          mov edi,0b8000h
          mov ecx,80*26*2
          mov al,'*'
          mov edx,2
          call fill32                          
                          
          exitdo:                
                                    
                                    
                    exit:                
                              int 20h                
                              xor ah,ah
                              int 21h                
                                             
                
halt:
jmp halt
fill32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JNZ FILL3211
          inc edx                
          FILL3211:
          FILL321:  
                    ds    
                    mov [edi],al
                    clc                
                    add edi,edx
                    dec ecx                
                    JNZ FILL321
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET                

x     db 0     
y     db 0
color dw 07h
string1 db "hello world.....",13,10,"$"
string2 db "$",0

