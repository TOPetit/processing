float n = 1000.;
Star[] stars = new Star[1000];
int nbStar = stars.length;

void setup() {
    size(1000, 1000);
    for (int i = 0; i < nbStar; i++) {
        stars[i] = new Star(random(n), random(n), 255, 255, 255, int(random(1, 15)), random(0.03, 0.2));
    }
}

void draw() {
    
    background(0);
    
    if (mousePressed) {
        for (int i = 0; i < nbStar; i++) {
            stars[i].moveToward(mouseX, mouseY);
        }
    }
    else {
        for (int i = 0; i < nbStar; i++) {
            stars[i].moveToward(stars[i].getXInit(), stars[i].getYInit());
        }
    }
    
    for (int i = 0; i < nbStar; i++) {
        stars[i].draw();
    }
}

