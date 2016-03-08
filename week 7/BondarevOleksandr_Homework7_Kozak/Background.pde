class Background {

  //================================================================================
  // properties
  color black;
  color grass;
  color lightWheat = color(214, 190, 65);
  Tree tree;
  color water = color(160, 175, 240);
  color wheat = color(180, 180, 65);
  color white;
  
  //================================================================================
  // constructor
  Background(color blackColor, color grassColor, color whiteColor) {
    black = blackColor;
    grass = grassColor;
    tree = new Tree();
    white = whiteColor;
  }
  
  //================================================================================
  // methods
  
  //--------------------------------------------------------------------------------
  // Effect: displays sky and nature background
  //--------------------------------------------------------------------------------
  void display() {
    drawSky();
    drawNature();
  }
  
  //--------------------------------------------------------------------------------
  // Effect: draws sky 
  //--------------------------------------------------------------------------------
  // I did not get how to use gradient
  // this is some kind of workaround
  void drawSky(){ 
    // set style
    int redVar = 50;
    int greenVar = 50;
    int blueVar = 100;
    int screenY = 0;
    noStroke();
    colorMode(RGB,255);
    
    //----------------------------------------
    // draw 1px line of screen width 
    // starting on top of the screen and untill the bottom
    for (int i = 0; i < height; i++) {
     stroke(redVar, greenVar, blueVar);
     line(0,screenY, width, screenY);
     
     //----------------------------------------
     // no color change for first 10 px
     // increment all colors untill blue becomes maximum (255)
     if (blueVar < 255 && screenY > 10) {
       blueVar++;
       redVar++;
       greenVar++;
       
     //----------------------------------------  
     // increment other colors that are left after blue
     // untill they become maximum (255 or white)
     } else if (redVar < 255 || greenVar < 255) {
       redVar++;
       greenVar++;
     }
     
     //----------------------------------------
     // go to next screen line
     screenY++;
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: draws some hills in background
  //--------------------------------------------------------------------------------
  void drawNature() {
    
    stroke(0);
    ellipseMode(CENTER);
    
    //----------------------------------------
    // hills in background
    fill(lightWheat);
    ellipse(400, 550, 1000, 500);
    tree.display(400,295);
    tree.display(420,290);
    tree.display(445,300);
    
    fill(lightWheat);
    ellipse(330, 530, 600, 500);
    tree.display(290,360);
    
    fill(lightWheat);
    ellipse(50, 450, 400, 400);
    ellipse(150, 530, 350, 500);
    
    //----------------------------------------
    // small forest in the left middle part of the screen
    for(int y=230; y<=400 ; y+=20) {
      for(int x=0; x<=20 + y%210; x+=20) {
        tree.display(x,y);
        if (y<340) { y+=5; }
      }
    }
    
    // grass hill
    fill(wheat);
    ellipse(150, 500, 350, 370);
    
    // 1 short line of trees near the river
    int treeLineY = 400;
    for(int x=10; x<=100; x+=25) {
      tree.display(x,treeLineY);
      treeLineY -= 25;
    }
    
    //----------------------------------------
    // a river
    fill(water);
    stroke(white);
    strokeWeight(4);
    beginShape();
    vertex(50,470);
    bezierVertex(50,470, 100,420, 270,390);
    bezierVertex(270,390, 300,390, 330,370);
    bezierVertex(330,370, 360,350, 440,350);
    bezierVertex(440,350, 515,365, 500,340);
    bezierVertex(500,340, 490,320, 600,325);
    vertex(600,460);
    endShape();
    
    stroke(black);
    strokeWeight(1);
    
    //----------------------------------------
    // top main hill
    fill(grass);
    ellipse(850, 750, 750, 1200);
    
    // far road
    fill(road);
    beginShape();
    vertex(870,440);
    bezierVertex(870,440, 880,360, 760,345);
    bezierVertex(760,345, 670,345, 715,290);
    bezierVertex(715,290, 756,255, 690,255);
    bezierVertex(690,255, 630,240, 715,190);
    bezierVertex(715,190, 840,110, 945,168);
    bezierVertex(945,168, 1050,225, 820,270);
    bezierVertex(820,270, 700,295, 775,325);
    bezierVertex(775,325, 940,340, 930,470);
    endShape();
  }
}