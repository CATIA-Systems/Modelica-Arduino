#define ROW_1 9
#define ROW_2 4
#define ROW_3 A2
#define ROW_4 6
#define ROW_5 10
#define ROW_6 A3
#define ROW_7 11
#define ROW_8 A5

#define COL_1 5
#define COL_2 12
#define COL_3 13
#define COL_4 8
#define COL_5 A4
#define COL_6 7
#define COL_7 3
#define COL_8 2

const byte rows[] = {
    ROW_1, ROW_2, ROW_3, ROW_4, ROW_5, ROW_6, ROW_7, ROW_8
};

const byte odd[] = {
    B11111111,
    B00000000,
    B11111111,
    B00000000,
    B11111111,
    B00000000,
    B11111111,
    B00000000,
};

const byte even[] = {
    B00000000,
    B11111111,
    B00000000,
    B11111111,
    B00000000,
    B11111111,
    B00000000,
    B11111111
};

void setColumns(byte b) {
    digitalWrite(COL_1, (~b >> 7) & 0x01); // Get the 1st bit: 10000000
    digitalWrite(COL_2, (~b >> 6) & 0x01); // Get the 2nd bit: 01000000
    digitalWrite(COL_3, (~b >> 5) & 0x01); // Get the 3rd bit: 00100000
    digitalWrite(COL_4, (~b >> 4) & 0x01); // Get the 4th bit: 00010000
    digitalWrite(COL_5, (~b >> 3) & 0x01); // Get the 5th bit: 00001000
    digitalWrite(COL_6, (~b >> 2) & 0x01); // Get the 6th bit: 00000100
    digitalWrite(COL_7, (~b >> 1) & 0x01); // Get the 7th bit: 00000010
    digitalWrite(COL_8, (~b >> 0) & 0x01); // Get the 8th bit: 00000001
}

void  drawScreen(const byte buffer[]){
   
    for (byte i = 0; i < 8; i++) {
        setColumns(buffer[i]);
        digitalWrite(rows[i], HIGH);
        delay(10);
        digitalWrite(rows[i], LOW);
    }
}

void setup() {
    pinMode(ROW_1, OUTPUT);
    pinMode(ROW_2, OUTPUT);
    pinMode(ROW_3, OUTPUT);
    pinMode(ROW_4, OUTPUT);
    pinMode(ROW_5, OUTPUT);
    pinMode(ROW_6, OUTPUT);
    pinMode(ROW_7, OUTPUT);
    pinMode(ROW_8, OUTPUT);

    pinMode(COL_1, OUTPUT);
    pinMode(COL_2, OUTPUT);
    pinMode(COL_3, OUTPUT);
    pinMode(COL_4, OUTPUT);
    pinMode(COL_5, OUTPUT);
    pinMode(COL_6, OUTPUT);
    pinMode(COL_7, OUTPUT);
    pinMode(COL_8, OUTPUT);
}

void loop() {
   
   static int frameCount = 0;
   
    if(frameCount <  10) {
        drawScreen(odd);
    } else if (frameCount <  20) {
        drawScreen(even);
    } else {
        frameCount = 0;
    }

    frameCount++;
}
 