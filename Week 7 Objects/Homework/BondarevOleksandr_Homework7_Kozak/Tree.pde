// this class is not used in main class
// this is a helper class

class Tree {
  
  //================================================================================
  // properties
  color leaves = color(60,  120, 20);
  color lightLeaves = color(105, 160, 70);
  float posX, posY;
  
  //================================================================================
  // constructor
  Tree() {
    
  }
  
  //================================================================================
  // methods
  
  //--------------------------------------------------------------------------------
  // Given: x and y coordinates 
  // Effect: draws a tree in given coordinates
  //--------------------------------------------------------------------------------
  // NOTE:TODO: refactor after learning arrays
  //            move x and y to constructor
  void display(float x, float y) {
    posX = x;
    posY = y;
    // move to given positions
    pushMatrix();
    translate(posX, posY);
    
    //----------------------------------------
    // set a tree shape
    noStroke();  
    fill(lightLeaves);
    ellipse(0, 0, 30, 60);
    
    //----------------------------------------
    // set a shadow/leaves
    fill(leaves);  
    beginShape();
    vertex(-7,-28);
    bezierVertex(-7,-28, -15,0,    0,0);
    bezierVertex(0,0,     10,5,    7,28);
    bezierVertex(7,28,    30,-30, -7,-28);
    endShape();
    
    //----------------------------------------
    // finish drawing a tree
    stroke(1);  
    popMatrix();
  }
}