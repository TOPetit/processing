class Point {
    
    float x, y, r, d;
    
    void set_Polar(float r, float d) {
        if (r < 0) {
            System.out.print("Error in Polar -> radius has to be positive.\nNothing has been initialized...\n");
        }
        else {
            this.r = r;
            this.d = d % (2 * PI);
            this.x = r * cos(d);
            this.y = r * sin(d);
        }
    }
    
    void set_Cartesian(float x, float y) {
        float r, d;
        r = sqrt(x * x + y * y);
        d = atan(y / x);
        if (r < 0) {
            System.out.print("Error in Polar -> radius has to be positive.\nNothing has been initialized...\n");
        }
        else if (d < 0 || d > 2 * PI) {
            System.out.print("Error in Polar -> angle has to be between 0 and 2*PI.\nNothing has been initialized...\n");
        }
        else {
            this.r = r;
            this.d = d;
            this.x = x;
            this.y = y;
        }
    }
    
    void print() {
        System.out.printf("Point :\n\tx = %.2f\n\ty = %.2f\n\tr = %.2f\n\td = %.2f\n", this.x, this.y, this.r, this.d);
    }
    
    void draw() {
        point(this.x, this.y);
    }
    
}

size(200, 200);
int n = 200;
translate(n / 2, n / 2);

noStroke();

Point a = new Point();

for (int j = 0; j < 2*n; j += 2) {
    for (float i = 0; i < 2 * PI; i += 2 * PI / 10000) {
        fill(150 + 100 * cos(10 * i + 0.05 * j), 100 + 100 * cos(10 * i + 0.10 * j), 100 + 100 * cos(10 * i + 0.15 * j), 255);
        a.set_Polar(j * ((1 + 0 * cos(55 * i)) * 0.01 + 0.5), i);
        //b.print();
        circle(a.x, a.y, 1);
    }
}
System.out.printf("Done\n");
