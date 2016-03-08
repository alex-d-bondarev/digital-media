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
color black = color(0);
color white = color(255);
color grass = color(70,  100, 40);
color orange = color(245,170,0);
color red = color(210,50,50);
color road = color(200, 165, 130);
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
boolean moveLeft;
boolean moveRight;
boolean moveUp;
int pointX = 700;
int pointY = 210;
String message;
boolean landed;
boolean niceLanding;

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
// Declare classes
//----------------------------------------
Alien aln;
Background bkg;
Foreground frg;
Landingareas landar;
Ufo ufo;

//----------------------------------------
void setup(){
  // initialize objects
  aln = new Alien();
  bkg = new Background(black, grass, white);
  frg = new Foreground(black, grass, red, white);
  landar = new Landingareas(red, UFOStroke);
  ufo = new Ufo();
  
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
  landar.display();
  ufo.display();
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
  aln.setBeforeWait(0);
  posX = 100;
  posY = 20;
  horizontalSpeed = 0;
  verticalSpeed = 0;
  moveRight = false;
  moveLeft = false;
  moveUp = false;
  landed = false;
  landar.hide();
  paused = false;
  niceLanding = false;
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
    landar.hide();
    
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
   landar.opposite();
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