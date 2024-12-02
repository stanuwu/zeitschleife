    ; Detect TimeLoop
    ; If timeLoop is detected, register A will be set to 1 on halt
    ; If no loop is detected, register A will be set to 0 on halt

    ; Main
    ORG  1000
    DCX  SP		            ; initialize stack

    ; call to break the algo
    CALL BROKEN_DATA

    LXI  H, 1000            ; set HL to 1000
    LXI  B, 0               ; set BC to 0
LOOP1:
    LXI  D, 0               ; set DE to 0
LOOP2:
    ; call to ScanRecursive
    PUSH B
    PUSH D
    PUSH H
    LDA  SERIES_LENGTH
    CALL SCAN_RECURSIVE
    POP  H
    POP  D
    POP  B

    INX  D                   ; increment DE

    ; if DE is not 1000 go to LOOP2
    MOV  A, H
    CMP  D
    JNZ  LOOP2
    MOV  A, L
    CMP  E
    JNZ  LOOP2

    INX  B                   ; increment BC

    ; if BC is not 1000 go back to LOOP1
    MOV  A, H
    CMP  B
    JNZ  LOOP1
    MOV  A, L
    CMP  C
    JNZ  LOOP1

    MVI  A, 0
    JMP  DONE                ; done

; Scan if the two given locations contain the same sequence up to series length
SCAN_RECURSIVE:
    ; check if match was found
    CPI  0
    JNZ  NOT_ZERO
    MVI  A, 1
    JMP  DONE                ; done
NOT_ZERO:

    ; save value in a
    STA  STORE

    ; check if BC or DE are equal to 1000 (overflowing)
    MOV  A, H
    CMP  B
    JNZ  NOT_K
    MOV  A, L
    CMP  C
    JNZ  NOT_K
    JMP  NOT_FOUND
NOT_K:
    MOV  A, H
    CMP  D
    JNZ  NOT_K2
    MOV  A, L
    CMP  E
    JNZ  NOT_K2
    JMP  NOT_FOUND
NOT_K2:

    ; check if BC and DE are the same
    MOV  A, B
    CMP  D
    JNZ  NOT_SAME
    MOV  A, C
    CMP  E
    JNZ  NOT_SAME
    JMP  NOT_FOUND
NOT_SAME:

    ; check if data at these locations is the same
    PUSH H
    LXI  H, DATA
    DAD  B
    MOV  A, M
    PUSH B
    MOV  B, A
    LXI  H, DATA
    DAD  D
    MOV  A, M
    CMP  B
    POP  B
    POP  H
    JNZ  NOT_FOUND

    ; recursive call
    LDA  STORE
    INX  B
    INX  D
    DCR  A
    CALL SCAN_RECURSIVE

NOT_FOUND:
    RET

; Create Data that fools the algorithm
BROKEN_DATA:
    MVI  A, 0               ; set A to 0
    LXI  B, 0               ; set BC to 0
    LXI  D, 0               ; set DE to 0

DATA_LOOP:
    LXI  H, 18

    ; write new number to data
    PUSH H
    LXI  H, DATA
    DAD  B
    MOV  M, A
    POP  H

    ; increment a
    INR  A

    ; if A is 9 set it to 0
    CPI  9
    JNZ  NOT_NINE
    MVI  A, 0

NOT_NINE:

    ; if BC is not 1000 go to DATA_LOOP
    INX  B
    STA  STORE
    MOV  A, H
    CMP  B
    JNZ  DATA_LOOP
    MOV  A, L
    CMP  C
    LDA  STORE
    JNZ  DATA_LOOP

    RET

; Stop the processor (result should be in register A by this point)
DONE:
    HLT

    ; register storage
STORE: DW 0

    ; data array
