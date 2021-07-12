float n = 500.;
Boolean colorCircle = true;

void setup() {
    size(500, 500);
    noStroke();
    background(255);
    noFill();
}

void draw() {
    for (int k = 0; k < 50; k++) {
        
        float x1 = random(n);
        float y1 = random(n);
        float radius = random(n / 20);
        float angle = random(2 * PI);
        
        if (colorCircle) {
            stroke(255 - 255 * sqrt(sq(x1 - n / 2) + sq(y1 - n / 2)) / sqrt(sq(n / 2) + sq(n / 2)), 0, 0);
            colorCircle = false;
        }
        else{
            stroke(255 * sqrt(sq(x1 - n / 2) + sq(y1 - n / 2)) / sqrt(sq(n / 2) + sq(n / 2)));
            colorCircle = true;
        }
        
        
        drawString(x1, y1, x1 + radius * cos(angle), y1 + radius * sin(angle));
    }
    print("Done");
    save("thing.png");
}

void drawString(float x1, float y1, float x2, float y2) {
    
    float vect_length = sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
    
    float r = 0.5 * vect_length;
    
    float a = x1 + 0.25 * (x2 - x1);
    float b = y1 + 0.25 * (y2 - y1);
    
    float c = x1 + 0.75 * (x2 - x1);
    float d = y1 + 0.75 * (y2 - y1);
    
    float alpha = acos((x2 - x1) / vect_length);
    
    arc(a, b, r, r, alpha, alpha + PI);
    arc(c, d, r, r, alpha + PI, alpha + 2 * PI);
}
