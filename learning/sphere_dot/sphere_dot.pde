int nbDots = 1500;
Dot[] dots = new Dot[nbDots];

// Intermediate vars
float rho, phi, r; // angles and radius of spheric coord.


void setup() {
    size(500, 500, P3D);
    noStroke();
    for (int i = 0; i < nbDots; i++) {
        dots[i] = new Dot();
    }
}

void draw() {
    translate(width / 2, height / 2,0);
    rotateY(frameCount / 50.);
    rotateX(frameCount / 40.);
    background(200);
    for (int i = 0; i < nbDots; i++) {
        if (frameCount % 100 == 1) {
            rho = random(2 * PI);
            phi = random(PI);
            r = 150;
            dots[i].set(r * sin(phi) * cos(rho), r * sin(phi) * sin(rho), r * cos(phi), 255, 0, 0, 1);
        }
        dots[i].plot();
    }
    
}

class Dot {
    
    float x, y, z; // Coord
    int r, g, b; // Color
    float size; // Size when plotting
    
    void set(float x, float y, float z, int r, int g, int b, float size) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.r = r;
        this.g = g;
        this.b = b;
        this.size = size;
    }
    
    void plot() {
        translate(this.x, this.y, this.z);
        fill(this.r, this.g, this.b);
        sphere(size);
        translate( -this.x, -this.y, -this.z);
    }
}