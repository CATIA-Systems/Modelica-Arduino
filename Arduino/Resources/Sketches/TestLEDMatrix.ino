// Pins connect as per define
// Fill in the pins you used on your own setup.

#define R1  9
#define R2  4
#define R3 A2
#define R4  6
#define R5 10
#define R6 A3
#define R7 11
#define R8 A5

#define C1  5
#define C2 12
#define C3 13
#define C4  8
#define C5 A4
#define C6  7
#define C7  3
#define C8  2

const int row[8] = {
    R1, R2, R3, R4, R5, R6, R7, R8
};

const int col[8] = {
    C1, C2, C3, C4, C5, C6, C7, C8
};

void setup() {

    for (int pin = 0; pin < 8; pin++) {
        pinMode(col[pin], OUTPUT);
        pinMode(row[pin], OUTPUT);
        digitalWrite(col[pin], HIGH);
    }

}

void loop() {

    for (int r = 0; r < 8; r++) {

        digitalWrite(row[r], HIGH);
        
        for (int c = 0; c < 8; c++) {
            digitalWrite(col[c], LOW);
            delay(200);
            digitalWrite(col[c], HIGH);
        }

        digitalWrite(row[r], LOW);
    }
}
