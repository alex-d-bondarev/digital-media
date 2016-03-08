/* Code Description

Added for homework week #7
1. Updated code to meet OOP standards
1.1 Removed some variables, that are used only for specific classes, from main class
*/

//------------------------------------------------------//
//------------------------ Enums -----------------------//
//------------------------------------------------------//

enum AlienState {
    INUFO
    , LANDED
    , TOHILLENTRANCE
    , TOFIRSTPOINT
    , TOSECONDPOINT
    , BETWEENHILLS
    , TOHILLTOP
    , TOKOZAK
    , NEARKOZAK
}

//------------------------------------------------------//
//---------------------- Variables ---------------------//
//------------------------------------------------------//

//----------------------------------------
// Colors
//----------------------------------------
color alien = color(180,170,140);
color alienCloth = color(125,155,125);
color alienNeck = color(215,240,240);
color black = color(0);
color white = color(255);
color darkGrey = color(110, 95,  85);
color darkRed = color(120, 50,  50);
color grass = color(70,  100, 40);
color leaves = color(60,  120, 20);
color lightLeaves = color(105, 160, 70);
color lightWheat = color(214, 190, 65);
color orange = color(245,170,0);
color red = color(210,50,50);
color skin = color(252, 189, 132);
color text = color(0, 102, 153);
color water = color(160, 175, 240);
color wheat = color(180, 180, 65);
color road = color(200, 165, 130);
color UFOFill = color(50,106,70);
color UFOStroke = color(55,240,240);

//----------------------------------------
// UFO
//----------------------------------------
// constants
float GRAVITY = 0.015;
float TORQUE = 0.05;
float WINDAGE = 0.005;

// for moving
boolean paused;
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
boolean niceLanding;
boolean showLandingLine;

// landing field
// Y
int extremeHeight = 360;
int handHeight = 260;
int headHeight = 190;
int hillHeight = pointY;
// X
int leftHeadEdge = 130;
int rightHeadEdge = 200;
int rightHandEdge = 270;
int leftHillBottom = 540;
int leftHillTop = pointX+20;
int rightHillTop = pointX+230;

//----------------------------------------
// Alien
//----------------------------------------
float alienVelocity = 2;
long timeToWait = 1000;


//----------------------------------------
// Other
//----------------------------------------
long beforeWait;


//----------------------------------------
// Declare classes
//----------------------------------------
Alien aln;
Background bkg;
Foreground frg;


//----------------------------------------
void setup(){
  // initialize objects
  aln = new Alien();
  bkg = new Background(black, grass, white);
  frg = new Foreground(black, red, white);
  
  //window
  size(1000,600);
  background(255);
  frameRate(60);
  resetUFO();
} 

//----------------------------------------
void draw(){
  bkg.display();
  aln.inBackground();
  drawLandingField();
  drawUFO();
  frg.display();
}

//------------------------------------------------------//
//------------ Draw simple dynamic pictures ------------//
//------------------------------------------------------//

//----------------------------------------
// Effect: set UFO variables 
//         to starting point
//----------------------------------------
void resetUFO() {
  aln.reset();
  beforeWait = 0;
  posX = 100;
  posY = 20;
  horizontalSpeed = 0;
  verticalSpeed = 0;
  moveRight = false;
  moveLeft = false;
  moveUp = false;
  highlighField = true;
  landed = false;
  showLandingLine = false;
  paused = false;
  niceLanding = false;
}



//----------------------------------------
// Effect: highlights landing field 
//----------------------------------------
void drawLandingField(){
  if(showLandingLine){
    // set style
    strokeWeight(5);
    // move every frame
    if(frameCount % 20 == 0){
      highlighField = ! highlighField;
    } 
    if(highlighField) {
      // draw blue/safe landing zone
      stroke(UFOStroke);
      fill(UFOStroke);
      rect(leftHillTop,hillHeight, rightHillTop-leftHillTop, 40);
      
      // draw red/unsafe landing zone
      stroke(red);
      fill(red);
      
      //head landing
      rect(leftHeadEdge,headHeight, rightHeadEdge-leftHeadEdge,20);
      
      // hand landing
      rect(rightHeadEdge,handHeight, rightHandEdge-rightHeadEdge,20);
      
      // water landing
      rect(rightHandEdge+50,extremeHeight, leftHillBottom-rightHandEdge-50,10);
      
      // left hill botton
      rect(leftHillBottom, extremeHeight-10, leftHillTop-leftHillBottom, 10);
      
      // right hill botton
      rect(rightHillTop, extremeHeight-10, width-rightHillTop,10);
      
      // everithing else
      line(0,extremeHeight, width,extremeHeight);
    }
    strokeWeight(1);
  }
}

