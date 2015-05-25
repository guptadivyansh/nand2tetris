// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


(Start)
	@KBD
	D = M
	@Pressed
	D; JNE // Jump to pressed
	@color  // stores the color to fill
	M = 0; // Key not pressed, fill with white
	@Fill
	0; JMP
(Pressed)
	@color
	M = -1; //Key pressed, fill with with black
(Fill)
	@i
	M = 0;
(Loop)
	@i
	D = M;
	@8192	//SCREEN is made of 8192 registers
	D = A - D; //8192 - i
	@Start
	D; JLE // Jump if 8192 - i <= 0

	@i
	D = M;
	@SCREEN
 	D = A + D // calculate the register number as SCREEN + i
	@regNo
	M = D  // store the address of row in regNo
	@color
	D = M // get the color to fill
	@regNo
	A = M // load the regNo
	M = D //set the reg to color
	@i
	M = M + 1

	@Loop
	0;JMP
 
