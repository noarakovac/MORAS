@5
M=0

// Load values from RAM[0] to RAM[4] into D and add positive values
@0
D=M
@CHECK_ZERO
D;JLT
@5
M=M+D
(CHECK_ZERO)

@1
D=M
@CHECK_ONE
D;JLT
@5
M=M+D
(CHECK_ONE)

@2
D=M
@CHECK_TWO
D;JLT
@5
M=M+D
(CHECK_TWO)

@3
D=M
@CHECK_THREE
D;JLT
@5
M=M+D
(CHECK_THREE)

@4
D=M
@DONE
D;JLT
@5
M=M+D
(DONE)

// Treat negative values as zero
(CHECK_ZERO)
@5
M=M+D
@DONE
0;JMP

(CHECK_ONE)
@5
M=M+D
@DONE
0;JMP

(CHECK_TWO)
@5
M=M+D
@DONE
0;JMP

(CHECK_THREE)
@5
M=M+D
@DONE
0;JMP

// Infinite loop to stop the program
(DONE)
@DONE
0;JMP