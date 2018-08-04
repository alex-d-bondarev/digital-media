/* Code Description

 Added for homework #3:
1. Land in different locations and see a different messages (setLandingStatus)
1.1 Press "L" to see new landing field
2. Spaceship is not flying out of the screen now
3. Added some comments for legacy code

//----------------------------------------
Added for homework #2
1. Added some hills, trees and river in background

2. A spaceship (UFO), that can land in different areas
2.1. To control an UFO click (holding also works) arrow keys
UP - adds some torque  to go up
LEFT - adds some torque to go left and a little torque to go up
RIGHT - adds some torque to go right and a little torque to go up

2.2. You can also use wind to fly a spaceship. 
Hit a mouse at any place on screen. Wind will blow in appropriate way. 
You cannot change wind power, but you can change it's angle. 
For each wind blow you need to press mouse button again.

NOTE: Try to achieve high horizontal speed - you will see a frame rate glitch.

inspired by an old lunar lander game
http://moonlander.seb.ly/

//----------------------------------------
Homework #1
This app will draw a red tall kozak

inspired by an old cartoon
https://youtu.be/P8vvK_e2yhw
*/

//------------------------------------------------------//
//---------------------- Variables ---------------------//
//------------------------------------------------------//

//----------------------------------------
// Colors
//----------------------------------------
color black = color(0);
color white = color(255);
color darkGrey = color(110, 95,  85);
color darkRed = color(120, 50,  50);
color grass = color(70,  100, 40);
color leaves = color(60,  120, 20);
color lightLeaves = color(105, 160, 70);
color lightWheat = color(214, 190, 65);
color red = color(210,50,50);
color skin = color(252, 189, 132);
color text = color(0, 102, 153);
color water = color(160, 175, 240);
color wheat = color(180, 180, 65);
color road = color(200, 165, 130);
color spaceshipFill = color(50,106,70);
color spaceshipStroke = color(55,240,240);

//----------------------------------------
// Spaceship
//----------------------------------------
// constants
float GRAVITY = 0.015;
float TORQUE = 0.05;
float WINDAGE = 0.005;

// for moving
float distance;
float horizontalSpeed;
float posX;
float posY;
float verticalSpeed;

// for drawing
boolean highlighField;
boolean moveLeft;
boolean moveRight;
boolean moveUp;
int pointX = 700;
int pointY = 210;
String message;

// for landing
boolean landed;
boolean showLandingLine;

// landing field
// Y
int extremeHeight = 360;
int handHeight = 240;
int headHeight = 160;
int hillHeight = pointY;
// X
int leftHeadEdge = 130;
int rightHeadEdge = 200;
int rightHandEdge = 270;
int leftHillBottom = 540;
int leftHillTop = pointX+20;
int rightHillTop = pointX+230;


//----------------------------------------
void setup(){
  //window
  size(1000,600);
  background(255);
  frameRate(60);
  resetSpaceship();
} 

//----------------------------------------
void draw(){
  drawSky();
  drawNature();
  getLandingField();
  getSpaceship();
  drawTallKozak();
}

//------------------------------------------------------//
//------------ Draw simple dynamic pictures ------------//
//------------------------------------------------------//

//----------------------------------------
// Effect: set spaceship variables 
//         to starting point
//----------------------------------------
void resetSpaceship() {
  posX = 100;
  posY = 0;
  horizontalSpeed = 0;
  verticalSpeed = 0;
  moveRight = false;
  moveLeft = false;
  moveUp = false;
  highlighField = true;
  landed = false;
  showLandingLine = false;
}

//----------------------------------------
// Effect: highlights landing field 
//----------------------------------------
void getLandingField(){
  if(showLandingLine){
    // set style
    strokeWeight(5);
    // move every frame
    if(frameCount % 20 == 0){
      highlighField = ! highlighField;
    } 
    if(highlighField) {
      // draw blue/safe landing zone
      stroke(spaceshipStroke);
      line(leftHillTop,hillHeight, rightHillTop, hillHeight);
      // draw red/unsafe landing zone
      stroke(red);
      line(0,extremeHeight, width,extremeHeight);
      line(leftHeadEdge,headHeight, leftHeadEdge,extremeHeight);
      line(leftHeadEdge,headHeight, rightHeadEdge,headHeight);
      line(rightHeadEdge,headHeight, rightHeadEdge,handHeight);
      line(rightHeadEdge,handHeight, rightHandEdge,handHeight);
      line(rightHandEdge,handHeight, rightHandEdge,extremeHeight);
      line(leftHillTop, hillHeight, leftHillTop,extremeHeight);
      line(rightHillTop, hillHeight, rightHillTop,extremeHeight);
    }
    strokeWeight(1);
  }
}

