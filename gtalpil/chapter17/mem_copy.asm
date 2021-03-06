;Memory-to-memory copy                     MEM_COPY.ASM
;
;        Objective: To demonstrate memory-to-memory copy 
;                   using the string instructions.
;            Input: None.
;           Output: Outputs the copied array.  

%include "io.mac"

.DATA
in_array       dd  10,20,30,40,50,60,70,80,90,100
ARRAY_SIZE     EQU ($-in_array)/4
out_msg        db  'The copied array is: ',0

.UDATA
out_array      resd  ARRAY_SIZE

.CODE
        .STARTUP
        mov     ECX,ARRAY_SIZE   ; ECX = array size
        mov     ESI,in_array     ; ESI = in array pointer
        mov     EDI,out_array    ; EDI = out array pointer
        cld                      ; forward direction
        rep     movsd
       
        PutStr  out_msg
        mov     ECX,ARRAY_SIZE  
        mov     ESI,out_array
repeat1:
        lodsd
        PutLInt EAX
        nwln
        loop    repeat1     
        .EXIT 