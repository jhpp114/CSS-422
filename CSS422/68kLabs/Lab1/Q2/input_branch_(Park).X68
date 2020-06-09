*-----------------------------------------------------------
* Title      :Lab1  Question2   
* Written by :Jun H Park    
* Date       :04/08/2020    
* Description:Input, branching  
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
* Code for output
LOOP    LEA MESSAGE,    A1  
    MOVE.B  #14, D0
    TRAP #15
* COde for input
    MOVE.B  #4, D0  ; Trap task 4   
    TRAP    #15 
    CMP.L   #1774681,   D1  ;   Compare Exit key
    BEQ DONE    ;   Move if they are match
    *   Validation Check    
    CMP.L   #20,    D1  ;   Compare 
    BLT INVALID 
    CMP.L   #25,    D1  ;   Compare 
    BGT INVALID 
    *   End of Validation Check 
    CMP.L   #20,    D1  
    *   USE BNE to check if it is not equal to 20   
    BNE FONE    * If different direct to FONE   
    LEA MESSAGEZERO,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15 
    BRA LOOP    ;   if not equal go back to Loop    

* Code for Invalid message    
INVALID    LEA INV,    A1
        MOVE.B  #14,    D0  
        TRAP    #15 
        BRA LOOP  

* Code for Message 1  
FONE    CMP.L   #21,    D1
            BNE FTWO
            LEA MESSAGEONE, A1
      MOVE.B  #14,    D0  
      TRAP    #15 
      BRA LOOP
* Code for Message 2
FTWO    CMP.L   #22,    D1
        BNE FTHREE  
        LEA MESSAGETWO, A1  
        MOVE.B  #14,    D0  
        TRAP    #15 
        BRA LOOP    
*   Code for Message 3
FTHREE  CMP.L   #23,    D1  
        BNE FFOUR   
        LEA MESSAGETHREE, A1  
        MOVE.B  #14, D0  
        TRAP    #15 
        BRA LOOP    
* Code for Message 4
FFOUR   CMP.L   #24,    D1  
        BNE FFIVE   
        LEA  MESSAGEFOUR, A1
               MOVE.B   #14,    D0
               TRAP #15
                BRA LOOP 
* Code for Message 5
FFIVE   CMP.L   #24,    D1
        LEA MESSAGEFIVE, A1
               MOVE.B   #14, D0
                TRAP    #15 
                BRA LOOP  
* Terminate the program
DONE    LEA BYE, A1  
        MOVE.B  #14,    D0  
        TRAP    #15 
        MOVE.B  #9, D0
        TRAP    #15    ; Read a number from the keyboard into D1.L 
    
    SIMHALT             ; halt simulator

* Put variables and constants here
CR  EQU $0D
LF  EQU $0A 
MESSAGE DC.B    'Enter a number between 20 to 25 (inclusive) To Exit: enter 1774681: ',0
BYE DC.B    'Good Bye', 0   
INV DC.B    'That is not between 20 to 25 (inclusive).', CR, LF,0
MESSAGEZERO  DC.B    'You Typed 20 and 20 in binary is: 10100',  CR, LF, 0
MESSAGEONE  DC.B    'You Typed 21 and 21 in binary is: 10101',   CR,  LF, 0
MESSAGETWO    DC.B    'You Typed 22 and 22 in binary is: 10110',  CR, LF, 0
MESSAGETHREE DC.B    'You Typed 23 and 23 in binary is: 10111', CR, LF, 0
MESSAGEFOUR DC.B    'You Typed 24 and 24 in binary is: 11000',   CR, LF, 0
MESSAGEFIVE DC.B    'You Typed 25 and 25 in binary  is: 11001', CR, LF, 0
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
