int redx = 2;
int greenx = 3;
int bluex = 4;
int redy = 5;
int greeny = 6;
int bluey = 7;

int joystickx = 0;
int joysticky = 0;
int varx = 0;
int vary = 2;

void setup() {
  Serial.begin(9600);
  pinMode(redx, OUTPUT);
  pinMode(greenx, OUTPUT);
  pinMode(bluex, OUTPUT);
  pinMode(redy, OUTPUT);
  pinMode(greeny, OUTPUT);
  pinMode(bluey, OUTPUT);
  //pinMode(varx, INPUT);
  //pinMode(vary, INPUT);
}

void loop() {

  //Serial.println(analogRead(varx));
  Serial.println(joystickx);
  //Serial.println(analogRead(vary));

  joystickx = analogRead(varx);
  joysticky = analogRead(vary);

  //joystick x
  if(joystickx < 100) //left red
  {
    digitalWrite(redx, HIGH);
    digitalWrite(greenx, LOW);
    digitalWrite(bluex, LOW);
  }
  else if(800 > joystickx && joystickx > 100) //middle green
  {
    digitalWrite(redx, LOW);
    digitalWrite(greenx, HIGH);
    digitalWrite(bluex, LOW);
  }
  else if(joystickx > 800) //right blue
  {
    digitalWrite(redx, LOW);
    digitalWrite(greenx, LOW);
    digitalWrite(bluex, HIGH);
  }

  //joystick y
  if(joysticky > 800) //up red
  {
    digitalWrite(redy, HIGH);
    digitalWrite(greeny, LOW);
    digitalWrite(bluey, LOW);
  }
  else if(800 > joysticky && joysticky > 100) //middle green
  {
    digitalWrite(redy, LOW);
    digitalWrite(greeny, HIGH);
    digitalWrite(bluey, LOW);
  }
  else if(joysticky < 100) //down blue
  {
    digitalWrite(redy, LOW);
    digitalWrite(greeny, LOW);
    digitalWrite(bluey, HIGH);
  }
}
