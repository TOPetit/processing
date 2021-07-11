Boolean letter_o(float x, float y) {
    return inEllipse(x, y, n / 2, n / 2, n / 8, n / 5) || !inEllipse(x, y, n / 2, n / 2, n / 5, n / 4);
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
    return inRectangle(x, y, center_x, center_y, width);
}