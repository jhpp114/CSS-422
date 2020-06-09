*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    LEA BASICPAY,   A1  
    MOVE.L  #14,    D0  
    TRAP    #15 
    MOVE.L  #4, D0  
    TRAP    #15 
    MOVE.L  #ADDRESS1,   A0  
    MOVE.L  D1, (A0)+    
    CLR.B   D1  * clear data register 1 
    *   Cut line audience
    LEA PROFITCUTLINE,  A1  
    MOVE.L  #14,    D0  
    TRAP    #15 
    MOVE.L  #4, D0  
    TRAP    #15 
    MOVE.L  D1, (A0)+   
    CLR.B   D1  * clear data register 1 because the value is in memory $4004 with 32 bits
    *   Gurantee per audience
    LEA GRANTEE,    A1  
    MOVE.L  #14,    D0  
    TRAP    #15 
    MOVE.L  #4, D0  
    TRAP    #15 
    MOVE.L  D1, (A0)+    * no need to increase the memory anymore last input from user
    CLR.B   D1  * clear data register 1
    * BASIC CONDITION division 2
AUDIONE LEA AUDIONEMESSAGE, A1  
        MOVE.L  #14,    D0  
        TRAP    #15 
        * MOVE.L  #ADDRESS3,  (A0)  
        MOVE.L  #AdrMath,    A2  * put AdrMath address to A2
        MOVE.L  #10000000,  (A2)+   * put that number to pointer to A2
        *MOVE.L    
        
    
        
    
    
    SIMHALT             ; halt simulator

CR  EQU $0D 
LF  EQU $0A
ADDRESS1   EQU   $4000  
ADDRESS2    EQU $4004
ADDRESS3    EQU $4008
* BASIC MATH ADDRESS
AdrMath EQU $4010   


BASICPAY    DC.B    'BAISIC PAY ', 0 
PROFITCUTLINE DC.B    'Number of Audiences ', 0
GRANTEE DC.B    'Guarantee per audience ', 0

AUDIONEMESSAGE  DC.B    '1000000 people, expected pay: ', 0

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
