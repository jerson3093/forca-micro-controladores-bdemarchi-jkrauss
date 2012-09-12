
_imprimeEstadoAtual:

;ASS.c,12 :: 		void imprimeEstadoAtual() {
;ASS.c,14 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
	MOVLW       ?lstr1_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,15 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,16 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,17 :: 		UART1_Write_Text("Letras:");
	MOVLW       ?lstr2_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,18 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,19 :: 		UART1_Write_Text(letras1);
	MOVLW       _letras1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_letras1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,20 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,21 :: 		UART1_Write_Text(letras2);
	MOVLW       _letras2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_letras2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,22 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,23 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr3_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,24 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,25 :: 		UART1_Write_Text(escondida);
	MOVLW       _escondida+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,26 :: 		UART1_Write_Text(" - Tentativas restantes: ");
	MOVLW       ?lstr4_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,27 :: 		UART1_Write_Text(tentativas);
	MOVF        _tentativas+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _tentativas+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,28 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,29 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr5_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,30 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,31 :: 		}
	RETURN      0
; end of _imprimeEstadoAtual

_main:

;ASS.c,33 :: 		void main() {
;ASS.c,35 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;ASS.c,36 :: 		enter[1]=0;
	CLRF        _enter+1 
;ASS.c,38 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ASS.c,39 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
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
;ASS.c,41 :: 		while (tentativas > 0) {
L_main1:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _tentativas+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main8
	MOVF        _tentativas+0, 0 
	SUBLW       0
L__main8:
	BTFSC       STATUS+0, 0 
	GOTO        L_main2
;ASS.c,42 :: 		encontrou = 0;
	CLRF        _encontrou+0 
	CLRF        _encontrou+1 
;ASS.c,43 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;ASS.c,45 :: 		UART1_Read_Text(entrada, enter, 2);
	MOVLW       _entrada+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_entrada+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       2
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;ASS.c,47 :: 		for(i=0; i < strlen(palavra); i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_main3:
	MOVLW       _palavra+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__main9:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;ASS.c,48 :: 		if(palavra[i] == entrada[0]) {
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORWF       _entrada+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;ASS.c,49 :: 		escondida[i] = entrada[0];
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVF        _entrada+0, 0 
	MOVWF       POSTINC1+0 
;ASS.c,50 :: 		encontrou = 1;
	MOVLW       1
	MOVWF       _encontrou+0 
	MOVLW       0
	MOVWF       _encontrou+1 
;ASS.c,51 :: 		}
L_main6:
;ASS.c,47 :: 		for(i=0; i < strlen(palavra); i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ASS.c,52 :: 		}
	GOTO        L_main3
L_main4:
;ASS.c,54 :: 		if(encontrou == 0) {
	MOVLW       0
	XORWF       _encontrou+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       0
	XORWF       _encontrou+0, 0 
L__main10:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;ASS.c,55 :: 		tentativas--;
	MOVLW       1
	SUBWF       _tentativas+0, 1 
	MOVLW       0
	SUBWFB      _tentativas+1, 1 
;ASS.c,56 :: 		}
L_main7:
;ASS.c,58 :: 		}
	GOTO        L_main1
L_main2:
;ASS.c,59 :: 		}
	GOTO        $+0
; end of _main
