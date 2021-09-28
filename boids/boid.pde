public class Boid {
    
    private float x, y;
    private float vx, vy;
    private float norm;
    
    public Boid(float x, float y, float vx, float vy) {
        this.x = x;
        this.y = y;
        this.vx = vx;
        this.vy = vy;
    }
    
    private void updateNorm() {
        this.norm = sqrt(sq(vx) + sq(vy));
    }
    
    public void draw(float scale) {
        fill(173, 213, 230);
        updateNorm();
        float norm_vx = vx / this.norm;
        float norm_vy = vy / this.norm;
        triangle(this.x + scale * norm_vx, this.y + scale * norm_vy, this.x + scale / 4 * ( -norm_vy), this.y + scale / 4 * norm_vx, this.x + scale / 4 * norm_vy, this.y + scale / 4 * ( -norm_vx));
        fill(0);
    }
    
    public void nextPos() {
        this.x += this.vx;
        this.y += this.vy;
        this.x = (this.x < 0) ? this.x + width : this.x;
        this.x = (this.x > width) ? this.x - width : this.x;
        this.y = (this.y < 0) ? this.y + height : this.y;
        this.y = (this.y > height) ? this.y - height : this.y;
    }
    
}
