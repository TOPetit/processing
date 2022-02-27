class Field {
    
    float width, height; // field size
    ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
    int size = 0;
    
    public Field(float width, float height) {
        this.width = width;
        this.height = height;
    }
    
    public void addBubble(Bubble newBubble) {
        this.bubbles.add(newBubble);
        this.size += 1;
    }
    
    public void updateBubblesPos() {
        Bubble temp;
        for (int i = 0; i < this.size; i++) {
            temp = this.bubbles.get(i);
            temp.move();
        }
    }
    
    public void updateBubblesSpeed() {
        Bubble temp;
        for (int i = 0; i < this.size; i++) {
            temp = this.bubbles.get(i);
            if (abs(temp.getx()) > this.width / 2) {
                temp.setV( -temp.getVx(), temp.getVy());
            }
            if (abs(temp.gety()) > this.height / 2) {
                temp.setV(temp.getVx(), -temp.getVy());
            }
        }
    }
    
    public void draw() {
        Bubble temp;
        noFill();
        stroke(0);
        for (int i = 0; i < this.size; i++) {
            temp = this.bubbles.get(i);
            circle(temp.getx(), temp.gety(), temp.size);
        }
    }
}