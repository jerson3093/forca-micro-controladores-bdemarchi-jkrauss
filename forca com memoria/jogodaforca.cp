#line 1 "C:/Documents and Settings/bdemarchi/Desktop/forca miguel/jogodaforca.c"

sbit Soft_I2C_Scl at RC3_bit;
sbit Soft_I2C_Sda at RC4_bit;
sbit Soft_I2C_Scl_Direction at TRISC3_bit;
sbit Soft_I2C_Sda_Direction at TRISC4_bit;


char enter[2];
char entrada[2];
char palavra[] = "PARALELEPIPEDO";
char escondida[] = "______________";
char cabeca[] = " V";
char tronco[] = "/|\\";
char barriga[] = " |";
char perna[] = "/ \\";
int tentativas = 4;

int qtdPalavrasSalvas = 0;
int memoria = 0;

int indiceLeituraMemoria = 0;

char tentativasChar[2];
int i;
int encontrou;

int executar = 1;

void write_eeprom(unsigned char address, unsigned char dado)
{
 Soft_I2C_Start();
 Soft_I2C_Write(0xA0);
 Soft_I2C_Write(address);
 Soft_I2C_Write(dado);
 Soft_I2C_Stop();
 delay_ms(16);
}

unsigned char read_eeprom(unsigned char address)
{
 unsigned char dat;

 Soft_I2C_Start();
 Soft_I2C_Write(0xA0);
 Soft_I2C_Write(address);
 Soft_I2C_Start();
 Soft_I2C_Write(0xA1);
 dat = Soft_I2C_read(0);
 Soft_I2C_Stop();
 return dat;
}

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

void lerPalavraNova(){
 UART1_Write_Text("Digite a palavra: ");
 UART1_Write_Text(enter);
 UART1_Read_Text(palavra, enter, 20);
 UART1_Write_Text(enter);

 memoria = qtdPalavrasSalvas*20;

 for(i=0; i < strlen(palavra); i++, memoria++) {
 escondida[i] = 95;
 write_eeprom(memoria,palavra[i]);
 }

 escondida[strlen(palavra)]=0;


 for(; i<20; i++, memoria++) {
 write_eeprom(memoria,' ');
 }

 qtdPalavrasSalvas++;
}

void lerPalavraMemoria() {
 UART1_Write_Text("Digite o índice da palavra: ");
 UART1_Write_Text(enter);

 while (UART1_Data_Ready() == 0) {}
 indiceLeituraMemoria = UART1_Read()-48;

 memoria = indiceLeituraMemoria*20;

 for(i=0;i<20;i++,memoria++) {
 palavra[i] = read_eeprom(memoria);

 if(palavra[i] == ' ') {
 palavra[i]=0;
 break;
 }
 }

 if(i==20) {
 palavra[19] = 0;
 }

 for(i=0; i < strlen(palavra); i++, memoria++) {
 escondida[i] = 95;
 }

 escondida[strlen(palavra)]=0;
}

void jogar() {
 tentativas = 4;

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

void zerar(){
 qtdPalavrasSalvas = 0;
}

void main() {

 enter[0]=13;
 enter[1]=0;

 UART1_Init(9600);
 Delay_ms(100);


 Soft_I2C_Init();

 while(executar) {
 UART1_Write(12);
 UART1_Write_Text("Menu "); UART1_Write_Text(enter);
 UART1_Write_Text("1- Zerar memoria "); UART1_Write_Text(enter);
 UART1_Write_Text("2- Jogar sem uso de mem. "); UART1_Write_Text(enter);
 UART1_Write_Text("3- Jogar com uso de mem. "); UART1_Write_Text(enter);
 UART1_Write_Text("4- Sair "); UART1_Write_Text(enter);
 UART1_Write_Text(enter);

 while (UART1_Data_Ready() == 0) {}
 i = UART1_Read();


 switch(i) {
 case 49: zerar(); break;
 case 50: lerPalavraNova(); jogar(); break;
 case 51: lerPalavraMemoria(); jogar(); break;
 case 52: executar = 0; UART1_Write(12); UART1_Write_Text("FIM"); break;
 }

 }
}
