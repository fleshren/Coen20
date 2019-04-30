// Morgan Fleshren
// COEN 20 Spring 2019
// Lab4b Pixels, Fonts, and Fractals
// Tuesday 9:15

        .syntax     unified
        .cpu        cortex-m4
        .text
        .align


//uint32_t *PixelAddress(int x, int y);
        .global     PixelAddress
        .thumb_func

PixelAddress:	LDR 	R2,=240				//need the constant in a register to calculate x+240y
				MLA		R0, R1, R2, R0 		//R0 = k = x + 240*y
				LDR		R1,=0xD0000000 		//load beginning address of array
				ADD     R0, R1, R0, LSL 2	//add how far into the array we are
				BX		LR 


//uint8_t *BitmapAddress(char ascii, uint8_t *fontTable, int charHeight, int charWidth);
		.global     BitmapAddress
        .thumb_func

BitmapAddress:	ADD 	R3, R3, 7			// R3 = R3 + 7
				LSR		R3, R3, 3			// R3 = R3 / 8
				MUL		R3, R3, R2 			// R3 = R3 * R2
				SUB		R0, R0, ' '			// R0 = R0 - space = ascii - space
				MLA		R0, R0, R3, R1		// R0 = (R0*R3) + R1
				BX 		LR


//uint32_t GetBitmapRow(uint8_t *rowAdrs);
		.global     GetBitmapRow
        .thumb_func

GetBitmapRow:	LDR 	R0, [R0] 			// load address
				REV 	R0, R0				// reverse order of bits
				BX		LR

				.end