//----------------------------------------
// Effect: draws UFO 
//----------------------------------------
void drawUFO(){
   
  // UFO is moved by pushing coordinates
  pushMatrix();
  translate(posX, posY-20); // -20 (landing legs length) for better looking landing
  
  // set UFO style
  fill(UFOFill);
  stroke(UFOStroke);
  
  //----------------------------------------
  // draw top
  // it will open when landed nicely
  if(niceLanding) {
    rotate(radians(90));
    arc(-20,-25, 40, 40, PI, 2*PI, CHORD);
    rotate(radians(-90));
  } else {
    arc(0,0, 40, 40, PI, 2*PI, CHORD);
  }
  
  //----------------------------------------
  // draw legs
  if (landed) {
    line(-35,25, -10,0);
    line(35,25, 10,0);
  }
  
  //----------------------------------------
  // draw body
  arc(0,30,80,80, 1.15*PI, 1.85*PI, CHORD);

  // if not paused
  // calculate GRAVITY force on UFO and move
  if(!paused) { moveUFO(); }
  
  //----------------------------------------
  // draw torque (red/orange fire)
  noStroke();
  // color will be changing each frame
  if(frameCount % 2 == 0){ fill(red); } 
  else { fill(orange); }
  
  // "up" 
  if(moveUp) {
    ellipse(0, 25, 10, 20);
  }
    
  // draw "left" torque
  if(moveLeft){
    rotate(radians(-45));
    ellipse(17, 45, 10, 15);
    rotate(radians(45));
  }
  // draw "right" torques
  if(moveRight){
    rotate(radians(45));
    ellipse(-17, 45, 10, 15);
    rotate(radians(-45));
  }
  
  //----------------------------------------
  strokeWeight(1);
  popMatrix();
}

//----------------------------------------
// Move UFO
//----------------------------------------
void moveUFO(){
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
  
  // check if UFO landed
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
  
  if(!landed) {
    landed = true;
    
    // for big hill landing
    if(posY >= hillHeight && posY < hillHeight+40 && posX > leftHillTop && posX < rightHillTop) {
      message = "Nice!";
      niceLanding = true;
      
      // change alien coordinates
      aln.setX(posX);
      aln.setY(posY-25);
      aln.nextState();
      
    // for landing on right part of big hill
    } else if(posX > rightHillTop && posY > handHeight) {
      message = "Go left";
    
    // for landing on left part of big hill
    } else if(posX < leftHillTop && posX > leftHillBottom && posY > extremeHeight) {
      message = "Go right";
    
    // for river landing
     } else if(posX > rightHandEdge+70 && posX < leftHillBottom && posY > extremeHeight) {
      message = "No water!!";
      
    // for hand landing 
     } else if(posX > rightHeadEdge && posX < rightHandEdge 
                                     && posY > handHeight && posY < handHeight+30) {
      message = "Impossible!";
    
    // for head landing
     } else if(posX > leftHeadEdge && posX < rightHeadEdge 
                                     && posY > headHeight && posY < headHeight+20) {
      message = "???";
    
    // for far hills landing
    } else if (posY > extremeHeight) {
    // landOnFarHills = true;
      message = "Too far";
    
    // still flying
    } else {
      landed = false;
    }
  }

  // draw landed ship with text in dialog
  if(landed) {
    // stop UFO
    verticalSpeed = 0;
    horizontalSpeed = 0;
    
    // switch off landing highlighter
    showLandingLine = false;
    
    // start showing a small alien for nice landing
    if (niceLanding) {
    
      
    // show dialog for wrong landing
    } else {
      pushMatrix();
      translate(-10,-50);
      
      // set style
      noStroke();
      textAlign(CENTER);
      fill(white);
      
      // draw dialog cloud
      ellipse(10,-10,90,50);
      beginShape();
      vertex(-35,-10);
      bezierVertex(-35,-10, -35,15, 0,25);
      endShape();
      
      fill(black);
      text(message, 10,-10);
      
      popMatrix();
      
    }
  }  
}


//----------------------------------------
// EFFECT: Handle arrow keys
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
   // reset UFO
   resetUFO();
 } else if(key == 'l' || key == 'L'){
   showLandingLine = ! showLandingLine;
 } else if(key == 'p' || key == 'P'){
   paused = ! paused;
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
  
  // calculate whole distance from UFO to mouse
  // by using Pythagorean theorem
  distance = sqrt( pow(mouseX - posX, 2) 
                 + pow(mouseY - posY, 2) );
                 
  // change speed by getting direction => (x1 - x2)^0
  // multiplying by distance 
  // adding to vertical and horizontal speed
  verticalSpeed = verticalSpeed - (mouseY - posY)/(2*distance);
  horizontalSpeed = horizontalSpeed - (mouseX - posX)/(2*distance);
}

//------------------------------------------------------//
//------------- Draw simple static pictures ------------//
//------------------------------------------------------//

//----------------------------------------
// GIVEN: x and y coordinates
// EFFECT: draws a small alien in given
//         coordinates
//----------------------------------------
void smallAlien(float aPosX, float aPosY) {
  
    // push picture to given coordinates
    pushMatrix();
    translate(aPosX, aPosY);
    
    // draw a small alien           
    fill(alienCloth);
    ellipse(0,-15, 35, 50);
    fill(alien);
    arc(0,-15, 35, 50, 1.10*PI, 1.90*PI, CHORD);
    fill(alienNeck);
    ellipse(0,-22, 40,5);
    
    // draw eyes
    stroke(white);
    strokeWeight(6);
    point(-5,-33);
    point(5,-33);
    
    // draw hands and legs
    stroke(black);
    line(-20, -15, -20, 0);
    line(20, -15, 20, 0);
    line(-5, 10, 5, 10);
    
    // draw hair and mustache
    strokeWeight(1);
    line(0,-40, 0, -50);
    line(0,-27, -20, -30);
    line(0,-27, 20, -30);    
    
    popMatrix();
}