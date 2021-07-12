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
        if (!letter_a(a, b)) {
            circle(a, b, radius);
        }
    }
    print("Done");
    save("a.png");
}

Boolean letter_a(float x, float y) {
    Boolean brut = inParallelogram(x, y, n / 2 - 0.2 * n, n / 2 + 0.2 * n, n / 2 - 0.05 * n, n / 2 - 0.1 * n, n / 2 - 0.15 * n, n / 2 + 0.2 * n)
        || inParallelogram(x, y, n / 2 + 0.2 * n, n / 2 + 0.2 * n, n / 2 + 0.05 * n, n / 2 - 0.1 * n, n / 2 + 0.15 * n, n / 2 + 0.2 * n)
        || inRectangle(x, y, n / 2 - 0.1 * n, n / 2 + 0.05 * n, 0.2 * n, 0.05 * n);
    
    Boolean notA = inParallelogram(x, y, n / 2 - 0.3 * n, n / 2 + 0.2 * n, n / 2 - 0.2 * n, n / 2 + 0.2 * n, n / 2 - 0.25 * n,n / 2 - 0.4 * n);
    
    
    
    return brut;
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
    return inRectangle(x, y, x_tl, y_tl, width, width);
}

Boolean inParallelogram(float x, float y, float x_bl, float y_bl, float x_tl, float y_tl, float x_br, float y_br) {
    
    float x_final = ((x - x_bl) * (y_tl - y_bl) + (y - y_bl) * (x_bl - x_tl)) / ((x_br - x_bl) * (y_tl - y_bl) - (y_br - y_bl) * (x_tl - x_bl));
    float y_final = ((x - x_bl) * (y_bl - y_br) + (y - y_bl) * (x_br - x_bl)) / ((x_br - x_bl) * (y_tl - y_bl) - (y_br - y_bl) * (x_tl - x_bl));
    
    return x_final > 0 && x_final < 1 && y_final > 0 && y_final < 1;
}
