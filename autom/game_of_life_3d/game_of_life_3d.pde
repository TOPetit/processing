int n = 1000;
int div = 50;
Grid grid = new Grid(div);


void setup() {
    size(1000,1000,P3D);
    noStroke();
    grid.initRandom(0.3);
    
}

void draw() {
    background(200);
    //delay(1000);
    grid.plot();
    grid.update();
}

class Grid {
    
    Cell[][][] cells;
    int size;
    
    public Grid(int size) {
        Cell[][][] cells = new Cell[size][size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                for (int k = 0; k < size; k++) {
                    cells[i][j][k] = new Cell(i, j, k);
                }
            }
        }
        this.cells = cells;
        this.size = size;
    }
    
    void setBorder() {
        for (int i = 0; i < this.size; i++) {
            this.cells[0][i][0].setState(true);
            this.cells[size - 1][i][0].setState(true);
            this.cells[i][0][0].setState(true);
            this.cells[i][size - 1][0].setState(true);
            
            this.cells[0][i][size - 1].setState(true);
            this.cells[size - 1][i][size - 1].setState(true);
            this.cells[i][0][size - 1].setState(true);
            this.cells[i][size - 1][size - 1].setState(true);
            
            this.cells[0][0][i].setState(true);
            this.cells[0][size - 1][i].setState(true);
            this.cells[size - 1][0][i].setState(true);
            this.cells[size - 1][size - 1][i].setState(true);
        }
    }
    
    void initRandom(float r) {
        this.setBorder();
        for (int i = 1; i < this.size - 1; i++) {
            for (int j = 1; j < this.size - 1; j++) {
                for (int k = 1; k < size - 1; k++) {
                    this.cells[i][j][k].setState(random(1.) < r);
                }
            }
        }
    }
    
    void plot() {
        Boolean state;
        float cellWidth = width / this.size;
        float cellHeight = width / this.size;
        float cellDepth = width / this.size;
        for (int i = 0; i < this.size; i++) {
            for (int j = 0; j < this.size; j++) {
                for (int k = 0; k < this.size; k++) {
                    state = this.cells[i][j][k].getState();
                    if (state) {
                        fill(0);
                    }
                    else {
                        fill(200);
                    }
                    translate(i * cellWidth, j * cellHeight, k * cellDepth);
                    box(cellWidth);
                    translate( -i * cellWidth, -j * cellHeight, -k * cellDepth);
                }
            }
        }
    }
    
    void update() {
        this.setBorder();
        for (int i = 1; i < this.size - 1; i++) {
            for (int j = 1; j < this.size - 1; j++) {
                for (int k = 1; k < this.size - 1; k++) {
                    this.updateCell(this.cells[i][j][k]);
                }
            }
        }
        for (int i = 1; i < this.size - 1; i++) {
            for (int j = 1; j < this.size - 1; j++) {
                for (int k = 1; k < this.size - 1; k++) {
                    this.cells[i][j][k].next();
                }
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
        int z = cell.getZ();
        
        for (int i = -1; i < 2; i++) {
            for (int j = -1; j < 2; j++) {
                for (int k = -1; k < 2; k++) {
                    if (!(i == 0 && j == 0 && k == 0)) {
                        if (this.cells[x + i][y + j][z + k].getState()) {
                            c += 1;
                        }
                    }
                }
            }
        }
        
        return c;
        
    }
}


class Cell {
    
    int x, y, z;
    Boolean state;
    Boolean future_state;
    
    public Cell(int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.state = false;
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
    
    int getZ() {
        return this.z;
    }
}


Boolean inRectangle(float x, float y, float x_tl, float y_tl, float width, float height) {
    return x - x_tl > 0 && x - x_tl < width && y - y_tl > 0 && y - y_tl < height;
}

Boolean inSquare(float x, float y, float x_tl, float y_tl, float width) {
    return inRectangle(x, y, x_tl, y_tl, width, width);
}
