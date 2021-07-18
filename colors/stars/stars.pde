float n = 1000.;
Star[] stars = new Star[1000];
int nbStar = stars.length;

void setup() {
    size(1000, 1000);
    for (int i = 0; i < nbStar; i++) {
        stars[i] = new Star(random(0, n), random(0 , n), 255, 255, 255, int(random(1, 15)), random(0.01, 0.05));
    }
}

void draw() {
    
    background(0);
    
    
    stroke(255);
    noFill();
    circle(mouseX, mouseY, 100);
    circle(mouseX, mouseY, 200);
    fill(255);
    
    if (mousePressed) {
        for (int i = 0; i < nbStar; i++) {
            if (inCircle(stars[i].getX(), stars[i].getY(), mouseX, mouseY, 200)) {
                stars[i].moveToward(mouseX, mouseY);
            }
            else {
                stars[i].moveToward(stars[i].getXInit(), stars[i].getYInit());
            }
        }
    }
    else {
        for (int i = 0; i < nbStar; i++) {
            stars[i].moveToward(stars[i].getXInit(), stars[i].getYInit());
        }
    }
    
    for (int i = 0; i < nbStar; i++) {
        //if (!inCircle(stars[i].getX(), stars[i].getY(), mouseX, mouseY, 100)) {
        stars[i].draw_noisy();
// }
}
}

Boolean inEllipse(float x, float y, float center_x, float center_y, float radius_x, float radius_y) {
return sq(x - center_x) / sq(radius_x) + sq(y - center_y) / sq(radius_y) < 1;
}

Boolean inCircle(float x, float y, float center_x, float center_y, float radius) {
return inEllipse(x, y, center_x, center_y, radius, radius);
}