char uart_rd;
char texto[31];
char tracos[31];
char enter[2];

void main() {

  enter[0]=13;
  enter[1]=0;
  strcpy(tracos,"------------------------------");
  
  UART1_Init(9600);              // Initialize UART module at 9600 bps
  Delay_ms(100);                 // Wait for UART module to stabilize

  UART1_Write_Text("JOGO DA FORCA - 1.0");
  UART1_Write(13);
  UART1_Write(10);
  UART1_Write(13);
  UART1_Write(10);
  UART1_Write_Text("Digite a palavra e pressione Enter");
  UART1_Write(13);
  UART1_Write(10);
  UART1_Read_Text(texto, enter, 30);
  UART1_Write_Text("TETA");
  UART1_Write_Text(texto);
  

  while (1) {                     // Endless loop
   if (UART1_Data_Ready()) {      // If data is received,
     uart_rd = UART1_Read();      //   read the received data,
     UART1_Write(uart_rd);        //   and send data via UART
    }
  }
}

