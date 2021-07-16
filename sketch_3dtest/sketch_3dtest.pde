void setup() {
    size(700, 700, P3D);
    background(0);
}

Boolean toggleStroke = true;

void draw() {
    background(0);
    
    // Lights
    ambientLight(50, 50, 50);
    spotLight(255, 0, 0, mouseX, mouseY, 150, 0, 0, -1, PI / 8, 2);
    
    pushMatrix();
    translate(width / 2, height / 2, 0);
    rotateY(1.25 + float(frameCount) / 100);
    rotateX( -PI / 8);
    
    if (toggleStroke) {
        stroke(0);
    }
    else {
        noStroke();
    }
    
    fill(255);
    sphere(100);
    
    popMatrix();
}

void keyPressed() {
    if (key == 'a') {
        toggleStroke = !toggleStroke;
    }    
}