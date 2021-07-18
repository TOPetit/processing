public class Star {
    
    private float x, y; // Position
    private float x_init, y_init; // Initial position
    private int r, g, b; // RGB Color
    private int radius; // Radius
    private float speed; // Moving speed
    
    public Star(float x, float y, int r, int g, int b, int radius, float speed) {
        this.x = x;
        this.y = y;
        this.x_init = x;
        this.y_init = y;
        this.r = r;
        this.g = g;
        this.b = b;
        this.radius = radius;
        this.speed = speed;
    }
    
    public void moveToward(float x_dest, float y_dest) {
        float x_dir = x_dest - this.x;
        float y_dir = y_dest - this.y;
        this.x += this.speed * x_dir;
        this.y += this.speed * y_dir;
    }
    
    public void draw() {
        circle(this.x, this.y, this.radius);
    }
    
    public float getXInit() {
        return this.x_init;
    }
    
    public float getYInit() {
        return this.y_init;
    }
    
    public float getX() {
        return this.x;
    }
    
    public float getY() {
        return this.y;
    }
    
}