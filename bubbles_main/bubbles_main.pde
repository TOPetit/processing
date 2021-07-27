Field field = new Field(500, 500);

void setup() {
    size(500, 500);
}

void draw() {
    background(200);
    translate(width / 2, height / 2);
    field.updateBubblesSpeed();
    field.updateBubblesPos();
    field.draw();
}

void mousePressed() {
    field.addBubble(new Bubble(random(30., 50.), mouseX - width / 2, mouseY - height / 2, random( -10, 10), random( -10, 10)));
}