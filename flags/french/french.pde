void setup() {
    size(256, 256);
    smooth(1);
    
}

void draw() {
    
    
    background(22, 22, 29);    
    translate(width / 2, height / 2);
    noStroke();
    
    int size = 25;
    int ratio = 6;
    int period = 100;
    //int shift = -size / 2 + (frameCount % period < period / 2 ? frameCount % (period / 2) : (period / 2) - (frameCount % (period / 2)));
    int shift = 1 * size;
    float spacing = 1.2 * size;
    
    
    // BLUE
    fill(0, 84, 164);
    beginShape(QUAD);
    vertex( -1.5 * size + shift - spacing, ratio * ( -size / 2));
    vertex( -0.5 * size + shift - spacing, ratio * ( -size / 2));
    vertex( -0.5 * size - shift - spacing, ratio * size / 2);
    vertex( -1.5 * size - shift - spacing, ratio * size / 2);
    endShape();
    
    // WHITE
    fill(255);
    beginShape();
    vertex( -0.5 * size + shift, ratio * ( -size / 2));
    vertex(0.5 * size + shift, ratio * ( -size / 2));
    vertex(0.5 * size - shift, ratio * size / 2);
    vertex( -0.5 * size - shift, ratio * size / 2);
    endShape();
    
    // RED
    fill(239, 65, 53);
    beginShape();
    vertex(0.5 * size + shift + spacing, ratio * ( -size / 2));
    vertex(1.5 * size + shift + spacing, ratio * ( -size / 2));
    vertex(1.5 * size - shift + spacing, ratio * size / 2);
    vertex(0.5 * size - shift + spacing, ratio * size / 2);
    endShape();
    
    save("../../output/flags/french.png");
    
    exit();
}
