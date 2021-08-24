ArrayList<Bar> bars = new ArrayList<Bar>();

void setup() {
    size(1000, 1000);
    background(210);
}

void draw() {
    if (frameCount % 100 == 0) {
        bars.add(new Bar(true, random(0., 1000.), random(0., 20.), random(0, 255), random(0, 255), random(0, 255), random(5., )))
    }
    
}


class Bar {

    boolean vertical = true;
    float pos = 0.;
    float size = 10.;
    float r = 0., g = 0., b = 0.;
    float speed = 0.

    public bar(boolean vertical, float pos, float size, float r, float g, float b, float speed) {
        this.vertical = vertical;
        this.pos = pos;
        this.size = size;
        this.r = r;
        this.g = g;
        this.b = b;
        this.speed = speed;
    }

    void move() {
        this.pos += this.speed;
    }


}