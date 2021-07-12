
float n = 500.;
Boolean colorCircle = true;
Worm[] worms = new Worm[4];

void setup() {
    size(500, 500);
    background(255);
    noFill();
    noStroke();
    worms[0] = new Worm(n / 2 + 1, n / 2 + 1, true);
    worms[1] = new Worm(n / 2 + 1, n / 2 - 1, true);
    worms[2] = new Worm(n / 2 - 1, n / 2 + 1, true);
    worms[3] = new Worm(n / 2 - 1, n / 2 - 1, true);
}

void draw() {
    
    for (int j = 0; j < 5000;j++) {
        for (int i = 0; i < 4; i++) {
            if (worms[i].isArrived()) {
                worms[i].restart();
                print("Arrived.\n");
            }
            else{
                float x = worms[i].getX();
                float y = worms[i].getY();
                if (worms[i].getCol()) {
                    fill(0);
                }
                else {
                    fill(255);
                }
                circle(x, y, 1);
                worms[i].move();
            }
        }
    }
}

class Worm {
    
    float x,y;
    float x_start, y_start;
    Boolean col;
    
    public Worm(float x_start, float y_start, Boolean col) {
        this.x_start = x_start;
        this.y_start = y_start;
        this.col = col;
    }
    
    void restart() {
        this.x = x_start;
        this.y = y_start;
        this.col = !this.col;
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
    
    Boolean getCol() {
        return this.col;
    }
    
    Boolean isArrived() {
        return !inSquare(this.x, this.y, 0., 0., n);
    }
    
    void move() {
        
        float dir_x = this.x - n / 2;
        float dir_y = this.y - n / 2;
        
        if (random(0., 1.) < 0.5) {
            this.setPos(this.x + sign(dir_x), this.y);
        }
        else{
            this.setPos(this.x, this.y + sign(dir_y));
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
