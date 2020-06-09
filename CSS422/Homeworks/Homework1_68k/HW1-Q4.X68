*-----------------------------------------------------------
* Title      :Homework 1
* Written by :Jun Hyung Park
* Date       :04/10/2020
* Description:Play around with moving data
*-----------------------------------------------------------
addr1   EQU $4000   
addr2   EQU $4001   
data2   EQU $A7FF   
data3   EQU $5555   
data4   EQU $0000   
data5   EQU 4678    
data6   EQU %01001111   
data7   EQU %00010111   

    ORG    $400 
    
START:        MOVE.W    #data2, D0     * Load D0               
              MOVE.B  #data6, D1  *Load D1
              MOVE.B  #data7, D2  * Load D2
              MOVE.W  #data3, D3  * Load D3
              MOVEA.W #addr1, A0  * Load address register
              MOVE.B  D1, (A0)+   * transfer byte to memory
              MOVE.B  D2, (A0)+   * transfer second byte
              MOVEA.W #addr1, A1  * load address
              AND.W   D3, (A1)    * Logic AND
                            
              JMP START   * This instruction keeps the program looping forever
              END $400    


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
