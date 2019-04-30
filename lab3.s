// Morgan Fleshren
// COEN 20 Spring 2019
// Lab3
// Tuesday 9:15
        .syntax     unified
        .cpu        cortex-m4
        .text
        .align      2

//void UseLDRB(void *dst, void *src);
        .global     UseLDRB
        .thumb_func
UseLDRB:
         .rept      512 //start 512 repititions
		 LDRB 		R2, [R1], 1 //Loads *src into R2 and post-increments
		 STRB		R2, [R0], 1 //Store R2 in *dst
		 .endr 		//end repititions
		 BX 		LR //return

//void UseLDRH(void *dst, void *src);
		.global     UseLDRH
        .thumb_func
UseLDRH:
        .rept   	256 //start 256 repititions
        LDRH 		R2, [R1], 2 //Loads *src into R2 and post-increments
		STRH		R2, [R0], 2 //Store R2 in *dst
		.endr 		//end repititions
		BX 			LR //return


//void UseLDR(void *dst, void *src);
		.global     UseLDR
        .thumb_func
UseLDR:
        .rept   	128 //start 128 repititions
        LDR 		R2, [R1], 4 //Loads *src into R2 and post-increments
        STR 		R2, [R0], 4 //Store R2 in *dst
        .endr 		//end repititions
        BX 			LR //return


//void UseLDRD(void *dst, void *src);
		.global     UseLDRD
        .thumb_func
UseLDRD:
        .rept   	64 //start 64 repititions
        LDRD 		R2, R3, [R1], 8 //Loads *src into R3.R2 and post-increments
        STRD 		R2, R3, [R0], 8 //Store R3.R2 in *dst
        .endr 		//end repititions
        BX 			LR //return


//void UseLDMIA(void *dst, void *src);
		.global     UseLDMIA
        .thumb_func
UseLDMIA:
        PUSH    	{R2-R9} //need 8 registers to store 4 bytes each so 8*4=32 bytes at a time
        .rept   	16 //start 16 repititions
        LDMIA 		R1!, {R2-R9} //update and increment R1 after loading it into R2:R9
        STMIA		R0!, {R2-R9} //update and increment R0 after storing R2:R9 at R0
        .endr 		//end repititions
        POP 		{R2-R9} //restore previous values of the 8 registers

        BX 			LR //return


.end
