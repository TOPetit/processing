

float length;

void setup() {
    size(1080, 1080, P3D);
}

void draw() {
    
    background(150);
    noFill();
    strokeWeight(3);
    
    translate(width / 2, height / 2, 0);
    
    rotateY(PI / 4);
    rotateX( -3 * PI / 4);
    
    
    for (int i = 0; i < 20; i++) {
        length = 300 - 10 * i * 1.5;
        translate( -length / 2, -length / 2, 10 * i);
        rect(30,20, length, length, 10, 10, 10, 10);
        translate(length / 2, length / 2, -10 * i);
        translate( -length / 2, -length / 2, -10 * i);
        rect(30,20, length, length, 10, 10, 10, 10);
        translate(length / 2, length / 2, 10 * i);
    }
    
    
}
