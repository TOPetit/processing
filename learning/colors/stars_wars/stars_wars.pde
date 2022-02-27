float n = 1000.;
Star[] stars = new Star[1000];
int nbStar = stars.length;

void setup() {
    size(1000, 1000);
    frameRate(120);
    noStroke();
    translate(n / 2, n / 2);
    for (int i = 0; i < nbStar; i++) {
        float angle = random(2 * PI);
        stars[i] = new Star(n / 2 + 2 * n * cos(angle), n / 2 + 2 * n * sin(angle), int(random(255)), int(random(255)), int(random(255)), int(random(1, 15)), random(0.0004, 0.0008));
        stars[i].setX(n / 2);
        stars[i].setY(n / 2);
    }
}

void draw() {
    
    background(0);
    
    for (int i = 0; i < nbStar; i++) {
        stars[i].draw();
    }
    
    if (frameCount < 301) {
        save(String.format("images/im_%03d.png",(301 - frameCount)));
        save(String.format("images/im_%03d.png",(301 + frameCount)));
    }
    
    
    
    
    if (frameCount % 6000 == 0) {
        for (int i = 0; i < nbStar; i++) {
            stars[i].setX(n / 2);
            stars[i].setY(n / 2);
        }
    }
    if (frameCount % 600 == 300) {
        for (int i = 0; i < nbStar; i++) {
            stars[i].setXInit(n / 2);
            stars[i].setYInit(n / 2);
        }
    }
    
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
    
    
}

Boolean inEllipse(float x, float y, float center_x, float center_y, float radius_x, float radius_y) {
    return sq(x - center_x) / sq(radius_x) + sq(y - center_y) / sq(radius_y) < 1;
}

Boolean inCircle(float x, float y, float center_x, float center_y, float radius) {
    return inEllipse(x, y, center_x, center_y, radius, radius);
}