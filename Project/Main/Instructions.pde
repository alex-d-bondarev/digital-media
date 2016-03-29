class Instructions{
  //================================================================================
  // properties
  //================================================================================  
  int btnHeight = 40;
  int btnWidth = 100;
  int continueX = 800;
  int continueY = 520;
  int noX = 325;
  int noY = 25;
  int textHeight = 50;
  int textLeftEdge = 50;
  
  // difficulty buttons' coordinates
  int downX = 722;
  int downY;
  int upY = 430;
  
  // act 1 title
  String title = "Alien & Kozak";
  
  // act 2 instructions
  String act2 = "Hello, you were flying around, when you suddenly realized that you are low on energy. Fortunately you see some meteors passing buy. Try to collect meteors with little (white) and much (green) energy. Avoid other meteors as they drain energy from you. Yellow meteors drain little of energy, red - much. To control your spaceship - use arrow keys on blackboard or mouse clicks. (I recommend keyboard). You can see how much energy is left in left top corner. Click anywhere on screen to continue.";
  
  // act 5 instructions
  String introduction = "You see an alien. Why are you not shocked? He is definitely shocked. Did you see his smile? OK, somehow you understand him. He said that he collects energy from rocks and that he needs you help. Help him to find energy efficient combination of rocks";
  String instruction1 = "You will play a logical minigame, where you need to guess the correct sequence.";
  String instruction2;
  String instruction3 = "Press the following buttons to select optioin";
  String instruction4 = "Press the following button to confirm guess";
  String instruction5 = "Select game difficulty. \"1\" for easiest and \"4\" for hardest. \n\"3\" is suggested option.";
  
  // text font = Kokonor-24
  PFont f;
  PImage picture;
  
  // variables for classes
  LogicGame game;
  World model;
  
  //================================================================================
  // constructor
  //================================================================================
  Instructions(LogicGame g, World world) {
    game = g;
    model = world;
    
    // more coordinates
    downY = upY + 20 + game.guessBoxSize;
    
    // set font
    f = loadFont("Kokonor-24.vlw");
    textFont(f);
  }
  
  //================================================================================
  // methods
  //================================================================================
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#1 - displays start menu
  //--------------------------------------------------------------------------------
  void displayStart(){
    picture = loadImage("pics/Title.png");
    image(picture, 250, 112, 500, 375);
    showText(350, 255, 290, 150, title);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#2 - displays short information
  //--------------------------------------------------------------------------------
  void spaceInfo() {
    showTextWindow();
    showText(50, 150, 900, 500, act2);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#4 - displays start menu
  //--------------------------------------------------------------------------------
  void landing(){
    picture = loadImage("pics/Title.png");
    image(picture, 250, 112, 500, 375);
    showText(350, 255, 290, 150, title);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#5 - displays instructions about guess game
  //--------------------------------------------------------------------------------
  void displayGuessInstructions() {
    showTextWindow();
    
    // introduction
    showText(textLeftEdge, 30, width - 100, textHeight*3, introduction);
    showText(textLeftEdge, 170, width - 100, textHeight, instruction1);
    
    // Instructions
    instruction2 = "You will have " + game.maxTries + " tries. However the will be a hint that will show number of correct guesses, each time.\nYou can win \"4\" only with the help of luck.";
    showText(textLeftEdge, 240, width - 100, textHeight, instruction2);
    
    //----------------------------------------
    // Controlls 
    
    // Up and down Buttons
    showText(textLeftEdge, 310, 280, textHeight*2, instruction3);
    game.displayUpBtn(340,340);
    game.displayDownBtn(370,340);
    
    // confirm guess
    showText(480, 310, 280, textHeight*2, instruction4);
    game.displayConfirmBtn(800, 320);
    
    //----------------------------------------
    // Difficulty
    showText(textLeftEdge, 430, width - 100, textHeight*3, instruction5);
    
    // controls
    game.displayUpBtn(downX, upY);
    game.guessBox(720, 445, str(guess.length));
    game.displayDownBtn(downX, downY);
    
    //----------------------------------------
    // finish instructions
    continueBtn(continueX, continueY);
    noBtn(noX, noY);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: shows text window to make text more readable
  //--------------------------------------------------------------------------------
  void showTextWindow(){
    background(textBackground);
    noFill();
    stroke(textColor);
    strokeWeight(10);
    
    // draw screen border
    rectMode(CENTER);
    rect(width/2, height/2, width, height, 10);
    
    // reset stroke weight
    strokeWeight(5);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: show given text in given coordinates, of given size, with one preset style
  //--------------------------------------------------------------------------------
  void showText(float x, float y, float tWidth, float tHeight, String text){
    // change text color to dark brown and setup style
    fill(textColor);
    rectMode(CORNER);
    
    if(world.currentAct == 1) {
      textSize(46);
    } else { textSize(24); }
    text(text, x, y, tWidth, tHeight);
  }
  
  
  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: draw continue button in given coordinates
  //--------------------------------------------------------------------------------
  void continueBtn(float x, float y){
    // change fill color if mouse is over
    if(inButton(x, y)) {
      fill(white);
    } else { fill(250, 230, 194); }
    
    // set rect style and draw it
    stroke(textColor);
    strokeWeight(5);
    rectMode(CORNER);
    rect(x, y, btnWidth, btnHeight);
    
    // button text
    showText(x+5, y+7, btnWidth, btnHeight, "Continue");
  }
  
  
  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: draw "No!" (no help) button in given coordinates
  //--------------------------------------------------------------------------------
  void noBtn(float x, float y){
    // show only, when mouse is over
    if(inButton(x,y)) {
      stroke(textColor);
    } else { noStroke(); }
    
    // set rect style and draw it
    noFill();
    strokeWeight(5);
    rectMode(CORNER);
    rect(x, y, btnWidth, btnHeight);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events in this act
  //--------------------------------------------------------------------------------
  void handleMouseEvents(){
     if(world.currentAct == 6){
        act5MouseEvents();
      } else {
        background(white);
         model.nextAct();
      }
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events in act#5
  //--------------------------------------------------------------------------------
  void act5MouseEvents(){
     if(inButton(continueX, continueY)){ // continue button
        model.nextAct();
      } else if(inButton(noX, noY)) {
        model.currentAct = 10;
      } else if(game.givenBtnIsSelected(downX, upY)) {
        game.increaseDifficulty();
      } else if (game.givenBtnIsSelected(downX, downY)) {
        game.decreaseDifficulty();
      }
  }
  
  
  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // RETURN: true button is in given coordinates and mouse is over, else - false 
  //--------------------------------------------------------------------------------
  boolean inButton(float x, float y){
    if(mouseX >= x && mouseX <= x + btnWidth 
    && mouseY >= y && mouseY <= y + btnHeight) {
      return true; 
    } else { return false; }
  }
}