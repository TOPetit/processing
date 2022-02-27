float n = 500.;

float v[][] = {{50., 50.} , {50., 100.} , {100., 100.} , {75., 75.}, {100., 50.} };
Polygon p = new Polygon(v);


void setup() {
    size(500, 500);
    background(255);
    noFill();
    p.plotV();
}

void draw() {
    for (int i = 0; i < 10000; i++) {
        float a = random(n);
        float b = random(n);
        float radius = 2.;
        if (p.contains(a, b)) {
            circle(a, b, radius);
        }
    }
}


class Polygon {
    
    int n;
    float[][] v;
    
    public Polygon(float[][] v) {
        this.v = v;
        this.n = v.length;
    }
    
    void plotV() {
        for (int i = 0; i < this.n; i++) {
            point(this.v[i][0], this.v[i][1]);
            System.out.printf(this.v[i][0] + " " + this.v[i][1] + "\n"); 
        }
    }
    
    Boolean contains(float x, float y) {
        Boolean c = false;
        int i, j;
        for (i = 0, j = this.n - 1; i < this.n; j = i++) {
            if (((this.v[i][1] > y) != (this.v[j][1] > y)) && (x < (this.v[j][0] - this.v[i][0]) * (y - this.v[i][1]) / (this.v[j][1] - this.v[i][1]) + this.v[i][0]))
                c = !c;
        }
        return c;
    }
    
}
