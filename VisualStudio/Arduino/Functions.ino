/* Functions Test */

void setup() {

  pinMode(LED_BUILTIN, OUTPUT);

  
  Serial.println();
  Serial.println("Digital I/O");
  Serial.println();

  Serial.println("pinMode(0, INPUT)");
  pinMode(0, INPUT);

  Serial.print("digitalRead(0) = ");
  Serial.println(digitalRead(0));

  Serial.println("pinMode(0, INPUT)");
  pinMode(0, INPUT);

  Serial.println("digitalWrite(0, HIGH)");
  digitalWrite(0, HIGH);


  Serial.println();
  Serial.println("Analog I/O");
  Serial.println();

  Serial.println("analogReference(DEFAULT)");
  analogReference(DEFAULT);

  Serial.print("analogRead(A0)");
  Serial.println(analogRead(A0));

  Serial.println("analogWrite(9, 100)");
  analogWrite(9, 100);


  Serial.println();
  Serial.println("Math");
  Serial.println();

  Serial.print("min(0, 1) = ");
  Serial.println(min(0, 1));

  Serial.print("max(0, 1) = ");
  Serial.println(max(0, 1));

  Serial.print("abs(-2) = ");
  Serial.println(abs(-2));

  Serial.print("constrain(1, 10, 100) = ");
  Serial.println(constrain(1, 10, 100));

  Serial.print("map(11, 1, 50, 50, 1) = ");
  Serial.println(map(11, 1, 50, 50, 1));

  Serial.print("pow(2., 3.) = ");
  Serial.println(pow(2., 3.));

  Serial.print("sqrt(81.) = ");
  Serial.println(sqrt(81.));


  Serial.println();
  Serial.println("Trigonometry");
  Serial.println();

  Serial.print("sin(1.) = ");
  Serial.println(sin(1.));

  Serial.print("cos(1.) = ");
  Serial.println(cos(1.));
  
  Serial.print("tan(1.) = ");
  Serial.println(tan(1.));


  Serial.println();
  Serial.println("Characters");
  Serial.println();

  Serial.print("isAlphaNumeric('a') = ");
  Serial.println(isAlphaNumeric('a'));

  Serial.print("isAlpha('a') = ");
  Serial.println(isAlpha('a'));
  
  Serial.print("isAscii('a') = ");
  Serial.println(isAscii('a'));
  
  Serial.print("isWhitespace('a') = ");
  Serial.println(isWhitespace('a'));
  
  Serial.print("isControl('a') = ");
  Serial.println(isControl('a'));
  
  Serial.print("isDigit('a') = ");
  Serial.println(isDigit('a'));
  
  Serial.print("isGraph('a') = ");
  Serial.println(isGraph('a'));
  
  Serial.print("isLowerCase('a') = ");
  Serial.println(isLowerCase('a'));
 
  Serial.print("isPrintable('a') = ");
  Serial.println(isPrintable('a'));
    
  Serial.print("isPunct('a') = ");
  Serial.println(isPunct('a'));
    
  Serial.print("isSpace('a') = ");
  Serial.println(isSpace('a'));
    
  Serial.print("isUpperCase('a') = ");
  Serial.println(isUpperCase('a'));
   
  Serial.print("isHexadecimalDigit('a') = ");
  Serial.println(isHexadecimalDigit('a'));


  Serial.println();
  Serial.println("Random Numbers");
  Serial.println();

  Serial.println("randomSeed(1)");
  randomSeed(1);

  Serial.print("random(10, 20) = ");
  Serial.println(random(10, 20));


  Serial.println();
  Serial.println("Bits and Bytes");
  Serial.println();

  Serial.print("lowByte(1) = ");
  Serial.println(lowByte(1));
  
  Serial.print("highByte(1) = ");
  Serial.println(highByte(1));

  int x;
  
  Serial.print("bitRead(x, 1) = ");
  Serial.println(bitRead(x, 1));
  
  Serial.println("bitWrite(x, 1, 1)");
  bitWrite(x, 1, 1);

  Serial.println("bitSet(x, 1)");
  bitSet(x, 1);

  Serial.println("bitClear(x, 1)");
  bitClear(x, 1);
  
  Serial.print("bit(3) = ");
  Serial.println(bit(3));

  Serial.println();

}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}
