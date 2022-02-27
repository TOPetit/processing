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
    
    float nbLines = 150.;
    float border = 0.;
    float step = (width - 2 * border) / nbLines; 
    
    float a = -border + width / 2;
    
    float amp = (frameCount % 501) / 500.;
    //System.out.printf(amp + "\n");
    
    float r = 50;
    
    x = r * cos(amp * 2 * PI);
    y = r * sin(amp * 2 * PI);
    
    stroke(255, 0, 0);
    fill(255, 0, 0);
    //circle(x, y, 10);
    //circle(x, y, 25.);    
    
    stroke(255, 0, 0);
    noFill();
    for (int i = 0; i <= nbLines * step; i += step) {
        bezier( -a + i, -a, 0., -a + i, y, 1.5 * (2 * a - abs( -a + i - x)), -a + i, a, 0., -a + i, a, 0.);
        bezier( -a, -a + i, 0., x, -a + i, 1.5 * (2 * a - abs( -a + i - y)), a, -a + i, 0., a, -a + i, 0.);
    }
    
    
    
    popMatrix();
    
}

