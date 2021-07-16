void setup() {
    size(500, 500, P3D);
    noFill();
}

void draw() {
    
    float a = frameCount / 25.;
    
    rotateX(PI / 4);
    
    background(0);
    translate(width / 2, height / 2, -150);
    
    strokeWeight(5);
    
    translate(0, 0, 100 * sin(a));
    stroke(255, 0, 0);
    ellipse(0, 0, 240, 240);
    translate(0, 0, -100 * sin(a));
    
    translate(0, 0, 120 * sin(a));
    stroke(0, 255, 0);
    ellipse(0, 0 , 200, 200);
    translate(0, 0, -120 * sin(a));
    
    translate(0, 0, 140 * sin(a));
    stroke(0, 0, 255);
    ellipse(0, 0, 160, 160);
    translate(0, 0, -140 * sin(a));
    
    translate(0, 0, 160 * sin(a));
    stroke(255, 0, 0);
    ellipse(0, 0, 120, 120);
    translate(0, 0, -160 * sin(a));
    
    translate(0, 0, 180 * sin(a));
    stroke(0, 255, 0);
    ellipse(0, 0 , 80, 80);
    translate(0, 0, -180 * sin(a));
    
    translate(0, 0, 200 * sin(a));
    stroke(0, 0, 255);
    ellipse(0, 0, 40, 40);
    translate(0, 0, -200 * sin(a));
}
