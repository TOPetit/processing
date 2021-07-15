
int nbWorms = 25;
float n = 1000.;
Boolean colorCircle = true;
Worm[][] worms = new Worm[nbWorms][nbWorms];

void setup() {
    size(1000, 1000);
    background(255);
    noFill();
    noStroke();
    for (int i = 0; i < nbWorms; i++) {
        for (int j = 0; j < nbWorms; j++) {
            worms[i][j] = new Worm(n / (nbWorms * 2) + (n / nbWorms) * i, n / (nbWorms * 2) + (n / nbWorms) * j, 0);
        }
    }
}

void draw() {
    
    for (int k = 0; k < 10; k++) {
        for (int i = 0; i < nbWorms; i++) {
            for (int j = 0; j < nbWorms; j++) {
                if (worms[i][j].isArrived()) {
                    worms[i][j].restart();
                    print("Arrived.\n");
                }
                else{
                    float x = worms[i][j].getX();
                    float y = worms[i][j].getY();
                    fill(worms[i][j].getCol());
                    circle(x, y, 1);
                    worms[i][j].move();
                }
            }
        }
    }
}

class Worm {
    
    float x,y;
    float x_start, y_start;
    int col;
    
    public Worm(float x_start, float y_start, int col) {
        this.x_start = x_start;
        this.y_start = y_start;
        this.col = col;
    }
    
    void restart() {
        this.x = x_start;
        this.y = y_start;
        
        if (this.col == 0) {
            this.col = 255;
        }
        else {
            this.col = 0;
        }
        
    }
    
    void setPos(float x, float y) {
        this.x = x;
        this.y = y;
    }
    
    float getX() {
        return this.x;
    }
    
    float getY() {
        return this.y;
    }
    
    int getCol() {
        return this.col;
    }
    
    Boolean isArrived() {
        return !inCircle(this.x, this.y, this.x_start, this.y_start, 50);
    }
    
    void move() {
        float rand = random(0., 1.);
        if (rand < 0.25) {
            this.setPos(this.x + 1, this.y);
        }
        else if (rand < 0.5) {
            this.setPos(this.x - 1, this.y);
        }
        else if (rand < 0.75) {
            this.setPos(this.x, this.y + 1);
        }
        else {
            this.setPos(this.x, this.y - 1);
        }
        
        
        
    }
    
    float sign(float x) {
        if (x > 0) {
            return 1.;
        }
        else if (x < 0) {
            return - 1.;
        }
        else{
            return 0.;
        }
    }
    
}

Boolean inEllipse(float x, float y, float center_x, float center_y, float radius_x, float radius_y) {
    return sq(x - center_x) / sq(radius_x) + sq(y - center_y) / sq(radius_y) < 1;
}

Boolean inCircle(float x, float y, float center_x, float center_y, float radius) {
    return inEllipse(x, y, center_x, center_y, radius, radius);
} 

Boolean inRectangle(float x, float y, float x_tl, float y_tl, float width, float height) {
    return x - x_tl > 0 && x - x_tl < width && y - y_tl > 0 && y - y_tl < height;
}

Boolean inSquare(float x, float y, float x_tl, float y_tl, float width) {
    return inRectangle(x, y, x_tl, y_tl, width, width);
}
