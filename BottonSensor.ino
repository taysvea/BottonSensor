
int SENSOR_PIN = A0;
//Gbutton = 2;

int button = 0;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
}

void loop() {
  button = 0;
  if ( digitalRead (2) == LOW) {
    button =1;
  }
  else if ( digitalRead (3) == LOW) {
    button=2; 
  }
  else if ( digitalRead (4) == LOW) {
    button=3;
  }
  else if ( digitalRead (5) == LOW) {
    button=4; 
  }



  Serial.print(button);
  Serial.println();
  delay(5);
}


