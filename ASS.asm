
_main:

;ASS.c,5 :: 		void main() {
;ASS.c,7 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;ASS.c,8 :: 		enter[1]=0;
	CLRF        _enter+1 
;ASS.c,10 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ASS.c,11 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 0
	BRA         L_main0
	DECFSZ      R12, 1, 0
	BRA         L_main0
	DECFSZ      R11, 1, 0
	BRA         L_main0
	NOP
;ASS.c,13 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
	MOVLW       ?lstr1_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,14 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,15 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,16 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,17 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,18 :: 		UART1_Write_Text("Digite a palavra e pressione Enter");
	MOVLW       ?lstr2_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,19 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,20 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,21 :: 		UART1_Read_Text(texto, enter, 30);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       30
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;ASS.c,22 :: 		UART1_Write_Text("TETA");
	MOVLW       ?lstr3_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,23 :: 		UART1_Write_Text(texto);
	MOVLW       _texto+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_texto+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,26 :: 		while (1) {                     // Endless loop
L_main1:
;ASS.c,27 :: 		if (UART1_Data_Ready()) {      // If data is received,
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;ASS.c,28 :: 		uart_rd = UART1_Read();      //   read the received data,
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;ASS.c,29 :: 		UART1_Write(uart_rd);        //   and send data via UART
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,30 :: 		}
L_main3:
;ASS.c,31 :: 		}
	GOTO        L_main1
;ASS.c,32 :: 		}
	GOTO        $+0
; end of _main
