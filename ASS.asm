
_main:

;ASS.c,9 :: 		void main() {
;ASS.c,11 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;ASS.c,12 :: 		enter[1]=0;
	CLRF        _enter+1 
;ASS.c,14 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ASS.c,15 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
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
;ASS.c,17 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
	MOVLW       ?lstr1_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,18 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,19 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,20 :: 		UART1_Write_Text("Letras:");
	MOVLW       ?lstr2_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,21 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,22 :: 		UART1_Write_Text(letras1);
	MOVLW       _letras1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_letras1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,23 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,24 :: 		UART1_Write_Text(letras2);
	MOVLW       _letras2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_letras2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,25 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,26 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr3_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,27 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,28 :: 		UART1_Write_Text("_ _ _ _ _ _ _");
	MOVLW       ?lstr4_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,29 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,30 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr5_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,31 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,33 :: 		while (1) {                     // Endless loop
L_main1:
;ASS.c,34 :: 		UART1_Read_Text(teste, enter, 2);
	MOVLW       _teste+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_teste+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       2
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;ASS.c,35 :: 		UART1_Write_Text(teste);
	MOVLW       _teste+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_teste+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,36 :: 		if(strstr(palavra, teste) == NULL) {
	MOVLW       _palavra+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       _teste+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(_teste+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVLW       0
	XORWF       R0, 0 
L__main5:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;ASS.c,37 :: 		UART1_Write_Text(" errado");
	MOVLW       ?lstr6_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,38 :: 		} else {
	GOTO        L_main4
L_main3:
;ASS.c,39 :: 		UART1_Write_Text(" correto");
	MOVLW       ?lstr7_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,40 :: 		}
L_main4:
;ASS.c,41 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,42 :: 		}
	GOTO        L_main1
;ASS.c,43 :: 		}
	GOTO        $+0
; end of _main
