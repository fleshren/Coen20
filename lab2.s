.syntax     unified
.cpu        cortex-m4
.text
.thumb_func
.align       2

.global Ten32
Ten32:
			LDR     R0,=10 #set R0 to 10
            BX      LR #return

.global Ten64
Ten64:
			LDR     R0,=10 #set R0 to 10
			LDR     R1,=0 #make R1 = 0 since it wants 64 bits
            BX      LR #return

.global Incr
Incr:
			ADD     R0,R0,1 #R0=R0+1
            BX      LR #return

.global Nested1
Nested1:
            PUSH    {LR} #save link to return address
			BL      rand #R0 holds random result
			ADD     R0,R0,1 #R0=R0+1
            POP     {PC} #return

.global Nested2
Nested2:
			PUSH    {R4,LR} #need return address and R4 for copying values
			BL      rand #R0 has random number
			MOV     R4,R0 #R4 also has random number now
			BL      rand #R0 has new random number
			ADD     R0,R0,R4 #R0=R0+R4
			POP     {R4,PC} #return and restore R4

.global PrintTwo
PrintTwo: 
			PUSH    {R4,R5,LR} #need return address and extra registers that we will modify
			MOV     R4,R0 #copy R0 to R4
			MOV     R5,R1 #copy R1 to R5
			BL      printf #call printf function 
			ADD     R1,R5,1 #increment R5 by one. store in R1
			MOV     R0,R4 #copy R4 to R0
			BL      printf #printf function
			POP     {R4,R5,PC} #restore R4 and R5 and return

.end #call once at end of file
