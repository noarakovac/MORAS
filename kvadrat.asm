
// Set screen dimensions
@16384
D=A
@SCREEN
M=D

// Set pixel color to black (0) for each pixel in the 128x128 grid
@0
D=A
@R0
M=D

(LOOP_Y)
    @0
    D=A
    @R1
    M=D

    (LOOP_X)
        // Set color to black
        @R0
        D=M
        @SCREEN
        A=D
        M=0

        // Move to the next pixel
        @R0
        M=M+1

        // Check if all pixels in the row are set
        @R1
        D=M
        @128
        D=D-A
        @LOOP_X
        D;JNE

    // Move to the next row
    @R1
    M=M+1

    // Check if all rows are set
    @128
    D=A
    @R1
    D=D-M
    @LOOP_Y
    D;JNE

// Infinite loop to stop the program
(LOOP)
@LOOP
0;JMP

// Screen memory map
(SCREEN)