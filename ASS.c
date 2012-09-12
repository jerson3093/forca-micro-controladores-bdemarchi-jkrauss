char uart_rd;
char enter[2];
char teste[2];
char palavra[] = "DEMONIO";
char letras1[] = "EAQODI";
char letras2[] = "ONZMYK";

void main() {

  enter[0]=13;
  enter[1]=0;
  
  UART1_Init(9600);              // Initialize UART module at 9600 bps
  Delay_ms(100);                 // Wait for UART module to stabilize

  UART1_Write_Text("JOGO DA FORCA - 1.0");
  UART1_Write_Text(enter);
  UART1_Write_Text(enter);
  UART1_Write_Text("Letras:");
  UART1_Write_Text(enter);
  UART1_Write_Text(letras1);
  UART1_Write_Text(enter);
  UART1_Write_Text(letras2);
  UART1_Write_Text(enter);
  UART1_Write_Text("----------------------------------");
  UART1_Write_Text(enter);
  UART1_Write_Text("_ _ _ _ _ _ _");
  UART1_Write_Text(enter);
  UART1_Write_Text("----------------------------------");
  UART1_Write_Text(enter);

  while (1) {                     // Endless loop
     UART1_Read_Text(teste, enter, 2);
       UART1_Write_Text(teste);
     if(strstr(palavra, teste) == 0) {
        UART1_Write_Text(" errado");
     } else {
        UART1_Write_Text(" correto");
     }
             UART1_Write_Text(enter);
  }
}
