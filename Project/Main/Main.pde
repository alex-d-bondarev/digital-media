import ddf.minim.*;

//=====================================================//
//================= Global Variables ==================//
//=====================================================//

//--------------------------------------------------------------------------------
// Global Colors
//--------------------------------------------------------------------------------
color black = color(0);
color grass = color(70,  100, 40);
color orange = color(245,170,0);
color red = color(210,50,50);
color road = color(200, 165, 130);
color space = color(28, 39, 54);
color textBackground = color(250, 230, 194);
color textColor = color(100, 60, 10);
color UFOStroke = color(55,240,240);
color white = color(255);

//--------------------------------------------------------------------------------
// Global coordinates
//--------------------------------------------------------------------------------
// UFO
int pointX = 700;
int pointY = 210;
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

//--------------------------------------------------------------------------------
// Other global variables
//--------------------------------------------------------------------------------
int firstAct = 1; 
int[] guess = {0, 0, 0};
Minim minim;
World world;

//=====================================================//
//================ Main functionality =================//
//=====================================================//
void setup(){
  //window
  size(1000,600);
  background(255);
  
  minim = new Minim(this);
  
  // init WorldModel
  world = new World(firstAct);
} 

//----------------------------------------
void draw(){
  world.display();
}


//=====================================================//
//================ Keyboard and Mouse =================//
//=====================================================//

//--------------------------------------------------------------------------------
// EFFECT: Handle arrow keys (pressed)
//--------------------------------------------------------------------------------
void keyPressed(){
  world.handleKeyPressed();
} 

//--------------------------------------------------------------------------------
// EFFECT: Handle arrow keys (reliesed)
//--------------------------------------------------------------------------------
void keyReleased(){
  world.handleKeyReleased();
} 

//--------------------------------------------------------------------------------
// EFFECT: Handle mouse clicks
//--------------------------------------------------------------------------------
void mousePressed () {
  world.handleMouseEvents();
}