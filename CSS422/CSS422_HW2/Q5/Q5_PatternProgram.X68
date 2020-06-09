*-----------------------------------------------------------
* Title      :  Pattern Finding and Cumulative Program    
* Written by :  Jun Hyung Park  
* Date       :  May 02, 2020            
* Description:  Pattern Finding and Cumulative Program  
*-----------------------------------------------------------

*-------------------------------------------------------------------
* Some Pre-Defined Variables
CompareAddress EQU  $B000   
StartAddress    EQU $4000
EndAddress  EQU $6000   

Addr1   EQU $8000
Addsum EQU  $8004   
CarryBit    EQU $8010   
* Extra Variables just for my convenience
ADDONE EQU  $1
*-------------------------------------------------------------------
*   Main Program Star
    ORG    $1000
START:                  ; first instruction of program
    LEA WelcomeMessage, A1  
    MOVE.B  #14,    D0   
    TRAP    #15 
    CLR.W   AddSum  
    CLR.W   CarryBit    
* Setting up the B000 value and matched on second line  
    MOVE.B #$AA,     CompareAddress  
    MOVE.B  #$AA,   $4551     
    *MOVE.B  #$AA,   $6000                
        
* Put 4000 to A3
    MOVEA.W #StartAddress,   A3  
*-------------------------------------------------------------------          
SEARCH
    MOVE.B  (A3),   D0  
    CMP.B   CompareAddress, D0  * Same then found it  
    BEQ FOUND   
    CMPA.L  #EndAddress,    A3    
    BEQ NOTFOUND    
    BRA MOVENEXT    
*-------------------------------------------------------------------        
MOVENEXT
    ADDA.W  #ADDONE, A3  
    BRA SEARCH
*-------------------------------------------------------------------
FOUND
    MOVE.L  A3,  Addr1  * put A3 data to Add1
    BRA SETUPADD
*-------------------------------------------------------------------
NOTFOUND
    MOVE.L  #StartAddress, Addr1 * Store $4000 to Addr1 if not found   
    BRA SETUPADD
*-------------------------------------------------------------------      
SETUPADD
    MOVEA.L Addr1, A4   
* Add seres of bytes stored in 256 consecutive memory location beginning at address Addr1
ADDCONSECUTIVE
    *CLR.W   
    * use whatever Addr1 is and put it in A4
         
    MOVE.B  (A4)+,  D1  * Put whatever A4 is pointing to D1 
    ADD.W   D1, Addsum 
    BCS CARRYEXIST
    ADD.W   #1, D3  
    CMP.W   #255,   D3
    BGT DONE    
    BRA ADDCONSECUTIVE
   
*-------------------------------------------------------------------        
CARRYEXIST
    MOVE.W  #$1,    CarryBit
    BRA ADDCONSECUTIVE

DONE
    LEA PinrtAddress,   A1  
    MOVE.B  #14,    D0  
    TRAP    #15 
    
    MOVE.B  #15,    D0  
    MOVE.B  #16,    D2  
    MOVE.L Addr1,  D1    
    TRAP    #15 
        
    LEA CRLFMESSAGE,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15 
    
    LEA PrintADD,   A1  
    MOVE.B  #14,    D0  
    TRAP    #15     
    
    MOVE.B  #15,    D0  
    MOVE.B  #16,    D2  
    MOVE.W  Addsum, D1   
    TRAP    #15 
    
    LEA CRLFMESSAGE,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15

    LEA  PrintCarry,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15 
    
    MOVE.B  #15,    D0  
    MOVE.B  #16,    D2  
    MOVE.W  CarryBit,   D1  
    TRAP    #15 
    
    LEA CRLFMESSAGE,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15
   
    LEA BYE,    A1  
    MOVE.B  #14,    D0  
    TRAP    #15 
    

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
CR  EQU $0D 
LF  EQU $0A 
WelcomeMessage DC.B 'Welcome to Pattern Finding and Cummlative Program', CR, LF, 0
PrintADD    DC.B    'Sum of 256 Consequtive: ', 0
PinrtAddress    DC.B    'Address :',    0    
PrintCarry  DC.B    'Carry Bit: ',  0      
BYE DC.B    'Good Bye', 0  
CRLFMESSAGE DC.B    '', CR, LF, 0    

    END    START        ; last line of source   







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
