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
// for UFO controls
//--------------------------------------------------------------------------------
float distance;
float horizontalSpeed;
float verticalSpeed;

// for drawing
int pointX = 700;
int pointY = 210;

//--------------------------------------------------------------------------------
// Landing coordinates
//--------------------------------------------------------------------------------
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
// Declare classes
//--------------------------------------------------------------------------------
Alien aln;
Background bkg;
Foreground frg;
Landingareas landar;
Ufo ufo;


//=====================================================//
//================ Main functionality =================//
//=====================================================//
void setup(){
  // initialize objects
  aln = new Alien();
  bkg = new Background();
  frg = new Foreground();
  landar = new Landingareas(red, UFOStroke);
  ufo = new Ufo();
  
  //window
  size(1000,600);
  background(255);
  frameRate(60);
  
  // setup ufo
  ufo.init();
} 


//----------------------------------------
void draw(){
  bkg.display();
  aln.inBackground();
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