//----------------------------------------
// Effect: draws spaceship 
//----------------------------------------
void getSpaceship(){
   
  // spaceship is moved by pushing coordinates
  pushMatrix();
  translate(posX, posY);
  
  // set spaceship style
  fill(spaceshipFill);
  stroke(spaceshipStroke);
  
  // draw top
  arc(0,0, 40, 40, PI, 2*PI, CHORD);
  
  // draw legs
  line(-35,25, -10,0);
  line(35,25, 10,0);
  
  // draw body
  arc(0,30,80,80, 1.15*PI, 1.85*PI, CHORD);

  // calculate GRAVITY force on spaceship and move
  moveSpaceship();
  
  strokeWeight(1);
  popMatrix();
}

//----------------------------------------
// Move spaceship
//----------------------------------------
void moveSpaceship(){
  // update by controls
  if(moveRight) { 
    horizontalSpeed+=TORQUE/2; 
    verticalSpeed-=TORQUE/4; 
  } if(moveLeft) { 
    horizontalSpeed-=TORQUE/2;
    verticalSpeed-=TORQUE/4;  
  } if(moveUp) { 
    verticalSpeed-=TORQUE; 
  }
  
  // update by gravity
  verticalSpeed += GRAVITY;
  // update by windage
  if(horizontalSpeed > 0){
    horizontalSpeed-= WINDAGE;
  } else if (horizontalSpeed < 0) {
    horizontalSpeed+= WINDAGE;
  }
  
  // check if spaceship landed
  setLandingStatus();

  
  // update position
  posX += horizontalSpeed;
  posY += verticalSpeed;
  
  // out of the screen
  if(posX < -30) { posX = 1030; }
  if(posX > 1030){ posX = -30; } 
  if(posY < 0) { verticalSpeed = 0; }
}


//----------------------------------------
// Handle landing
//----------------------------------------
void setLandingStatus(){
  
  landed = true;
  
  // for big hill landing
  if(posY >= hillHeight && posY < hillHeight+40 && posX > leftHillTop && posX < rightHillTop) {
    message = "Nice!";
    
  // for landing on right part of big hill
  } else if(posX > rightHillTop && posY > handHeight) {
    message = "Go left";
  
  // for landing on left part of big hill
  } else if(posX < leftHillTop && posX > leftHillBottom && posY > extremeHeight) {
    message = "Go right";
  
  // for river landing
   } else if(posX > rightHandEdge && posX < leftHillBottom && posY > extremeHeight) {
    message = "No water!!";
    
  // for hand landing 
   } else if(posX > rightHeadEdge && posX < rightHandEdge 
                                   && posY > handHeight && posY < handHeight+30) {
    message = "How?";
  
  // for head landing
   } else if(posX > leftHeadEdge && posX < rightHeadEdge 
                                   && posY > headHeight && posY < headHeight+30) {
    message = "???";
  
  // for far hills landing
  } else if (posY > extremeHeight) {
  // landOnFarHills = true;
    message = "Too far";
  
  // still flying
  } else {
    landed = false;
  }


  // draw landed ship with text in dialog
  if(landed) {
    // stop spaceship
    verticalSpeed = 0;
    horizontalSpeed = 0;
    
    // switch off landing highlighter
    showLandingLine = false;
    pushMatrix();
    translate(-10,-50);
    
    // set style
    noStroke();
    textAlign(CENTER);
    fill(white);
    
    // dialog
    ellipse(10,-10,90,50);
    beginShape();
    vertex(-35,-10);
    bezierVertex(-35,-10, -35,15, 0,25);
    endShape();
    
    // text
    fill(black);
    text(message, 10,-10);
    
    popMatrix();
  }  
}


//----------------------------------------
// Handle arrow keys
//----------------------------------------
void keyPressed(){
 if(key == CODED){
   switch(keyCode){
      case(RIGHT): 
        moveRight = true;
        break;
      case(LEFT):  
        moveLeft = true;
        break;
      case(UP):
        moveUp = true;
        break;
    }
 } else if(key == ' ') {
   // reset spaceship
   resetSpaceship();
 } else if(key == 'l' || key == 'L'){
   showLandingLine = ! showLandingLine;
 }
} 

void keyReleased(){
 moveRight = false;
 moveLeft = false;
 moveUp = false;
} 

