class Bubble {
    
    private float size; // Size of the bubble
    private float x, y; // Pos of the bubble
    private float vx, vy; // Speed vector of the bubble
    
    public Bubble(float size, float x, float y, float vx, float vy) {
        this.size = size;
        this.x = x;
        this.y = y;
        this.vx = vx;
        this.vy = vy;
    }
    
    public void move() {
        this.x += this.vx;
        this.y += this.vy;
        //this.vx *= 0.95;
        //this.vy *= 0.95;
    }
    
    public void setV(float vx, float vy) {
        this.vx = vx;
        this.vy = vy;
    }
    
    public float getSize() {
        return this.size;
    }
    
    public float getx() {
        return this.x;
    }
    
    public float gety() {
        return this.y;
    }
    
    public float getVx() {
        return this.vx;
    }
    
    public float getVy() {
        return this.vy;
    }
    
}
