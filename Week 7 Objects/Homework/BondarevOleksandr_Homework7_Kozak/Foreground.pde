class Foreground{

  //================================================================================
  // properties
  color black;
  Kozak kzk;
  color red;
  color white;
  
  //================================================================================
  // constructor
  Foreground(color blackColor, color grassColor, color redColor, color whiteColor) {
    black = blackColor;
    grass = grassColor;
    red = redColor;
    white = whiteColor;
    kzk = new Kozak(red, black, white);
  }
  
  //================================================================================
  // methods
  
  //--------------------------------------------------------------------------------
  // Effect: displays hill and kozak
  //--------------------------------------------------------------------------------
  void display() {
    drawFrontHill();
    kzk.display();
  }
  
  //--------------------------------------------------------------------------------
  // Effect: front hill
  //--------------------------------------------------------------------------------
  void drawFrontHill() {
    // main front hill
    fill(grass);
    ellipse(500, 700, 1500, 600);
    
    // front road
    fill(road);
    beginShape();
    vertex(280,600);
    bezierVertex(280,600, 320,580, 300,570);
    bezierVertex(300,570, 275,545, 350,490);
    bezierVertex(350,490, 490,370, 775,420);
    bezierVertex(775,420, 820,425, 850,435);
    bezierVertex(850,435, 680,400, 590,500);
    bezierVertex(590,500, 540,550, 600,550);
    bezierVertex(600,550, 660,540, 670,600);
    endShape();
  }
}