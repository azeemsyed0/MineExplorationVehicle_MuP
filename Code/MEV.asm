#make_bin#

#LOAD_SEGMENT=FFFFh#
#LOAD_OFFSET=0000h#

#CS=0000h#
#IP=0000h#

#DS=0000h#
#ES=0000h#

#SS=0000h#
#SP=FFFEh#

#AX=0000h#
#BX=0000h#
#CX=0000h#
#DX=0000h#
#SI=0000h#
#DI=0000h#
#BP=0000h#

; add your code here
         jmp     st1 
         db     509 dup(0)
         pos    db 33h
;IVT entry for 80H
         
         dw     t_isr
         dw     0000
         db     508 dup(0)


;main program
          
st1:      cli 
; intialize ds, es,ss to start of RAM
          mov       ax,0200h
          mov       ds,ax
          mov       es,ax
          mov       ss,ax
          mov       sp,0FFFEH

;initialise 8255........................................................................
    MOV AL,10001010B ; port A_input port c_upper_input portb_input port c lower_output
    OUT 06H,AL    
    mov     al,80h  ;initialising the other 8255
    out     0eh,al   
    
;code for checking key release...........................................................

;check for key release
    ;mov al,00h
    ;out 00h,al


X0: MOV AL,00H
    OUT 04H,AL
X1: IN AL, 04H
    AND AL,0F0H
    CMP AL,0F0H
    JNZ X1

call delay2ms

;check for key press
    MOV AL,00H
    OUT 04H ,AL
X2: IN AL, 04H
    AND AL,0F0H
    CMP AL,0F0H
    JZ X2

call delay2ms

;check for key press
    MOV AL,00H
    OUT 04H ,AL
    IN AL, 04H
    AND AL,0F0H
    CMP AL,0F0H
    JZ X2

;check for key press in column1
    MOV AL, 0EH
    MOV BL,AL
    OUT 04H,AL
    IN AL,04H
    AND AL,0F0H
    CMP AL,0F0H
    JNZ X3

;check for key press in column2
    MOV AL, 0DH
    MOV BL,AL
    OUT 04H ,AL
    IN AL,04H
    AND AL,0F0H
    CMP AL,0F0H
    JNZ X3

;check for key press in column3
    MOV AL, 0BH
    MOV BL,AL
    OUT 04H,AL
    IN AL,04H
    AND AL,0F0H
    CMP AL,0F0H
    JNZ X3

;check for key press in column4
    MOV AL, 07H
    MOV BL,AL
    OUT 04H,AL
    IN AL,04H
    AND AL,0F0H
    CMP AL,0F0H
    JZ X2

;decode key
X3: OR AL,BL ;concatinating the rows and columns, thus al register now contains the hex code for the key pressed


y1: cmp AL,0EEh ;key 0
    jnz y2
    call stop
    
y2: cmp AL,0EDh
    jnz y3
    call forward ;key 1

y3: cmp AL,0EBh
    jnz y4
    call dig ;key 2

y4: cmp AL,0DEh
    jnz y5
    call left ;key 4

y5: cmp AL,0DDh
    jnz y6
    call spin ;key 5

y6: cmp AL,0DBh
    jnz y7
    call right ;key 6

y7: cmp AL,0BEh
    jnz y8
    call arm_horizontal_right ;key 8
    
y8: cmp AL,0BDh
    jnz y9
    call back ;key 9

y9: cmp AL,0BBh
    jnz y10
    call arm_vertical_up ;key 10

y10: cmp AL,07Eh
    jnz y11
    call arm_horizontal_left ;key 12

y11: cmp AL,07Dh
    jnz y12
    call delay2ms ;key 13       ;empty key, can be used later

y12: cmp AL,07Bh
    jnz y13
    call arm_vertical_down ;key 14

y13: JMP X0




;subroutines from here on


delay2ms proc near
    PUSH CX
    mov cx,00ffh 
xx2: nop 
    nop  
    loop xx2
    POP CX
    ret
delay2ms endp  

;STOP
stop proc near
           mov al,00h
           out 08h,al
           out 0ah,al
           out 0ch,al
            ret
stop endp


;FORWARD
forward proc near
          mov       al,0ffh    
          out       08h,al 
          mov       al,0fh
          out       0ah,al
          ret
forward endp


;BACKWARD
back proc near
    mov al,55h    
    out 08h,al 
    mov al,05h
    out 0ah,al
    ret
back endp
        
        
;DIG    
dig proc near
    mov  al,0ch
    out  08h,al
    ret
dig endp  


 
     
;360     
spin proc near
   mov  al,0ddh 
   out  08h,al
   mov  al,0dh
   out  0ah,al  
   ret
spin endp
    
;RIGHT    
right proc near   
   
   mov al,0ch 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor 
   
   mov al,09h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
   
   mov al,03h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
   
   mov al,06h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
    
   ret
right endp


    
;LEFT     
left proc near
 
   mov al,06h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor 
   
   mov al,03h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
   
   mov al,09h 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
   
   mov al,0ch 
   rol al,4 
   and al,0f0h
   out 0ah,al
   call delayMor
       
       ret
left endp


;ARM UP
arm_vertical_up proc near
    mov al,03h
    out 0ch,al 
    ret
arm_vertical_up endp
                   
;ARM DOWN
arm_vertical_down proc near
    mov al,01h
    out 0ch,al
    ret
arm_vertical_down endp

;ARM LEFT
arm_horizontal_left proc near
    mov al,04h
    out 0ch,al
    ret
arm_horizontal_left endp

;ARM RIGHT
arm_horizontal_right proc near
    mov al,0ch
    out 0ch,al
    ret
arm_horizontal_right endp




delayMor proc near

    MOV BX,1000  
    xdel: DEC BX       
    CMP BX,0000 
    JNZ xdel  
    RET
delayMor endp

    

t_isr:
iret
