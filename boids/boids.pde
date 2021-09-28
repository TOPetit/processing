final int nb_entities = 10;
Boid[] boids = new Boid[nb_entities];


void setup() {
    size(1000, 1000);
    noStroke();
    for (int i = 0; i < nb_entities; i++) {
        boids[i] = new Boid(random(width), random(height), random( -10, 10), random( -10, 10));
    }
}

void draw() {
    background(255);
    for (int i = 0; i < nb_entities; i++) {
        boids[i].nextPos();
        boids[i].draw(100);
    }
}