DATA: DB 5,0,8,7,9,5,3,7,4,2,9,3,5,6,7,0,2,4,9,2,8,7,9,1,3,6,2,8,6,1,3,5,9,4,2,8,8,6,7,0,4,8,7,1,2,6,8,6,4,5,7,7,1,5,8,4,2,7,1,9,2,0,6,6,9,1,4,8,0,8,6,0,6,4,1,2,4,5,6,6,9,3,9,5,9,3,8,6,0,9,1,2,2,2,2,7,0,7,4,5,4,2,6,0,4,8,0,5,0,1,9,1,9,3,0,0,7,9,9,5,7,0,5,4,8,2,2,1,4,9,7,3,1,6,8,7,0,7,8,8,5,3,6,5,9,6,0,2,5,2,3,7,9,6,6,2,3,5,7,5,0,8,7,9,5,3,7,4,2,5,6,4,9,1,0,4,2,5,9,8,1,9,7,1,5,4,3,5,1,9,2,7,6,6,2,0,9,7,6,6,6,5,9,2,4,8,8,3,3,0,7,7,8,8,5,3,5,2,9,8,4,5,0,5,6,2,1,6,9,2,3,9,8,7,7,1,1,8,2,1,8,5,4,0,4,4,7,6,0,9,4,7,2,9,1,0,0,4,8,1,2,5,5,2,3,1,4,7,6,3,2,1,6,9,0,8,7,1,9,0,8,0,2,8,1,5,5,9,9,2,9,4,9,7,5,1,3,8,1,4,9,1,8,5,9,0,4,5,6,0,3,6,3,1,8,8,6,5,5,7,2,6,2,8,6,8,9,5,2,3,9,5,8,4,6,3,4,8,2,8,2,7,3,2,9,8,3,9,8,1,0,1,5,1,9,6,4,3,2,5,9,2,0,7,6,9,9,6,5,4,3,7,4,8,3,0,3,6,2,1,2,7,5,2,8,7,3,6,8,1,7,6,2,4,0,7,3,7,4,1,7,0,9,9,7,9,3,4,2,5,5,6,8,5,5,9,3,0,6,4,1,7,0,1,6,5,2,6,4,7,4,6,1,4,2,6,1,9,4,0,6,5,3,2,2,3,4,2,2,7,5,3,5,1,5,6,0,6,8,4,5,1,4,2,5,3,1,9,6,2,0,6,9,6,8,2,4,9,2,7,0,1,8,0,0,8,5,1,2,5,8,3,0,8,0,4,8,9,4,5,0,4,0,3,0,3,2,9,3,7,8,4,7,1,3,5,8,2,4,9,3,5,0,6,2,9,1,6,7,4,6,7,7,7,1,7,6,0,5,2,1,3,3,2,1,5,1,5,1,3,6,3,1,2,3,3,0,6,0,6,1,2,5,1,7,6,6,4,1,5,1,6,7,6,0,4,1,2,6,3,6,2,0,1,2,2,8,1,0,2,9,0,1,1,6,3,4,4,1,7,3,7,3,3,6,1,8,2,4,0,2,9,4,4,2,3,5,8,0,7,4,7,3,9,0,3,4,5,0,0,3,9,5,1,1,8,4,0,8,8,7,2,3,9,8,2,0,5,3,6,7,6,0,5,9,7,3,5,7,3,3,1,6,9,3,5,8,5,6,7,9,1,6,4,1,5,4,9,5,4,9,5,9,7,0,9,2,7,5,0,2,5,4,8,6,8,5,5,5,4,8,1,6,4,5,3,1,6,0,9,5,1,0,1,6,1,7,6,0,1,7,5,0,2,5,5,7,6,9,3,3,5,5,3,0,6,5,6,1,2,0,8,3,1,5,0,3,0,4,8,3,0,9,7,9,7,6,5,1,0,8,8,1,5,6,7,3,6,7,8,9,7,7,6,8,6,8,4,4,8,0,1,4,3,3,3,7,8,1,9,6,0,8,3,7,7,8,4,6,5,7,8,5,1,1,3,5,9,3,5,0,0,1,2,6,9,5,3,5,5,2,8,1,2,0,2,7,8,7,4,1,0,8,6,1,0,9,5,0,8,4,2,3,3,9,1,1,1,5,9,0,1,4,6,8,8,5,0,9,3,3,4,7,0,4,6,5,3,7,1,4,7,2,9,0,9,4,3,0,4,7,6,9,7,1,1,9,1,0,4,6,7,2,3,5,3,7,0,8,8,2,8,2,8,1,3,4,0,7,7,2,3,1,8,6,4,8,8,6,5,5,6,8,5,1,7,6,9,6,3,5,4,1,3,3,1,7,1,4,6,9,5,8,7,6,0,7,2,0,9,6,5,9,8,6,5,4,9,1,8,2,8,1,0,4,7,5,6,7,3,6,7,6,0,1,4,4,1,6,0,4,0,7,6,9,0,0,7,9,6,1,5,6,8,3,5,9,0,9,9

    ; series length
    SERIES_LENGTH: DW 10     ; change this to 9 to detect the loop again
    
    END