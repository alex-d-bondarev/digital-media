//------------------------------------------------------//
//----------------- Global  Variables ------------------//
//------------------------------------------------------//

//--------------------------------------------------------------------------------
// Global Colors
//--------------------------------------------------------------------------------
color black = color(0);
color white = color(255);
color grass = color(70,  100, 40);
color orange = color(245,170,0);
color red = color(210,50,50);
color road = color(200, 165, 130);
color UFOStroke = color(55,240,240);

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
int firstAct = 5; // There will be acts 1-7, but in final project
int[] guess = {0, 0, 0};

//--------------------------------------------------------------------------------
// Declare classes
//--------------------------------------------------------------------------------
Alien aln;
Background bkg;
Foreground frg;
Landingareas landar;
Ufo ufo;
WorldModel world;


//=====================================================//
//================ Main functionality =================//
//=====================================================//
void setup(){
  //window
  size(1000,600);
  background(255);
  frameRate(60);
  
  // initialize objects
  aln = new Alien();
  bkg = new Background();
  frg = new Foreground();
  landar = new Landingareas(red, UFOStroke);
  ufo = new Ufo(aln, landar);
} 


//----------------------------------------
void draw(){
  bkg.display();
  aln.display();
  landar.display();
  ufo.display();
  frg.display();
}


//=====================================================//
//================ Keyboard and Mouse =================//
//=====================================================//

//--------------------------------------------------------------------------------
// EFFECT: Handle arrow keys (pressed)
//--------------------------------------------------------------------------------
void keyPressed(){
  ufo.handleKeyPressed();
  landar.handleKeyPressed();
} 


//--------------------------------------------------------------------------------
// EFFECT: Handle arrow keys (reliesed)
//--------------------------------------------------------------------------------
void keyReleased(){
 ufo.handleKeyReleased();
} 

//--------------------------------------------------------------------------------
// EFFECT: Handle mouse clicks
//--------------------------------------------------------------------------------
void mousePressed () {
  ufo.handleMousePressed();
}