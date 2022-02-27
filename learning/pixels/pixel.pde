public class Pixel {

    private float x, y; // Position
    private float r, g, b; // Color
    private float size; // Size of square

    public Pixel(float x, float y, float r, float g, float b, float size) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.g = g;
        this.b = b;
        this.size = size;
    }

    public void drawNoise() {
        fill((this.r + 255*noise(this.x, this.y)), (this.g + 255*noise(this.x, this.y)), (this.b + 255*noise(this.x, this.y)));
        rect(this.x, this.y, this.size, this.size);
    }

    public void draw() {
        fill(this.r, this.g, this.b);
        rect(this.x, this.y, this.size, this.size);
    }

    public void setColor(float r, float g, float b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

}