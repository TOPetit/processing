float n = 200.;
Boolean colorCircle = true;

void setup() {
    size(200, 200);
    noStroke();
    background(255);
    noFill();
    noLoop();
}

void draw() {
    for (int k = 0; k < 500000; k++) {
        if (colorCircle) {
            fill(153, 0, 0);
            colorCircle = false;
        }
        else{
            fill(0);
            colorCircle = true;
        }
        
        float a = random(n);
        float b = random(n);
        float radius = n / 50;
        if (lettre_o(a, b)) {
            circle(a, b, radius);
        }
    }
    print("Done");
    save("o.png");
}

Boolean lettre_o(float x, float y) {
    return inEllipse(x, y, n / 2, n / 2, n / 8, n / 5) || !inEllipse(x, y, n / 2, n / 2, n / 5, n / 4);
}

Boolean inEllipse(float x, float y, float center_x, float center_y, float radius_x, float radius_y) {
    return sq(x - center_x) / sq(radius_x) + sq(y - center_y) / sq(radius_y) < 1;
}

Boolean inCircle(float x, float y, float center_x, float center_y, float radius) {
    return inEllipse(x, y, center_x, center_y, radius, radius);
} 

Boolean inRectangle(float x, float y, float x_tl, float y_tl, float width, float height) {
    return x - x_tl > 0 && x - x_tl < width && y - y_tl > 0 && y - y_tl < height;
}

Boolean inSquare(float x, float y, float x_tl, float y_tl, float width) {
    return inRectangle(x, y, center_x, center_y, width);
}