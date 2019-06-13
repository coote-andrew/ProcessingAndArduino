unsigned long tepTimer;


void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int sec = millis()/1000;
  int val;
  float data;
  val = analogRead(0);
  data = (float)val*(5/10.24);

  if(millis()-tepTimer >1000){
    tepTimer = millis();
    //Serial.print("Temperature: ");
    Serial.println(data);
    //Serial.print("C @ ");
    //Serial.println(sec);
  }
  
}
