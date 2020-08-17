#include <AFMotor.h>
//#include <Keyboard.h>
int arr[100][100];
AF_DCMotor motor1(4);
AF_DCMotor motor2(3);
AF_DCMotor motor3(2);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  motor1.setSpeed(200);
  motor2.setSpeed(200);
  motor3.setSpeed(200);

  
}
int i=1, j=1, k=0;
int i2=1, j2=1;
void loop() 
{
  if(Serial.available()>=0)
  {
    if(Serial.read()== 1)
    k=2;
  arr[i][j]=Serial.read();
  j++;
  if(j==100)
  {
    i++;
    j=1;
    }
  

  if(k==2)
  {
    if(arr[i2][j2]==11.1)
    {
      motor3.run(FORWARD);
      delay(300);
      if(arr[i2][j2+1]>=0)
      {
        motor1.run(FORWARD);
        delay(100*arr[i2][j2+1]);
      }
      if(arr[i2][j2+1]<0)
      {
        motor1.run(BACKWARD);
        delay(100*arr[i2][j2+1]);
      }
      if(arr[i2][j2+2]>=0)
      {
        motor2.run(FORWARD);
        delay(100*arr[i2][j2+2]);
      }
      if(arr[i2][j2+2]<0)
      {
        motor2.run(BACKWARD);
        delay(100*arr[i2][j2+2]);
      }
      j+=3;
    }
    
    else
    {
      if(arr[i2][j2]>=0)
      {
        motor1.run(FORWARD);
        delay(100*arr[i2][j2]);
      }
      if(arr[i2][j2]<0)
      {
        motor1.run(BACKWARD);
        delay(100*arr[i2][j2]);
      }
      if(arr[i2][j2+1]>=0)
      {
        motor2.run(FORWARD);
        delay(100*arr[i2][j2+1]);
      }
      if(arr[i2][j2+1]<0)
      {
        motor2.run(BACKWARD);
        delay(100*arr[i2][j2+1]);
      }
    
      j+=2;
      if(j>=100)
      {
        j=1;
        i++;
      }
    }
  }
  }
}
