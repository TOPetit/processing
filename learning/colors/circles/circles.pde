void setup() {
    size(500, 500, P3D);
    noFill();
}

void draw() {
    
    float a = frameCount / 25.;
    
    //rotateX(PI / 4);
    rotateY(PI / 2);
    
    background(0);
    translate(0., width / 2, width / 2);
    
    strokeWeight(4);
    
    rotateX(frameCount / 100.);
    
    for (int i = 0; i < 60; i++) {
        rotateX(frameCount / 1000.);
        translate(0, 0, 0.1 * i * sin(a));
        if (i % 3 == 0) {
            stroke(255, 0, 0);
        }
        else if (i % 3 == 1) {
            stroke(0, 255, 0);
        }
        else {
            stroke(0, 0, 255);
        }
        ellipse(0, 0, i, 10 * i);
        translate(0, 0, -0.1 * i * sin(a));
    }
}
