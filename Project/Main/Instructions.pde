class Instructions{
  //================================================================================
  // properties
  //================================================================================  
  int btnHeight = 40;
  int btnWidth = 100;
  int continueX = 800;
  int continueY = 520;
  int textHeight = 50;
  int textLeftEdge = 50;
  
  // difficulty buttons' coordinates
  int downX = 722;
  int downY;
  int upY = 430;
  
  // act 5 instructions
  String introduction = "You see an alien. Why aren't you shocked? He is definitely shocked. Did you see his smile? \nOK, somehow you understand him. He said that he collects energy from rocks and that he needs you help. Help him to find energy efficient combination of rocks";
  String instruction1 = "You will play a logical minigame, where you need to guess the correct sequence.";
  String instruction2;
  String instruction3 = "Press the following buttons to select optioin";
  String instruction4 = "Press the following button to confirm guess";
  String instruction5 = "Select game difficulty. \"1\" for easiest and \"4\" for hardest. \n\"3\" is suggested option.";
  
  // text font = Kokonor-24
  PFont f;
  
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
  // EFFECT: act#5 - displays instructions about guess game
  //--------------------------------------------------------------------------------
  void displayGuessInstructions() {
    // TODO: remove this in project
    background(255);
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
    textSize(24);
    text(text, x, y, tWidth, tHeight);
  }
  
  
  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: draw continue button in given coordinates
  //--------------------------------------------------------------------------------
  void continueBtn(float x, float y){
    // change fill color if mouse is over
    if(doContinue()) {
      fill(white);
    } else { fill(250, 230, 194); }
    
    // set rect style and draw it
    stroke(190, 150, 100);
    strokeWeight(5);
    rectMode(CORNER);
    rect(x, y, btnWidth, btnHeight);
    
    // button text
    showText(x+5, y+7, btnWidth, btnHeight, "Continue");
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events in this act
  //--------------------------------------------------------------------------------
  void handleMouseEvents(){
     if(doContinue()){ // continue button
        model.nextAct();
      } else if(game.givenBtnIsSelected(downX, upY)) {
        game.increaseDifficulty();
      } else if (game.givenBtnIsSelected(downX, downY)) {
        game.decreaseDifficulty();
      }
  }
  
  
  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // RETURN: true buton is in given coordinates and mouse is over, else - false 
  //--------------------------------------------------------------------------------
  boolean doContinue(){
    if(mouseX >= continueX && mouseX <= continueX + btnWidth 
    && mouseY >= continueY && mouseY <= continueY + btnHeight) {
      return true; 
    } else { return false; }
  }
}