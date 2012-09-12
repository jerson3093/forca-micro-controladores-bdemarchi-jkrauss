
_imprimeEstadoAtual:

;ASS.c,12 :: 		void imprimeEstadoAtual() {
;ASS.c,15 :: 		sprintf(tentativasChar,"%d",tentativas);
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
;ASS.c,17 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
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
;ASS.c,19 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,20 :: 		UART1_Write_Text("Letras:");
	MOVLW       ?lstr3_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_ASS+0)
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
	MOVLW       ?lstr4_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,27 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,28 :: 		UART1_Write_Text(escondida);
	MOVLW       _escondida+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,29 :: 		UART1_Write_Text(" - Tentativas restantes: ");
	MOVLW       ?lstr5_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,30 :: 		UART1_Write_Text(tentativasChar);
	MOVLW       _tentativasChar+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_tentativasChar+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,31 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,32 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr6_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,33 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,34 :: 		}
	RETURN      0
; end of _imprimeEstadoAtual

_main:

;ASS.c,36 :: 		void main() {
;ASS.c,38 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;ASS.c,39 :: 		enter[1]=0;
	CLRF        _enter+1 
;ASS.c,41 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ASS.c,42 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
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
;ASS.c,44 :: 		while (1) {
L_main1:
;ASS.c,45 :: 		encontrou = 0;
	CLRF        _encontrou+0 
	CLRF        _encontrou+1 
;ASS.c,46 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;ASS.c,48 :: 		UART1_Read_Text(entrada, enter, 2);
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
;ASS.c,50 :: 		for(i=0; i < strlen(palavra); i++) {
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
	GOTO        L__main11
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__main11:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;ASS.c,51 :: 		if(palavra[i] == entrada[0]) {
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
;ASS.c,52 :: 		escondida[i] = entrada[0];
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVF        _entrada+0, 0 
	MOVWF       POSTINC1+0 
;ASS.c,53 :: 		encontrou = 1;
	MOVLW       1
	MOVWF       _encontrou+0 
	MOVLW       0
	MOVWF       _encontrou+1 
;ASS.c,54 :: 		}
L_main6:
;ASS.c,50 :: 		for(i=0; i < strlen(palavra); i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ASS.c,55 :: 		}
	GOTO        L_main3
L_main4:
;ASS.c,57 :: 		if(!encontrou) {
	MOVF        _encontrou+0, 0 
	IORWF       _encontrou+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;ASS.c,58 :: 		tentativas--;
	MOVLW       1
	SUBWF       _tentativas+0, 1 
	MOVLW       0
	SUBWFB      _tentativas+1, 1 
;ASS.c,59 :: 		}
L_main7:
;ASS.c,61 :: 		if(!tentativas) {
	MOVF        _tentativas+0, 0 
	IORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;ASS.c,63 :: 		UART1_Write_Text("GAME OVER");
	MOVLW       ?lstr7_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,64 :: 		break;
	GOTO        L_main2
;ASS.c,65 :: 		} else if(strstr(escondida,"_") == 0) {
L_main8:
	MOVLW       _escondida+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr8_ASS+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr8_ASS+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       0
	XORWF       R0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;ASS.c,67 :: 		UART1_Write_Text("VOCE VENCEU! A PALAVRA ERA ");
	MOVLW       ?lstr9_ASS+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_ASS+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,68 :: 		UART1_Write_Text(palavra);
	MOVLW       _palavra+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ASS.c,69 :: 		break;
	GOTO        L_main2
;ASS.c,70 :: 		}
L_main10:
;ASS.c,71 :: 		}
	GOTO        L_main1
L_main2:
;ASS.c,72 :: 		}
	GOTO        $+0
; end of _main
