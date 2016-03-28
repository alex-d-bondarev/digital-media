class Instructions{
  //================================================================================
  // properties
  //================================================================================
  // Kokonor-24
  color textBackground = color(250, 230, 194);
  color textColor = color(100, 60, 10);
  
  int btnHeight = 40;
  int btnWidth = 100;
  int continueX = 720;
  int continueY = 450;
  int shift;
  
  String displayText;
  LogicGame game;
  World model;
  
  String instruction1= "This is a logical minigame, where you need to guess the correct sequence of ingredients.";
  PFont f;
  
  //================================================================================
  // constructor
  //================================================================================
  Instructions(LogicGame g, World world) {
    game = g;
    model = world;
    
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
    
    // Text line with introduction to the game
    shift = 0;
    //displayText = "This is a logical minigame, where you need to guess the correct sequence of ingredients.";
    //text(displayText, width/5 + 5, height/5, width/1.5 - 25, height + 2*shift);
    showText(width/5 + 5, height/5, width/1.5 - 25, height + 2*shift, instruction1);
    
    // Instructions
    shift += 60;
    displayText = "You will have " + game.maxTries + " tries. However the will be a hint that will show number of correct guesses, each time.";
    text(displayText, width/5 + 5, height/5 + shift, width/1.5 - 25, height + 2*shift);
    
    //----------------------------------------
    // Controlls 
    shift += 60;
    
    // Up and down Buttons
    displayText = "Press the following buttons to select optioin";
    text(displayText, width/5 + 5, height/5 + shift, width/4.5 - 25, height + 2*shift);
    game.displayUpBtn(400,250);
    game.displayDownBtn(430,250);
    fill(100, 60, 10);
    
    // confirm guess
    displayText = "Press the following button to confirm guess";
    text(displayText, 480, height/5 + shift, 220, height + 2*shift);
    game.displayConfirmBtn(725, 230);
    fill(100, 60, 10);
    
    //----------------------------------------
    // Difficulty
    shift += 80;
    displayText = "Select game difficulty. \"1\" for easiest and \"4\" for hardest. \n\"3\" is suggested option.";
    displayText = displayText + "\nYou can win \"4\" only with the help of luck.";
    text(displayText, width/5 + 5, height/5 + shift, width/2, height + 2*shift);
    
    // controls
    game.displayUpBtn(722, height/5 + shift-15);
    game.guessBox(720, height/5 + shift, str(guess.length));
    game.displayDownBtn(722, game.guessBoxSize + height/5 + shift + 5);
    
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
    // change text color to dark brown and setup style
    fill(textColor);
    rectMode(CORNER);
    textSize(24);
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
      fill(255);
    } else { fill(250, 230, 194); }
    
    // set rect style and draw it
    stroke(190, 150, 100);
    strokeWeight(5);
    rectMode(CORNER);
    rect(x, y, btnWidth, btnHeight);
    
    // change text color to dark brown and setup style
    fill(100, 60, 10);
    text("Continue->", x+5, y+10, btnWidth, btnHeight);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events in this act
  //--------------------------------------------------------------------------------
  void handleMouseEvents(){
     if(doContinue()){ // continue button
        model.nextAct();
      } else if(game.givenBtnIsSelected(722, height/5 + shift-15)) {
        game.increaseDifficulty();
      } else if (game.givenBtnIsSelected(722, game.guessBoxSize + height/5 + shift + 5)) {
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