void setup() {
    size(500, 500, P3D);
    background(0);
}

void draw() {
    background(0);
    pushMatrix();
    translate(width / 2, height / 2, 0);
    rotateY(1.25 + float(frameCount) / 10);
    rotateX(sin(frameCount / 100.) - PI / 8);
    fill(255);
    stroke(0);
    box(100);
    popMatrix();
}