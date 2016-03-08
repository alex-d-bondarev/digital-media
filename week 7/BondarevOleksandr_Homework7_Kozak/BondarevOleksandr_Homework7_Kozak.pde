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
  landar.hide();
  posX = 100;
  posY = 20;
  horizontalSpeed = 0;
  verticalSpeed = 0;
  moveRight = false;
  moveLeft = false;
  moveUp = false;
  landed = false;
  paused = false;
  niceLanding = false;
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