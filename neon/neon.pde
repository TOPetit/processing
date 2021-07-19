PShader blur;

void setup() {
    size(600,300,P3D);
    blur = loadShader("blur.glsl"); 
}

void draw() {
    background(0);  
    strokeWeight(1);
    noFill();
    for (int j = 0; j < 10; j++) {
        stroke(255 * noise(j / 1.0),255 - 255 * noise(j / 1.0),255);
        beginShape();
        float f1 = noise(j / 10.0) + 0.5;
        float f2 = noise(j / 7.0);  
        float f3 = noise(j / 1.3) + .5;
        float f4 = noise(j / 1.2,frameCount / 500.0);
        for (int i = 0; i < 610; i += 10) {
            vertex(i, height / 2 + (100 * f4) * sin(f1 * TWO_PI * i / 600 + 100 * f2 - frameCount / (100.0 * f3)));
        }
        endShape();
    }  
    filter(blur);
    
    //  if ( frameCount <= 500 ) {
    //  saveFrame( "f-####.png" );
//  }
}