//----------------------------------------
// Handle mouse events
//----------------------------------------
// makes some "wind"
// wind power can be changed very little
// wind angle depends on mouse position
void mousePressed () {
  
  // calculate whole distance from spaceship to mouse
  // by using Pythagorean theorem
  distance = sqrt( pow(mouseX - posX, 2) 
                 + pow(mouseY - posY, 2) );
                 
  // change speed by getting direction => (x1 - x2)^0
  // multiplying by distance 
  // adding to vertical and horizontal speed
  verticalSpeed = verticalSpeed - (mouseY - posY)/(2*distance);
  horizontalSpeed = horizontalSpeed - (mouseX - posX)/(2*distance);
}

//----------------------------------------
// Effect: draws sky 
//----------------------------------------
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
  
  // draw 1px line of screen width 
  // starting on top of the screen and untill the bottom
  for (int i = 0; i < height; i++) {
   stroke(redVar, greenVar, blueVar);
   line(0,screenY, width, screenY);
   
   // no color change for first 10 px
   // increment all colors untill blue becomes maximum (255)
   if (blueVar < 255 && screenY > 10) {
     blueVar++;
     redVar++;
     greenVar++;
     
   // increment other colors that are left after blue
   // untill they become maximum (255 or white)
   } else if (redVar < 255 || greenVar < 255) {
     redVar++;
     greenVar++;
   }
   
   // go to next screen line
   screenY++;
  }
}

