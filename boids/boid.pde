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
    
    private updateNorm() {
        this.norm = sqrt(sq(vx) + sq(vy));
    }
    
    public draw(float scale) {
        fill(255, 0, 0);
        updateNorm();
        norm_vx = vx / this.norm;
        norm_vy = vy / this.norm;
        triangle(this.x + scale * norm_vx, this.y + scale * norm_vy, this.x + scale / 4 * ( -norm_vy), this.y + scale / 2 * norm_vx, this.x + scale / 4 * norm_vy, this.y + scale / 2 * ( -norm_vx));
        fill(0);
    }
    
    public nextPos() {
        this.x += this.vx;
        this.y += this.vy;
    }
    
}
