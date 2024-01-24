 #define speedl 6
 #define speedr 3


  
  char reading ;

void setup() {
 DDRD = 0b11111100;
  Serial.begin(9600);
  }


void forward()
{
 PORTD = 0b11011000 ;
analogWrite(speedl ,150);
analogWrite(speedr ,100);
  }
  void backward()
{
 PORTD= 0b01101100;
  
  }
  void right()
{
  PORTD= 0b11000000;
  }
void left()
{
 PORTD= 0b00011000; 
  
  }
void stopp()
{
 PORTD= 0b00000000; 
  
  }
  
  
void loop() {
  if(Serial.available()>0){
    reading=Serial.read();
    switch(reading){
      case 'f' : forward();break;
      case 'b' : backward();break;
      case 'r' : right();break;
      case 'l' : left();break;
      case 's' : stopp();break;
      
      }
    } 
}
