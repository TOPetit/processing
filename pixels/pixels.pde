int n = 200;
int size = 800;
Pixel[][] pixels = new Pixel[n][n];

void setup() {
    size(800, 800);
    background(200);
    noStroke();
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            pixels[i][j] = new Pixel(i * size / n, j * size /n, 0, 0, 0, size/n);
        }
    }
}

void draw() {
    background(200);
    float r = random(255.);
    float g = random(255.);
    float b = random(255.);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            //pixels[i][j].setColor(r, g, b);
            pixels[i][j].drawNoise();
        }
    }
}
