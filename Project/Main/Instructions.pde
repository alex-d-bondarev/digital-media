class Instructions{
  //================================================================================
  // properties
  //================================================================================  
  int btnHeight = 40;
  int btnWidth = 100;
  int continueX = 800;
  int continueY = 520;
  int noX = 555;
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
  
  // act 4 instructions
  String act4 = "Seems that you did not succeed. Don't worry. I am sure you can find some rocks on that blue planet and get energy from them. Just remember about gravity, so you will need to find good landing spot. Press \"L\" button to see all landing spots and to choose the best for you. You can also press \"P\" button if you want to relax. If you land in wrong place - just press \"space\" button. Other controls are same as before. Click anywhere on screen to continue.";
  
  // act 6 instructions
  String introduction = "Now you are a Kozak. You see an alien. Why are you not shocked? He is definitely shocked. Did you see his smile? OK, somehow you understand him. He told that he collects energy from rocks and that he needs your help. Find energy efficient combination of rocks!";
  String instruction1 = "You will play a logical minigame, where you need to guess the correct sequence.";
  String instruction2;
  String instruction3 = "Press the following buttons to select optioin";
  String instruction4 = "Press the following button to confirm guess";
  String instruction5 = "Select game difficulty. \"1\" for easiest and \"4\" for hardest. \n\"3\" is suggested option.";
  
  // act 9 instructions
  String act9 = "Wow! You are a great pilot! Somehow you could collect enough energy to fly home. Who knows what could happen if you failed... \nTo restart the game - please press mouse button.";
  int act9X = 25;
  int act9Y = 25;
  int act9Width = 500;
  int act9Height = 150;
  
  // act 10 instructions
  String act10 = "What did just happen? It is not you! \nI feel that you have to help him. \nPress mouse button and try again.";
  int act10X = 25;
  int act10Y = 25;
  int act10Width = 370;
  int act10Height = 120;
  
  // text font = Kokonor-24
  PFont f;
  PImage picture;
  Sound sound;
  
  // variables for classes
  LogicGame game;
  World model;
  
  //================================================================================
  // constructor
  //================================================================================
  Instructions(LogicGame g, World world, Sound music) {
    game = g;
    model = world;
    sound = music;
    
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
    background(space);
    picture = loadImage("pics/Title.png");
    image(picture, 250, 112, 500, 375);
    showText(350, 255, 290, 150, title);
    sound.play("intro");
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
    showTextWindow();
    showText(50, 150, 900, 500, act4);
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
    game.guessBox(710, 445, str(guess.length));
    game.displayDownBtn(downX, downY);
    
    //----------------------------------------
    // finish instructions
    continueBtn(continueX, continueY);
    noBtn(noX, noY);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#8 - game ends here
  //--------------------------------------------------------------------------------
  void end(){
    // clear background
    showTextWindow();
    
    // prepare text
    String gameResult;
    if(game.won){
      gameResult = "Congratulations! You have won the game! Alien seems to be happy because he has enough energy to fly home. He thanks you and flies away. Gosh, what a day!";
      sound.play("win");
    } else {
      gameResult = "It a pity, but you made a wrong combination. Seems that an alien will have to try to combine rocks on his own.";
      sound.play("lost");
    }
    String finalText = "To start from the start screen - please press mouse button. To start logic game again - please press any keyboard button.";
    
    // show text
    showText(100, 100, 800, 400, gameResult);
    showText(100, 400, 800, 400, finalText);
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#9 - secret ending #1 (great pilot)
  //--------------------------------------------------------------------------------
  void secretPilot() {
    picture = loadImage("pics/pilot.jpg");
    noStroke();
    image(picture, 0, 0, width, height);
    fill(black);
    rect(act9X, act9Y, act9Width, act9Height);
    fill(white);
    textSize(24);
    text(act9, act9X, act9Y, act9Width, act9Height);
    sound.play("pilot");
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: act#10 - secret ending #2 (shame)
  //--------------------------------------------------------------------------------
  void secretShame() {
    noStroke();
    picture = loadImage("pics/sad.jpg");
    image(picture, 0, 0, width, height);
    fill(black);
    rect(act10X, act10Y, act10Width, act10Height);
    fill(white);
    text(act10, act10X, act10Y, act10Width, act10Height);
    sound.play("sad");
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
    textAlign(LEFT);
    
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
        sound.stop();
        sound.play("click");
        model.nextAct();
      }
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events in act#5
  //--------------------------------------------------------------------------------
  void act5MouseEvents(){
     if(inButton(continueX, continueY)){ // continue button
        model.nextAct();
        sound.play("click");
      } else if(inButton(noX, noY)) {
        model.currentAct = 10;
        sound.play("click");
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