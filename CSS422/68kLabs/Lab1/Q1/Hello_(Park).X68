*-----------------------------------------------------------
* Title      :Lab1 Question     1
* Written by :Jun Hyung Park    
* Date       :04/08/2020    
* Description:Hello World Program   
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    LEA     MESSAGE, A1     ; Load message into address resgister A1
    MOVE.B  #14,    D0      ; Move the number   14 into data register 0
    TRAP    #15             ; Displays Message 
    MOVE.B  #9, D0          ; #9 is terminate program
    TRAP    #15

    SIMHALT             ; halt simulator

* Put variables and constants here
CR  EQU $0D ; ASCII code for Carriage Return
LF  EQU $0A ;   ASCII code for Line Feed
MESSAGE DC.B    'HELLO, My Name is Jun Hyung Park',  CR, LF      ; Place ASCII string in memory at MESSAGE
        DC.B    'This program took me 10 minutes to finish, and ', CR, LF
        DC.B    'I hope I can enjoy the 68k programming.', CR, LF
        DC.B    'Thankfully, Lab 1,question 1 is not that hard!', CR, LF, CR, LF ; Note that just LF (line feed or \n works too)
        DC.B    'Thank you for listening!',0
    END    START        ; last line of source







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
