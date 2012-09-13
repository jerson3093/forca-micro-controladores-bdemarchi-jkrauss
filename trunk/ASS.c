char enter[2];
char entrada[2];
char palavra[] = "PARALELEPIPEDO";
char escondida[] = "______________";
char cabeca[] = " V";
char tronco[] = "/|\\";
char barriga[] = " |";
char perna[] = "/ \\";
int tentativas = 4;

char tentativasChar[2];
int i;
int encontrou;

void imprimeEstadoAtual() {
  UART1_Write(12);

  sprintf(tentativasChar,"%d",tentativas);
  
  UART1_Write_Text("JOGO DA FORCA - 1.0");
  UART1_Write_Text(enter);
  UART1_Write_Text(enter);
  UART1_Write_Text(cabeca);
  UART1_Write_Text(enter);
  UART1_Write_Text(tronco);
  UART1_Write_Text(enter);
  UART1_Write_Text(barriga);
  UART1_Write_Text(enter);
  UART1_Write_Text(perna);
  UART1_Write_Text(enter);
  UART1_Write_Text(enter);
  UART1_Write_Text("----------------------------------");
  UART1_Write_Text(enter);
  UART1_Write_Text(escondida);
  UART1_Write_Text(" - Tentativas restantes: ");
  UART1_Write_Text(tentativasChar);
  UART1_Write_Text(enter);
  UART1_Write_Text("----------------------------------");
  UART1_Write_Text(enter);
}

void main() {

  enter[0]=13;
  enter[1]=0;
  
  UART1_Init(9600);              // Initialize UART module at 9600 bps
  Delay_ms(100);                 // Wait for UART module to stabilize
 
  UART1_Write_Text("Digite a palavra: ");
  UART1_Write_Text(enter);
  UART1_Read_Text(palavra, enter, 20);
  UART1_Write_Text(enter);
  
   for(i=0; i < strlen(palavra); i++) {
    escondida[i] = 95;
   }
   escondida[strlen(palavra)]=0;
  
  while (1) {
    encontrou = 0;
    imprimeEstadoAtual();
         
    UART1_Read_Text(entrada, enter, 2);
        
        for(i=0; i < strlen(palavra); i++) {                
                if(palavra[i] == entrada[0]) {
                        escondida[i] = entrada[0];
                        encontrou = 1;                        
                }
        }
        
        if(!encontrou) {
                tentativas--;
                if(tentativas == 3){
                   strcpy(perna," ");
                }
                if(tentativas == 2){
                   strcpy(barriga," ");
                }
                if(tentativas == 1){
                   strcpy(tronco," ");
                }
                if(tentativas == 0){
                   strcpy(cabeca," ");
                }
        }
        
        if(!tentativas) {
                imprimeEstadoAtual();
                UART1_Write_Text("GAME OVER");
                break;
        } else if(strstr(escondida,"_") == 0) {
                imprimeEstadoAtual();
                UART1_Write_Text("VOCE VENCEU! A PALAVRA ERA ");
                UART1_Write_Text(palavra);
                break;
        }
  }
}
