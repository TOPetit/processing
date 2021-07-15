int n = 500;
Grid grid = new Grid(100);


void setup() {
    size(500, 500);
    noStroke();
    fill(0);
}

void draw() {
    delay(1000);
    
}

class Grid {
    
    Cell[][] cells;
    int size;
    
    public Grid(int size) {
        Cell[][] cells = new Cell[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                cells[i][j] = new Cell(i, j);
            }
        }
        this.cells = cells;
        this.size = size;
    }
    
    void initRandom(float r) {
        for (int i = 0; i < this.size; i++) {
            for (int j = 0; j < this.size; j++) {
                
            } 
        }
    }
    
    void plot() {
        Boolean state;
        float cellSize = n / size;
        for (int i = 0; i < this.size; i++) {
            for (int j = 0; j < this.size; j++) {
                state = this.cells[i][j].getState();
                if (state) {
                    rect(i * cellSize, j * cellSize, cellSize, cellSize);
                }
            }
        }
    }
    
    void updateGrid() {
        for (int i = 0; i < this.size; i++) {
            for (int j = 0; j < this.size; j++) {
                this.updateCell(this.cells[i][j]);
            }
        }
        for (int i = 0; i < this.size; i++) {
            for (int j = 0; j < this.size; j++) {
                this.cells[i][j].next();
            }
        }
    }
    
    void updateCell(Cell cell) {
        int n = neighbours(cell);
        cell.setFuture_state((n == 3) || (cell.getState() && n == 2));
    }
    
    int neighbours(Cell cell) {
        
        int c = 0;
        
        int x = cell.getX();
        int y = cell.getY();
        
        for (int i = -1; i < 2; i++) {
            for (int j = -1; i < 2; j++) {
                if (!(i == 0 && j == 0)) {
                    if (cells[x + i][y + j].getState()) {
                        c += 1;
                    }
                }
            }
        }
        
        return c;
        
    }
}


class Cell {
    
    int x, y;
    Boolean state;
    Boolean future_state;
    
    public Cell(int x, int y) {
        this.x = x;
        this.y = y;
        this.state = true;
    }
    
    void next() {
        this.state = this.future_state;
    }
    
    void setState(Boolean state) {
        this.state = state;
    }
    
    void setFuture_state(Boolean future_state) {
        this.future_state = future_state;
    }
    
    Boolean getState() {
        return this.state;
    }
    
    Boolean getFuture_state() {
        return this.future_state;
    }
    
    int getX() {
        return this.x;
    }
    
    int getY() {
        return this.y;
    }
}


Boolean inRectangle(float x, float y, float x_tl, float y_tl, float width, float height) {
    return x - x_tl > 0 && x - x_tl < width && y - y_tl > 0 && y - y_tl < height;
}

Boolean inSquare(float x, float y, float x_tl, float y_tl, float width) {
    return inRectangle(x, y, x_tl, y_tl, width, width);
}
