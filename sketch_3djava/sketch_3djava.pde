void setup() {
    size(500, 500, P3D);
    translate(500 / 2, 500 / 2);
}

void draw() {
    pushMatrix();
    box(250);
    rotateY(frameCount / 100.);
    popMatrix();
}