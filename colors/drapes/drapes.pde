void setup() {
    size(500, 500, P3D);
    background(0);
    noFill();
}

float x,y;

void draw() {
    
    //delay(200);
    background(0);
    translate(width / 2, width / 2, 0);
    pushMatrix();    
    //rotateY(frameCount / 100.);
    //rotateX(0.75 * PI / 2);
    
    float nbLines = 50.;
    float border = 0.;
    float step = (width - 2 * border) / nbLines; 
    
    float a = -border + width / 2;
    
    x = mouseX - width / 2;
    y = mouseY - width / 2;
    
    float amp = sin(2 * PI * (frameCount % 101) / 100.);
    //System.out.printf(amp + "\n");
    
    stroke(255, 0, 0);
    fill(255, 0, 0);
    //circle(x, y, 10);
    translate(x, y, a);
    sphere(5.);
    translate( -x, -y, -a);
    
    
    stroke(0, 0, 255);
    noFill();
    for (int i = 0; i <= nbLines * step; i += step) {
        bezier( -a + i, -a, 0., -a + i, y,(2 * a - abs( -a + i - x)), -a + i, a, 0., -a + i, a, 0.);
        bezier( -a, -a + i, 0., x, -a + i,(2 * a - abs( -a + i - y)), a, -a + i, 0., a, -a + i, 0.);
    }
    
    popMatrix();
    
}

