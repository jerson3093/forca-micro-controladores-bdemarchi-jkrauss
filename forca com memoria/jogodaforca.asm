
_write_eeprom:

;jogodaforca.c,29 :: 		void write_eeprom(unsigned char address, unsigned char dado)
;jogodaforca.c,31 :: 		Soft_I2C_Start();               // Issue start signal
	CALL        _Soft_I2C_Start+0, 0
;jogodaforca.c,32 :: 		Soft_I2C_Write(0xA0);           // Address eeprom 24C01, write ID
	MOVLW       160
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,33 :: 		Soft_I2C_Write(address);        // Start from address
	MOVF        FARG_write_eeprom_address+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,34 :: 		Soft_I2C_Write(dado);           // data
	MOVF        FARG_write_eeprom_dado+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,35 :: 		Soft_I2C_Stop();               // Do it
	CALL        _Soft_I2C_Stop+0, 0
;jogodaforca.c,36 :: 		delay_ms(16);
	MOVLW       42
	MOVWF       R12, 0
	MOVLW       141
	MOVWF       R13, 0
L_write_eeprom0:
	DECFSZ      R13, 1, 0
	BRA         L_write_eeprom0
	DECFSZ      R12, 1, 0
	BRA         L_write_eeprom0
	NOP
	NOP
;jogodaforca.c,37 :: 		}
	RETURN      0
; end of _write_eeprom

_read_eeprom:

;jogodaforca.c,39 :: 		unsigned char read_eeprom(unsigned char address)
;jogodaforca.c,43 :: 		Soft_I2C_Start();               // Issue start signal
	CALL        _Soft_I2C_Start+0, 0
;jogodaforca.c,44 :: 		Soft_I2C_Write(0xA0);           // Address eeprom 24C01,false write, ID
	MOVLW       160
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,45 :: 		Soft_I2C_Write(address);              // Start from address
	MOVF        FARG_read_eeprom_address+0, 0 
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,46 :: 		Soft_I2C_Start();               // Issue start signal
	CALL        _Soft_I2C_Start+0, 0
;jogodaforca.c,47 :: 		Soft_I2C_Write(0xA1);           // Address eeprom 24C01, read
	MOVLW       161
	MOVWF       FARG_Soft_I2C_Write_data_+0 
	CALL        _Soft_I2C_Write+0, 0
;jogodaforca.c,48 :: 		dat = Soft_I2C_read(0);       // read
	CLRF        FARG_Soft_I2C_Read_ack+0 
	CLRF        FARG_Soft_I2C_Read_ack+1 
	CALL        _Soft_I2C_Read+0, 0
	MOVF        R0, 0 
	MOVWF       read_eeprom_dat_L0+0 
;jogodaforca.c,49 :: 		Soft_I2C_Stop();               // do it
	CALL        _Soft_I2C_Stop+0, 0
;jogodaforca.c,50 :: 		return dat;
	MOVF        read_eeprom_dat_L0+0, 0 
	MOVWF       R0 
;jogodaforca.c,51 :: 		}
	RETURN      0
; end of _read_eeprom

_imprimeEstadoAtual:

;jogodaforca.c,53 :: 		void imprimeEstadoAtual() {
;jogodaforca.c,54 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;jogodaforca.c,56 :: 		sprintf(tentativasChar,"%d",tentativas);
	MOVLW       _tentativasChar+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_tentativasChar+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_jogodaforca+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_jogodaforca+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_jogodaforca+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _tentativas+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _tentativas+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;jogodaforca.c,58 :: 		UART1_Write_Text("JOGO DA FORCA - 1.0");
	MOVLW       ?lstr2_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,59 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,60 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,61 :: 		UART1_Write_Text(cabeca);
	MOVLW       _cabeca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_cabeca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,62 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,63 :: 		UART1_Write_Text(tronco);
	MOVLW       _tronco+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_tronco+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,64 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,65 :: 		UART1_Write_Text(barriga);
	MOVLW       _barriga+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_barriga+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,66 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,67 :: 		UART1_Write_Text(perna);
	MOVLW       _perna+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_perna+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,68 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,69 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,70 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr3_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,71 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,72 :: 		UART1_Write_Text(escondida);
	MOVLW       _escondida+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,73 :: 		UART1_Write_Text(" - Tentativas restantes: ");
	MOVLW       ?lstr4_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,74 :: 		UART1_Write_Text(tentativasChar);
	MOVLW       _tentativasChar+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_tentativasChar+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,75 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,76 :: 		UART1_Write_Text("----------------------------------");
	MOVLW       ?lstr5_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,77 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,78 :: 		}
	RETURN      0
