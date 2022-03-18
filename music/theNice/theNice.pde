int nbBars = 15;
Bar[] bars = new Bar[nbBars];

void setup() {
    size(1024, 1024);
    for (int i = 0; i < nbBars; i++) {
        bars[i] = new Bar(i * width / nbBars - width / 2 + 35, random(40, 60), random(30, 500), random(0, 255), 0, 0);
    }
}

void draw() {
    background(22, 22, 29);
    translate(width / 2, height / 2);
    noStroke();
    for (int i = 0; i < nbBars; i++) {
        bars[i].draw();
    }   
}

public class Bar {
    float x; // pos
    float y = 0.;
    float width;
    float length;
    float r, g, b; // color
    
    public Bar(float x,float width,float length,float r,float g,float b) {
        this.x = x;
        this.width = width;
        this.length = length;
        this.r = r;
        this.g = g;
        this.b = g;
    }
    
    public void draw() {
        fill(r, g, b);
        beginShape(QUAD);
        vertex(x - width / 2, y - length / 2);
        vertex(x + width / 2, y - length / 2);
        vertex(x + width / 2, y + length / 2);
        vertex(x - width / 2, y + length / 2);
        endShape();
    }
}