//------------------------------------------------------//
//------------ Draw complex static pictures ------------//
//------------------------------------------------------//
//----------------------------------------
// Effect: draws some hills in background
//----------------------------------------
void drawNature() {
  
  stroke(0);
  ellipseMode(CENTER);
  
  //----------------------------------------
  // hills in background
  fill(lightWheat);
  ellipse(400, 550, 1000, 500);
  drawTree(400,295);
  drawTree(420,290);
  drawTree(445,300);
  
  fill(lightWheat);
  ellipse(330, 530, 600, 500);
  drawTree(290,360);
  
  fill(lightWheat);
  ellipse(50, 450, 400, 400);
  ellipse(150, 530, 350, 500);
  
  //----------------------------------------
  // trees in the left on grass hill
  drawTree(70,330);
  drawTree(50,320);
  drawTree(35,315);
  drawTree(10,310);
  drawTree(460,355);
  drawTree(485,360);
  // grass hill
  fill(wheat);
  ellipse(75, 500, 550, 350);
  
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
  
  //----------------------------------------
    // main front area
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

//----------------------------------------
// Given: x and y coordinates 
// Effect: draws a tree in given coordinates
//----------------------------------------
void drawTree(float x, float y) {
  // move to given positions
  pushMatrix();
  translate(x, y);
  
  // set a tree shape
  noStroke();  
  fill(lightLeaves);
  ellipse(0, 0, 30, 60);
  
  // set a shadow/leaves
  fill(leaves);  
  beginShape();
  vertex(-7,-28);
  bezierVertex(-7,-28, -15,0,    0,0);
  bezierVertex(0,0,     10,5,    7,28);
  bezierVertex(7,28,    30,-30, -7,-28);
  endShape();
  
  // finish drawing a tree
  stroke(1);  
  popMatrix();
}

//----------------------------------------
// Effect: draws a tall kozak in red clothes
//----------------------------------------
void drawTallKozak() {

  // move him lower
  pushMatrix();
  translate(0, 100); 
  
    stroke(0);
    
    //----------------------------------------
    // left boot
    fill(black);
    beginShape();
    vertex(165,440);
    bezierVertex(165,440, 150,455, 125,460);
    bezierVertex(125,460, 140,475, 170,450);
    vertex(172,458);
    vertex(180,455);
    vertex(175,440);
    endShape();
    
    //----------------------------------------
    // right boot
    fill(black);
    beginShape();
    vertex(220,445);
    bezierVertex(220,445, 250,450, 270,440);
    bezierVertex(270,440, 250,465, 220,450);
    vertex(220,458);
    vertex(210,455);
    vertex(210,440);
    endShape();
     
    //----------------------------------------
    // draw legs
    
    // experiment with pushing a matrix //
    pushMatrix();
    translate(100, 0); 
    
    fill(red);
    beginShape();
    vertex(75,390);
    // left leg
    bezierVertex(75,380, 10,390, 60,440);
    bezierVertex(60,440, 40,450 ,80,445);
    // middle
    bezierVertex(70,445, 90,420 ,90,410);
    bezierVertex(100,410, 125,420 ,105,440);
    // right leg
    bezierVertex(105,445, 145,450, 125,440);
    bezierVertex(125,440, 175,390, 130,380);
    endShape();
    
    // stop matrix experiment //
    popMatrix();
    
    //----------------------------------------
    // draw skirt
    beginShape();
    
    strokeWeight(1);
    // top 1eft part
    vertex(190,370);
    bezierVertex(190,370, 160,370, 140,400);
    // bottom
    bezierVertex(140,400, 155,390, 170,410);
    bezierVertex(170,410, 200,440, 225,400);
    bezierVertex(225,400, 230,390, 245,385);
    // top right part
    bezierVertex(245,385, 220,370, 190,370);
    endShape();
    
    //----------------------------------------
    // draw folds
    noFill(); //no color
    // on skirt
    bezier(180,370, 175,380, 165,395, 160,395);
    line(185,370, 175,405);
    bezier(190,370, 200,375, 210,380, 225,385);
    line(190,370, 215,395);
    // on legs
    bezier(175,420, 170,425, 170,430, 175,440);
    bezier(225,410, 230,425, 220,430, 215,435);
    
    //----------------------------------------
    // draw a sleeve
    fill(darkRed);
    beginShape();
    vertex(260, 220);
    bezierVertex(257,220, 260,205, 275,215);
    bezierVertex(275,215, 285,230, 280,250);
    endShape();
    
    //----------------------------------------
    // draw a neck
    fill(skin);
    beginShape();
    vertex(170,150);
    vertex(180,200);
    vertex(197,200);
    vertex(193,150);
    endShape();
    
    //----------------------------------------
    // hat strip
    fill(red);
    beginShape();
    vertex(113,97);
    vertex(113,170);
    bezierVertex(113,170, 115,167, 100,170);
    bezierVertex(100,170, 117,155, 120,100);
    endShape();
    
    fill(darkRed);
    ellipseMode(CENTER);
    ellipse(113,145,10,10);
    
    //----------------------------------------
    // draw a hat
    fill(darkGrey);
    beginShape();
    vertex(193,150);
    bezierVertex(193,150, 220,125, 210,115);
    bezierVertex(210,115, 200,105, 190,105);
    bezierVertex(190,105, 185,60,  160,95);
    bezierVertex(160,95,  155,60,  120,85);
    bezierVertex(120,85,  100,95,  120,100);
    bezierVertex(120,100, 130,95,  135,105);
    bezierVertex(135,105, 135,125, 150,125);
    bezierVertex(150,125, 125,175, 165,165);
    endShape();
    
    //----------------------------------------
    // draw a head
    fill(skin);
    beginShape();
    vertex(160,160);
    bezierVertex(160,160, 160,175, 195,175);
    bezierVertex(195,175, 210,180, 210,145);
    bezierVertex(210,145, 200,140, 205,120);
    bezierVertex(205,120, 175,100, 160,145);
    bezierVertex(160,145, 145,130, 155,150);
    bezierVertex(155,150, 150,170, 160,160);
    endShape();
    
    //----------------------------------------
    // draw a left mustache
    fill(black);
    beginShape();
    vertex(190,155);
    bezierVertex(190,155, 177,150, 165,165);
    bezierVertex(165,165, 160,180, 130,175);
    bezierVertex(150,175, 180,200, 195,155);
    endShape();
    
    //----------------------------------------
    // draw a right mustache
    beginShape();
    vertex(208,162);
    bezierVertex(210,155, 227,150, 235,165);
    bezierVertex(235,165, 240,180, 270,175);
    bezierVertex(250,175, 220,200, 205,155);
    endShape();
    
    //----------------------------------------
    // draw a forelock
    beginShape();
    vertex(183,116);
    bezierVertex(183,116, 185,100, 200,110);
    bezierVertex(200,110, 210,105, 200,100);
    bezierVertex(200,100, 220,80,  220,110);
    bezierVertex(220,110, 215,125, 205,125);
    bezierVertex(205,125, 190,110, 183,116);
    endShape();
    
    //----------------------------------------
    // draw a mouth
    beginShape();
    noFill();
    vertex(195,163);
    bezierVertex(192,163, 200,170, 206,163);
    endShape();
    
    stroke(130);
    beginShape();
    noFill();
    vertex(195,172);
    bezierVertex(195,172, 199,172, 202,170);
    endShape();
    stroke(0);
    
    //----------------------------------------
    // draw a nose
    fill(skin);
    beginShape();
    vertex(190,150);
    bezierVertex(190,150, 185,155, 195,160);
    bezierVertex(195,160, 210,165, 215,155);
    bezierVertex(215,155, 220,140, 210,140);
    bezierVertex(210,140, 205,145, 200,140);
    endShape();
    
    //----------------------------------------
    // draw a right arm
    beginShape();
    vertex(255,260);
    vertex(270,210);
    bezierVertex(270,210, 270,205, 265,200);
    bezierVertex(265,200, 260,200, 260,195);
    bezierVertex(260,195, 260,190, 250,190);
    bezierVertex(250,190, 245,185, 250,180);
    bezierVertex(250,180, 260,180, 260,185);
    bezierVertex(270,190, 270,180, 255,175);
    bezierVertex(255,175, 265,150, 270,165);
    bezierVertex(270,165, 275,160, 275,170);
    bezierVertex(275,170, 286,160, 283,210);
    vertex(265,260);
    endShape();
    
    line(260,178, 270,165);
    line(265,181, 275,170);
    
    //----------------------------------------
    // draw a right hand
    fill(red);
    beginShape();
    vertex(215,230);
    bezierVertex(215,240, 230,260, 240,290);
    bezierVertex(240,290, 245,300, 260,290);
    bezierVertex(260,290, 270,260, 280,250);
    bezierVertex(280,250, 280,235, 265,220);
    bezierVertex(250,210, 270,215, 250,255);
    bezierVertex(250,255, 240,220, 230,205);
    bezierVertex(230,205, 225,190, 200,205);
    endShape();
    
    //----------------------------------------
    // draw a body
    beginShape();
    vertex(200,380);
    bezierVertex(210,375, 250,230, 210,200);
    vertex(160, 195);
    vertex(150, 230);
    bezierVertex(150, 230, 170,250, 180,380);
    endShape();
    
    //----------------------------------------
    // draw a left arm
    fill(skin);
    beginShape();
    vertex(150,290);
    vertex(165,320);
    bezierVertex(165,320, 175,310, 180,320);
    bezierVertex(180,320, 185,335, 180,350);
    bezierVertex(180,350, 165,355, 160,350);
    bezierVertex(160,350, 155,350, 155,335);
    vertex(130,285);
    endShape();
    
    //----------------------------------------
    // draw a left hand
    fill(red);
    beginShape();
    vertex(160, 195);
    bezierVertex(160,195, 145,195, 140,205);
    bezierVertex(140,205, 135,235, 115,265);
    bezierVertex(115,265, 110,270, 120,275);
    bezierVertex(120,275, 125,295, 140,320);
    bezierVertex(135,330, 160,330, 165,300);
    bezierVertex(165,300, 155,300, 140,265);
    bezierVertex(140,265, 160,230, 165,220);
    endShape();
    
    //----------------------------------------
    // draw a collar
    beginShape();
    vertex(170,196);
    bezierVertex(170,196, 180,180, 205,185);
    bezierVertex(205,185, 205,190, 200,200);
    endShape();
    
    //----------------------------------------
    // draw a belt
    fill(darkRed);
    beginShape();
    vertex(175, 370);
    bezierVertex(175, 370, 177,395, 210,373);
    vertex(208, 365);
    bezierVertex(208, 365, 180,380, 178,365);
    vertex(175, 370);
    endShape();
    
    //----------------------------------------
    // draw a right eye
    fill(white);
    ellipse(200,137,10,15);
    fill(black);
    ellipse(199,139,5,7);
    
    //----------------------------------------
    // draw a left eye
    pushMatrix();
    translate(-15, 5);
    
    fill(white);
    ellipseMode(CENTER);
    ellipse(200,135,10,15);
    fill(black);
    ellipse(199,137,5,7);
    popMatrix();
    
    //----------------------------------------
    // body folds
    beginShape();
    noFill();
    vertex(200,353);
    bezierVertex(200,353, 225,230, 195,210);
    endShape();
    
    pushMatrix();
    translate(192, 225);
    rotate(radians(-10));
    
    strokeWeight(2);
    line(0,0,  25,0);
    line(0,5,  25,5);
    line(0,10, 25,10);
    line(0,15, 25,15);
    
    popMatrix();
    
    //----------------------------------------
    // eywbrows
    strokeWeight(3);
    line(180,130, 185,122);
    line(200,122, 195,125);
    
    //----------------------------------------
    // connect right hand to body
    stroke(red);
    strokeWeight(8);
    line(215,202,225,218);
    strokeWeight(1);
  
  popMatrix();
}