; end of _imprimeEstadoAtual

_jogar:

;jogodaforca.c,80 :: 		void jogar() {
;jogodaforca.c,81 :: 		tentativas = 4;
	MOVLW       4
	MOVWF       _tentativas+0 
	MOVLW       0
	MOVWF       _tentativas+1 
;jogodaforca.c,83 :: 		strcpy(cabeca," V");
	MOVLW       _cabeca+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_cabeca+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,84 :: 		strcpy(tronco,"/|\\");
	MOVLW       _tronco+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tronco+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,85 :: 		strcpy(barriga," |");
	MOVLW       _barriga+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_barriga+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,86 :: 		strcpy(perna,"/ \\");
	MOVLW       _perna+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_perna+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,88 :: 		while (1) {
L_jogar1:
;jogodaforca.c,89 :: 		encontrou = 0;
	CLRF        _encontrou+0 
	CLRF        _encontrou+1 
;jogodaforca.c,90 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;jogodaforca.c,92 :: 		UART1_Read_Text(entrada, enter, 2);
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
;jogodaforca.c,94 :: 		for(i=0; i < strlen(palavra); i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_jogar3:
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
	GOTO        L__jogar49
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__jogar49:
	BTFSC       STATUS+0, 0 
	GOTO        L_jogar4
;jogodaforca.c,95 :: 		if(palavra[i] == entrada[0]) {
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORWF       _entrada+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar6
;jogodaforca.c,96 :: 		escondida[i] = entrada[0];
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVF        _entrada+0, 0 
	MOVWF       POSTINC1+0 
;jogodaforca.c,97 :: 		encontrou = 1;
	MOVLW       1
	MOVWF       _encontrou+0 
	MOVLW       0
	MOVWF       _encontrou+1 
;jogodaforca.c,98 :: 		}
L_jogar6:
;jogodaforca.c,94 :: 		for(i=0; i < strlen(palavra); i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;jogodaforca.c,99 :: 		}
	GOTO        L_jogar3
L_jogar4:
;jogodaforca.c,101 :: 		if(!encontrou) {
	MOVF        _encontrou+0, 0 
	IORWF       _encontrou+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar7
;jogodaforca.c,102 :: 		tentativas--;
	MOVLW       1
	SUBWF       _tentativas+0, 1 
	MOVLW       0
	SUBWFB      _tentativas+1, 1 
;jogodaforca.c,103 :: 		if(tentativas == 3){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__jogar50
	MOVLW       3
	XORWF       _tentativas+0, 0 
L__jogar50:
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar8
;jogodaforca.c,104 :: 		strcpy(perna," ");
	MOVLW       _perna+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_perna+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,105 :: 		}
L_jogar8:
;jogodaforca.c,106 :: 		if(tentativas == 2){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__jogar51
	MOVLW       2
	XORWF       _tentativas+0, 0 
L__jogar51:
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar9
;jogodaforca.c,107 :: 		strcpy(barriga," ");
	MOVLW       _barriga+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_barriga+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,108 :: 		}
L_jogar9:
;jogodaforca.c,109 :: 		if(tentativas == 1){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__jogar52
	MOVLW       1
	XORWF       _tentativas+0, 0 
L__jogar52:
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar10
;jogodaforca.c,110 :: 		strcpy(tronco," ");
	MOVLW       _tronco+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tronco+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,111 :: 		}
L_jogar10:
;jogodaforca.c,112 :: 		if(tentativas == 0){
	MOVLW       0
	XORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__jogar53
	MOVLW       0
	XORWF       _tentativas+0, 0 
L__jogar53:
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar11
;jogodaforca.c,113 :: 		strcpy(cabeca," ");
	MOVLW       _cabeca+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_cabeca+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_jogodaforca+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_jogodaforca+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;jogodaforca.c,114 :: 		}
L_jogar11:
;jogodaforca.c,115 :: 		}
L_jogar7:
;jogodaforca.c,117 :: 		if(!tentativas) {
	MOVF        _tentativas+0, 0 
	IORWF       _tentativas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar12
;jogodaforca.c,118 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;jogodaforca.c,119 :: 		UART1_Write_Text("GAME OVER");
	MOVLW       ?lstr14_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,120 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_jogar13:
	DECFSZ      R13, 1, 0
	BRA         L_jogar13
	DECFSZ      R12, 1, 0
	BRA         L_jogar13
	DECFSZ      R11, 1, 0
	BRA         L_jogar13
	NOP
;jogodaforca.c,121 :: 		break;
	GOTO        L_jogar2
;jogodaforca.c,122 :: 		} else if(strstr(escondida,"_") == 0) {
L_jogar12:
	MOVLW       _escondida+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_escondida+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr15_jogodaforca+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr15_jogodaforca+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__jogar54
	MOVLW       0
	XORWF       R0, 0 
L__jogar54:
	BTFSS       STATUS+0, 2 
	GOTO        L_jogar15
;jogodaforca.c,123 :: 		imprimeEstadoAtual();
	CALL        _imprimeEstadoAtual+0, 0
;jogodaforca.c,124 :: 		UART1_Write_Text("VOCE VENCEU! A PALAVRA ERA ");
	MOVLW       ?lstr16_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,125 :: 		UART1_Write_Text(palavra);
	MOVLW       _palavra+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_palavra+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,126 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_jogar16:
	DECFSZ      R13, 1, 0
	BRA         L_jogar16
	DECFSZ      R12, 1, 0
	BRA         L_jogar16
	DECFSZ      R11, 1, 0
	BRA         L_jogar16
	NOP
;jogodaforca.c,127 :: 		break;
	GOTO        L_jogar2
;jogodaforca.c,128 :: 		}
L_jogar15:
;jogodaforca.c,129 :: 		}
	GOTO        L_jogar1
L_jogar2:
;jogodaforca.c,130 :: 		}
	RETURN      0
; end of _jogar

_lerPalavraNova:

;jogodaforca.c,133 :: 		void lerPalavraNova(){
;jogodaforca.c,134 :: 		UART1_Write_Text("Digite a palavra: ");
	MOVLW       ?lstr17_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,135 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,136 :: 		UART1_Read_Text(palavra, enter, 20);
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
;jogodaforca.c,137 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,139 :: 		memoria = qtdPalavrasSalvas*20;
	MOVF        _qtdPalavrasSalvas+0, 0 
	MOVWF       R0 
	MOVF        _qtdPalavrasSalvas+1, 0 
	MOVWF       R1 
	MOVLW       20
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _memoria+0 
	MOVF        R1, 0 
	MOVWF       _memoria+1 
;jogodaforca.c,141 :: 		for(i=0; i < strlen(palavra); i++, memoria++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_lerPalavraNova17:
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
	GOTO        L__lerPalavraNova55
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__lerPalavraNova55:
	BTFSC       STATUS+0, 0 
	GOTO        L_lerPalavraNova18
;jogodaforca.c,142 :: 		escondida[i] = 95;
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVLW       95
	MOVWF       POSTINC1+0 
;jogodaforca.c,143 :: 		write_eeprom(memoria,palavra[i]); //guarda na memoria
	MOVF        _memoria+0, 0 
	MOVWF       FARG_write_eeprom_address+0 
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_eeprom_dado+0 
	CALL        _write_eeprom+0, 0
;jogodaforca.c,141 :: 		for(i=0; i < strlen(palavra); i++, memoria++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	INFSNZ      _memoria+0, 1 
	INCF        _memoria+1, 1 
;jogodaforca.c,144 :: 		}
	GOTO        L_lerPalavraNova17
L_lerPalavraNova18:
;jogodaforca.c,146 :: 		escondida[strlen(palavra)]=0;
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
;jogodaforca.c,149 :: 		for(; i<20; i++, memoria++) {
L_lerPalavraNova20:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lerPalavraNova56
	MOVLW       20
	SUBWF       _i+0, 0 
L__lerPalavraNova56:
	BTFSC       STATUS+0, 0 
	GOTO        L_lerPalavraNova21
;jogodaforca.c,150 :: 		write_eeprom(memoria,' ');
	MOVF        _memoria+0, 0 
	MOVWF       FARG_write_eeprom_address+0 
	MOVLW       32
	MOVWF       FARG_write_eeprom_dado+0 
	CALL        _write_eeprom+0, 0
;jogodaforca.c,149 :: 		for(; i<20; i++, memoria++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	INFSNZ      _memoria+0, 1 
	INCF        _memoria+1, 1 
;jogodaforca.c,151 :: 		}
	GOTO        L_lerPalavraNova20
L_lerPalavraNova21:
;jogodaforca.c,153 :: 		qtdPalavrasSalvas++;
	INFSNZ      _qtdPalavrasSalvas+0, 1 
	INCF        _qtdPalavrasSalvas+1, 1 
;jogodaforca.c,154 :: 		jogar();
	CALL        _jogar+0, 0
;jogodaforca.c,155 :: 		}
	RETURN      0
; end of _lerPalavraNova

_lerPalavraMemoria:

;jogodaforca.c,157 :: 		void lerPalavraMemoria() {
;jogodaforca.c,159 :: 		if (qtdPalavrasSalvas == 0){
	MOVLW       0
	XORWF       _qtdPalavrasSalvas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lerPalavraMemoria57
	MOVLW       0
	XORWF       _qtdPalavrasSalvas+0, 0 
L__lerPalavraMemoria57:
	BTFSS       STATUS+0, 2 
	GOTO        L_lerPalavraMemoria23
;jogodaforca.c,160 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,161 :: 		UART1_Write_Text("Sem palavras na memoria!");
	MOVLW       ?lstr18_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,162 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_lerPalavraMemoria24:
	DECFSZ      R13, 1, 0
	BRA         L_lerPalavraMemoria24
	DECFSZ      R12, 1, 0
	BRA         L_lerPalavraMemoria24
	DECFSZ      R11, 1, 0
	BRA         L_lerPalavraMemoria24
	NOP
	NOP
;jogodaforca.c,163 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,164 :: 		return;
	RETURN      0
;jogodaforca.c,165 :: 		}
L_lerPalavraMemoria23:
;jogodaforca.c,166 :: 		UART1_Write_Text("Digite o indice da palavra: ");
	MOVLW       ?lstr19_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,167 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,169 :: 		while (UART1_Data_Ready() == 0) {}
L_lerPalavraMemoria25:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_lerPalavraMemoria26
	GOTO        L_lerPalavraMemoria25
L_lerPalavraMemoria26:
;jogodaforca.c,170 :: 		indiceLeituraMemoria = UART1_Read()-48;
	CALL        _UART1_Read+0, 0
	MOVLW       48
	SUBWF       R0, 1 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       _indiceLeituraMemoria+0 
	MOVF        R1, 0 
	MOVWF       _indiceLeituraMemoria+1 
;jogodaforca.c,172 :: 		memoria = indiceLeituraMemoria*20;
	MOVLW       20
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _memoria+0 
	MOVF        R1, 0 
	MOVWF       _memoria+1 
;jogodaforca.c,174 :: 		for(i=0;i<20;i++,memoria++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_lerPalavraMemoria27:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lerPalavraMemoria58
	MOVLW       20
	SUBWF       _i+0, 0 
L__lerPalavraMemoria58:
	BTFSC       STATUS+0, 0 
	GOTO        L_lerPalavraMemoria28
;jogodaforca.c,175 :: 		palavra[i] = read_eeprom(memoria);
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__lerPalavraMemoria+0 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__lerPalavraMemoria+1 
	MOVF        _memoria+0, 0 
	MOVWF       FARG_read_eeprom_address+0 
	CALL        _read_eeprom+0, 0
	MOVFF       FLOC__lerPalavraMemoria+0, FSR1L
	MOVFF       FLOC__lerPalavraMemoria+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;jogodaforca.c,177 :: 		if(palavra[i] == ' ') {
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       32
	BTFSS       STATUS+0, 2 
	GOTO        L_lerPalavraMemoria30
;jogodaforca.c,178 :: 		palavra[i]=0;
	MOVLW       _palavra+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_palavra+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;jogodaforca.c,179 :: 		break;
	GOTO        L_lerPalavraMemoria28
;jogodaforca.c,180 :: 		}
L_lerPalavraMemoria30:
;jogodaforca.c,174 :: 		for(i=0;i<20;i++,memoria++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	INFSNZ      _memoria+0, 1 
	INCF        _memoria+1, 1 
;jogodaforca.c,181 :: 		}
	GOTO        L_lerPalavraMemoria27
L_lerPalavraMemoria28:
;jogodaforca.c,183 :: 		if(i==20) {
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lerPalavraMemoria59
	MOVLW       20
	XORWF       _i+0, 0 
L__lerPalavraMemoria59:
	BTFSS       STATUS+0, 2 
	GOTO        L_lerPalavraMemoria31
;jogodaforca.c,184 :: 		palavra[19] = 0;
	CLRF        _palavra+19 
;jogodaforca.c,185 :: 		}
L_lerPalavraMemoria31:
;jogodaforca.c,187 :: 		for(i=0; i < strlen(palavra); i++, memoria++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_lerPalavraMemoria32:
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
	GOTO        L__lerPalavraMemoria60
	MOVF        R0, 0 
	SUBWF       _i+0, 0 
L__lerPalavraMemoria60:
	BTFSC       STATUS+0, 0 
	GOTO        L_lerPalavraMemoria33
;jogodaforca.c,188 :: 		escondida[i] = 95;
	MOVLW       _escondida+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_escondida+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	MOVLW       95
	MOVWF       POSTINC1+0 
;jogodaforca.c,187 :: 		for(i=0; i < strlen(palavra); i++, memoria++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	INFSNZ      _memoria+0, 1 
	INCF        _memoria+1, 1 
;jogodaforca.c,189 :: 		}
	GOTO        L_lerPalavraMemoria32
L_lerPalavraMemoria33:
;jogodaforca.c,191 :: 		escondida[strlen(palavra)]=0;
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
;jogodaforca.c,192 :: 		jogar();
	CALL        _jogar+0, 0
;jogodaforca.c,193 :: 		}
	RETURN      0
; end of _lerPalavraMemoria

_zerar:

;jogodaforca.c,195 :: 		void zerar(){
;jogodaforca.c,196 :: 		for(i=0;i<qtdPalavrasSalvas;i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_zerar35:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _qtdPalavrasSalvas+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__zerar61
	MOVF        _qtdPalavrasSalvas+0, 0 
	SUBWF       _i+0, 0 
L__zerar61:
	BTFSC       STATUS+0, 0 
	GOTO        L_zerar36
;jogodaforca.c,197 :: 		write_eeprom(i,' ');
	MOVF        _i+0, 0 
	MOVWF       FARG_write_eeprom_address+0 
	MOVLW       32
	MOVWF       FARG_write_eeprom_dado+0 
	CALL        _write_eeprom+0, 0
;jogodaforca.c,196 :: 		for(i=0;i<qtdPalavrasSalvas;i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;jogodaforca.c,198 :: 		}
	GOTO        L_zerar35
L_zerar36:
;jogodaforca.c,199 :: 		qtdPalavrasSalvas = 0;
	CLRF        _qtdPalavrasSalvas+0 
	CLRF        _qtdPalavrasSalvas+1 
;jogodaforca.c,200 :: 		}
	RETURN      0
; end of _zerar

_main:

;jogodaforca.c,202 :: 		void main() {
;jogodaforca.c,204 :: 		enter[0]=13;
	MOVLW       13
	MOVWF       _enter+0 
;jogodaforca.c,205 :: 		enter[1]=0;
	CLRF        _enter+1 
;jogodaforca.c,207 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;jogodaforca.c,208 :: 		Delay_ms(100);                 // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 0
	BRA         L_main38
	DECFSZ      R12, 1, 0
	BRA         L_main38
	DECFSZ      R11, 1, 0
	BRA         L_main38
	NOP
;jogodaforca.c,211 :: 		Soft_I2C_Init();
	CALL        _Soft_I2C_Init+0, 0
;jogodaforca.c,213 :: 		while(executar) {
L_main39:
	MOVF        _executar+0, 0 
	IORWF       _executar+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
;jogodaforca.c,214 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;jogodaforca.c,215 :: 		UART1_Write_Text("Menu ");  UART1_Write_Text(enter);
	MOVLW       ?lstr20_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr20_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,216 :: 		UART1_Write_Text("1- Zerar memoria ");   UART1_Write_Text(enter);
	MOVLW       ?lstr21_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr21_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,217 :: 		UART1_Write_Text("2- Jogar sem uso de mem. "); UART1_Write_Text(enter);
	MOVLW       ?lstr22_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr22_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,218 :: 		UART1_Write_Text("3- Jogar com uso de mem. ");  UART1_Write_Text(enter);
	MOVLW       ?lstr23_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr23_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,219 :: 		UART1_Write_Text("4- Sair ");    UART1_Write_Text(enter);
	MOVLW       ?lstr24_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr24_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,220 :: 		UART1_Write_Text(enter);
	MOVLW       _enter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_enter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;jogodaforca.c,222 :: 		while (UART1_Data_Ready() == 0) {}
L_main41:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
	GOTO        L_main41
L_main42:
;jogodaforca.c,223 :: 		i = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
;jogodaforca.c,226 :: 		switch(i) {
	GOTO        L_main43
;jogodaforca.c,227 :: 		case 49: zerar(); break;
L_main45:
	CALL        _zerar+0, 0
	GOTO        L_main44
;jogodaforca.c,228 :: 		case 50: lerPalavraNova(); break;
L_main46:
	CALL        _lerPalavraNova+0, 0
	GOTO        L_main44
;jogodaforca.c,229 :: 		case 51: lerPalavraMemoria(); break;
L_main47:
	CALL        _lerPalavraMemoria+0, 0
	GOTO        L_main44
;jogodaforca.c,230 :: 		case 52: executar = 0; UART1_Write(12); UART1_Write_Text("FIM");  break;
L_main48:
	CLRF        _executar+0 
	CLRF        _executar+1 
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       ?lstr25_jogodaforca+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr25_jogodaforca+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	GOTO        L_main44
;jogodaforca.c,231 :: 		}
L_main43:
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main62
	MOVLW       49
	XORWF       _i+0, 0 
L__main62:
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main63
	MOVLW       50
	XORWF       _i+0, 0 
L__main63:
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main64
	MOVLW       51
	XORWF       _i+0, 0 
L__main64:
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main65
	MOVLW       52
	XORWF       _i+0, 0 
L__main65:
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
L_main44:
;jogodaforca.c,233 :: 		}
	GOTO        L_main39
L_main40:
;jogodaforca.c,234 :: 		}
	GOTO        $+0
; end of _main
