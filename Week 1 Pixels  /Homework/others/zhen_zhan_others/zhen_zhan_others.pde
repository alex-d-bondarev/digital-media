Cell[][] grid;
int cols = 10;
int rows = 20;
void setup() {
  size(500,500);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j] = new Cell(i*20,j*20,20,20);
    }
  }
}
void draw() {
  noStroke();
    background(HSB, 100);
      for (int i = 0; i < 500; i++) {
      for (int j = 0; j < 500; j++) {
      stroke(i, j, 500);
      point(i, j);
  }
}
  for (int i = 0; i < cols; i ++ ) {    
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j].display();
    }
  }
}
class Cell {


  float x,y;   
  float w,z;  
  float angle; 
  

  Cell(float width, float height, float W, float H) {
    x = width;
    y = height;
    w = W;
    z = H; 
  }
  void display() {
    stroke(0);
    fill(100);
    rect(x+160,y+60,w,z);
    
  }
}