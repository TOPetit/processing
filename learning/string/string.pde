void drawString(float x1, float y1, float x2, float y2) {
    
    float vect_length = sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
    
    float r = 0.5 * vect_length;
    
    float a = x1 + 0.25 * (x2 - x1);
    float b = y1 + 0.25 * (y2 - y1);
    
    float c = x1 + 0.75 * (x2 - x1);
    float d = y1 + 0.75 * (y2 - y1);
    
    float alpha = acos((x2 - x1) / vect_length);
    
    arc(a, b, r, r, alpha, alpha + PI);
    arc(c, d, r, r, alpha + PI, alpha + 2 * PI);
}
