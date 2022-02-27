public class Star {
    
    private float x, y; // Position
    private float noise_x, noise_y; // Noise around the position
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
        //System.out.printf("x_dest = " + x_dest + " y_dest = " + y_dest + "\n");
        //System.out.printf("mouseX = " + mouseY + " mouseY = " + mouseY + "\n");
        float x_dir = x_dest - this.x;
        float y_dir = y_dest - this.y;
        this.x += this.speed * this.radius * x_dir;
        this.y += this.speed * this.radius * y_dir;
    }
    
    public void draw() {
        fill(r, g, b);
        circle(this.x, this.y, this.radius);
    }
    
    public void draw_noisy() {
        applyNoise();
        fill(r, g, b);
        circle(this.x + this.noise_x, this.y + this.noise_y, this.radius);
    }
    
    public float getXInit() {
        return this.x_init;
    }
    
    public float getYInit() {
        return this.y_init;
    }
    
    public void setXInit(float x) {
        this.x_init = x;
    }
    
    public void setYInit(float y) {
        this.y_init = y;
    }
    
    public float getX() {
        applyNoise();
        return this.x + this.noise_x;
    }
    
    public float getY() {
        applyNoise();
        return this.y + this.noise_y;
    }
    
    public void setX(float x) {
        this.x = x;
    }
    
    public void setY(float y) {
        this.y = y;
    }
    
    private void applyNoise() {
        if (!mousePressed) {
            this.noise_x = noise((this.x + frameCount) / 100.);
            this.noise_y = noise((this.y + frameCount) / 100.);
        }
        else {
            this.noise_x = 0;
            this.noise_y = 0;
        }
    }
}