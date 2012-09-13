
_imprimeEstadoAtual:

;ASS.c,15 :: 		void imprimeEstadoAtual() {
;ASS.c,16 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ASS.c,18 :: 		sprintf(tentativasChar,"%d",tentativas);
	MOVLW       _tentativasChar+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_tentativasChar+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_ASS+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_ASS+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_ASS+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _tentativas+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _tentativas+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;ASS.c,20 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
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
;ASS.c,22 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,23 :: 		UART1_Write_Text(cabeca);
	MOVLW       _cabeca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_cabeca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,24 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,25 :: 		UART1_Write_Text(tronco);
	MOVLW       _tronco+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_tronco+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,26 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,27 :: 		UART1_Write_Text(barriga);
	MOVLW       _barriga+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_barriga+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,28 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,29 :: 		UART1_Write_Text(perna);
	MOVLW       _perna+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_perna+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,30 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,31 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,32 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr3_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,33 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,34 :: 		UART1_Write_Text(escondida);
	MOVLW       _escondida+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,35 :: 		UART1_Write_Text(" - Tentativas restantes: ");
	MOVLW       ?lstr4_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,36 :: 		UART1_Write_Text(tentativasChar);
	MOVLW       _tentativasChar+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_tentativasChar+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,37 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,38 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr5_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,39 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,40 :: 		}
	RETURN      0
; end of _imprimeEstadoAtual

_main:

;ASS.c,42 :: 		void main() {
;ASS.c,44 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;ASS.c,45 :: 		enter[1]=0;
	CLRF        _enter+1 
;ASS.c,47 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ASS.c,48 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
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
;ASS.c,50 :: 		UART1_Write_Text("Digite a palavra: ");
	MOVLW       ?lstr6_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,51 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,52 :: 		UART1_Read_Text(palavra, enter, 20);
	MOVLW       _palavra+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       20
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;ASS.c,53 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,55 :: 		for(i=0; i < strlen(palavra); i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_main1:
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
	GOTO        L__main18
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_main2
;ASS.c,56 :: 		escondida[i] = 95;
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVLW       95
	MOVWF       POSTINC1+0 
;ASS.c,55 :: 		for(i=0; i < strlen(palavra); i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ASS.c,57 :: 		}
	GOTO        L_main1
L_main2:
;ASS.c,58 :: 		escondida[strlen(palavra)]=0;
	MOVLW       _palavra+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       _escondida+0
	ADDWF       R0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;ASS.c,60 :: 		while (1) {
L_main4:
;ASS.c,61 :: 		encontrou = 0;
	CLRF        _encontrou+0 
	CLRF        _encontrou+1 
;ASS.c,62 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;ASS.c,64 :: 		UART1_Read_Text(entrada, enter, 2);
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
;ASS.c,66 :: 		for(i=0; i < strlen(palavra); i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_main6:
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
	GOTO        L__main19
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;ASS.c,67 :: 		if(palavra[i] == entrada[0]) {
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORWF       _entrada+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;ASS.c,68 :: 		escondida[i] = entrada[0];
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVF        _entrada+0, 0 
	MOVWF       POSTINC1+0 
;ASS.c,69 :: 		encontrou = 1;
	MOVLW       1
	MOVWF       _encontrou+0 
	MOVLW       0
	MOVWF       _encontrou+1 
;ASS.c,70 :: 		}
L_main9:
;ASS.c,66 :: 		for(i=0; i < strlen(palavra); i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ASS.c,71 :: 		}
	GOTO        L_main6
L_main7:
;ASS.c,73 :: 		if(!encontrou) {
	MOVF        _encontrou+0, 0 
	IORWF       _encontrou+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;ASS.c,74 :: 		tentativas--;
	MOVLW       1
	SUBWF       _tentativas+0, 1 
	MOVLW       0
	SUBWFB      _tentativas+1, 1 
;ASS.c,75 :: 		if(tentativas == 3){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       3
	XORWF       _tentativas+0, 0 
L__main20:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;ASS.c,76 :: 		strcpy(perna," ");
	MOVLW       _perna+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_perna+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_ASS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_ASS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ASS.c,77 :: 		}
L_main11:
;ASS.c,78 :: 		if(tentativas == 2){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       2
	XORWF       _tentativas+0, 0 
L__main21:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;ASS.c,79 :: 		strcpy(barriga," ");
	MOVLW       _barriga+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_barriga+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_ASS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_ASS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ASS.c,80 :: 		}
L_main12:
;ASS.c,81 :: 		if(tentativas == 1){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       1
	XORWF       _tentativas+0, 0 
L__main22:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;ASS.c,82 :: 		strcpy(tronco," ");
	MOVLW       _tronco+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tronco+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_ASS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_ASS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ASS.c,83 :: 		}
L_main13:
;ASS.c,84 :: 		if(tentativas == 0){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVLW       0
	XORWF       _tentativas+0, 0 
L__main23:
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;ASS.c,85 :: 		strcpy(cabeca," ");
	MOVLW       _cabeca+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_cabeca+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_ASS+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_ASS+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ASS.c,86 :: 		}
L_main14:
;ASS.c,87 :: 		}
L_main10:
;ASS.c,89 :: 		if(!tentativas) {
	MOVF        _tentativas+0, 0 
	IORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;ASS.c,90 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;ASS.c,91 :: 		UART1_Write_Text("GAME OVER");
	MOVLW       ?lstr11_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,92 :: 		break;
	GOTO        L_main5
;ASS.c,93 :: 		} else if(strstr(escondida,"_") == 0) {
L_main15:
	MOVLW       _escondida+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr12_ASS+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr12_ASS+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       0
	XORWF       R0, 0 
L__main24:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;ASS.c,94 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;ASS.c,95 :: 		UART1_Write_Text("VOCE VENCEU! A PALAVRA ERA ");
	MOVLW       ?lstr13_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,96 :: 		UART1_Write_Text(palavra);
	MOVLW       _palavra+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,97 :: 		break;
	GOTO        L_main5
;ASS.c,98 :: 		}
L_main17:
;ASS.c,99 :: 		}
	GOTO        L_main4
L_main5:
;ASS.c,100 :: 		}
	GOTO        $+0
; end of _main
