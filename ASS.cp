#line 1 "C:/Users/tecbmbkd/Desktop/facool/micro/forca/ASS.c"
char uart_rd;
char enter[2];
char entrada[2];
char palavra[] = "DEMONIO";
char escondida[] = "_______";
char letras1[] = "EAQODI";
char letras2[] = "ONZMYK";
int tentativas = 5;
int i;
int encontrou;

void imprimeEstadoAtual() {

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
 UART1_Write_Text(escondida);
 UART1_Write_Text(" - Tentativas restantes: ");
 UART1_Write_Text(tentativas);
 UART1_Write_Text(enter);
 UART1_Write_Text("----------------------------------");
 UART1_Write_Text(enter);
}

void main() {

 enter[0]=13;
 enter[1]=0;

 UART1_Init(9600);
 Delay_ms(100);

 while (tentativas > 0) {
 encontrou = 0;
 imprimeEstadoAtual();

 UART1_Read_Text(entrada, enter, 2);

 for(i=0; i < strlen(palavra); i++) {
 if(palavra[i] == entrada[0]) {
 escondida[i] = entrada[0];
 encontrou = 1;
 }
 }

 if(encontrou == 0) {
 tentativas--;
 }

 }
}
