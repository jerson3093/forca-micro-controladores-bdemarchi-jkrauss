#line 1 "C:/Documents and Settings/jrkrauss/Meus documentos/AQUI/ASS/ASS.c"
char uart_rd;
char texto[31];
char enter[2];

void main() {

 enter[0]=13;
 enter[1]=0;

 UART1_Init(9600);
 Delay_ms(100);

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


 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 }
}
