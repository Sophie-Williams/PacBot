#include <IRremote.h>
#define FORWARD 16736925
#define RIGHT 16761405
#define LEFT 16720605
#define BACKWARD 16754775
#define OK 16712445

int RECV_PIN = 11;
int enA = 3;
int enB = 9;
int in1 = 5;
int in2 = 6;
int in3 = 7;
int in4 = 8;
IRrecv irrecv(RECV_PIN);
decode_results results;
long int decCode;
char btBuffer;
int ledPin = 13;
int analogPin = 0;
float analogVal = 0.0;

void setup()
{
    Serial.begin(9600);
    irrecv.enableIRIn();
    pinMode(enA, OUTPUT);
    pinMode(enB, OUTPUT);
    pinMode(in1, OUTPUT);
    pinMode(in2, OUTPUT);
    pinMode(in3, OUTPUT);
    pinMode(in4, OUTPUT);
    pinMode(ledPin, OUTPUT);
}

void goForward()
{
  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  digitalWrite(in3, LOW);
  digitalWrite(in4, HIGH);
  analogWrite(enA, 255);
  analogWrite(enB, 255);
}

void goRight()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  digitalWrite(in3, LOW);
  digitalWrite(in4, HIGH);
  analogWrite(enA, 255);
  analogWrite(enB, 255); 
}

void goLeft()
{
  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
  analogWrite(enA, 255);
  analogWrite(enB, 255); 
}

void goBackward()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);
  analogWrite(enA, 255);
  analogWrite(enB, 255); 
}

void goStop()
{
  digitalWrite(in1, LOW);
  digitalWrite(in2, LOW);
  digitalWrite(in3, LOW);
  digitalWrite(in4, LOW);
  analogWrite(enA, 0);
  analogWrite(enB, 0); 
}

void loop()
{ 
    if (irrecv.decode(&results))
    {
       if (results.value != -1) decCode = results.value;
       switch (decCode)
       {
           case FORWARD:
             goForward();
             break;
           case RIGHT:
             goRight();
             break;
           case LEFT:
             goLeft();
             break;
           case BACKWARD:
             goBackward();
             break;
           case OK:
             goStop();
             break;
           default:
             break;
       } 
       irrecv.resume();
    }
    if (Serial.available()) 
    {
      digitalWrite(ledPin, HIGH);
      btBuffer = Serial.read();
      switch(btBuffer)
      {
        case 'w':
          goForward();
          break;
        case 'a':
          goLeft();
          break;
        case 'd':
          goRight();
          break;
        case 's':
          goBackward();
          break;
        case 'b':
          goStop();
          break;
        default:
          break;       
      }
    }
    delay(100);
    digitalWrite(ledPin, LOW);
    analogVal = analogRead(analogPin);
    if (analogVal == 0.0) Serial.write("1");
    else Serial.write("0");
}
