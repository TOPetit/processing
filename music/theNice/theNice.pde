int nbBars = 15;
Bar[] bars = new Bar[nbBars];

void setup() {
    size(1024, 1024);
    for (int i = 0; i < nbBars; i++) {
        bars[i] = new Bar(i * width / nbBars - width / 2 + 35, random(40, 60), random(30, 500), new Color(ColorType.PASTEL));
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
    Color c;
    
    public Bar(float x, float width, float length, Color c) {
        this.x = x;
        this.width = width;
        this.length = length;
        this.c = c;
    }
    
    public void draw() {
        fill(c.r, c.g, c.b);
        beginShape(QUAD);
        vertex(x - width / 2, y - length / 2);
        vertex(x + width / 2, y - length / 2);
        vertex(x + width / 2, y + length / 2);
        vertex(x - width / 2, y + length / 2);
        endShape();
    }
}

public enum ColorType {UNDEFINED, CUSTOM, RANDOM, VIBRANT, PASTEL, FROM_SOURCE}

public class Color {
    float r, g, b;
    ColorType type;
    Color source;
    
    public Color(float r, float g, float b) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.type = ColorType.CUSTOM;
    }
    
    public Color(ColorType type) {
        this.type = type;
        switch(type) {
            case CUSTOM:
                println("Error : tried to generate a color with an CUSTOM type.\nBlack it is.");
                this.r = 0;
                this.g = 0;
                this.b = 0;
                break;
            case RANDOM:
                this.r = random(0, 255);
                this.g = random(0, 255);
                this.b = random(0, 255);
                break;
            case PASTEL:
                this.r = random(0, 255);
                this.g = min(255, max(0, random(this.r - 30, this.r + 30)));
                this.b = min(255, max(0, random(this.r - 30, this.r + 30)));
                break;
            case FROM_SOURCE:
                println("Error, tried to generate a color from another one, but did not put the source color in argument.\nBlack it is.");
                this.r = 0;
                this.g = 0;
                this.b = 0;
                break;
            default:
            // error
            break;
            
        }
    }
    
    public Color(Color source) {
        this.source = source;
        this.type = ColorType.FROM_SOURCE;
        this.r = min(255, max(0, random(this.source.r - 30, this.source.r + 30)));
        this.g = min(255, max(0, random(this.source.g - 30, this.source.g + 30)));
        this.b = min(255, max(0, random(this.source.b - 30, this.source.b + 30)));
    }
}