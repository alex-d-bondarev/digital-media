class WorldModel{
  //================================================================================
  // properties
  //================================================================================
  int currentAct;
  
  Instructions info;
  LogicGame game;
  
  
  //================================================================================
  // constructor
  //================================================================================
  WorldModel(int act) {
    currentAct = act;
    game = new LogicGame();
    info = new Instructions(game, this);
  }
  
  
  //================================================================================
  // methods
  //================================================================================
  
  //--------------------------------------------------------------------------------
  // EFFECT: displays data according to current act
  //--------------------------------------------------------------------------------
  void display() {
    if (currentAct == 5) {
      info.displayGuessInstructions();
    } else if (currentAct == 6) {
      game.play();
    } else if (currentAct == 7) { 
      projectStub(); // in project there will be an alien flying away
    }
  }
  
  //--------------------------------------------------------------------------------
  // EFFECT: temporary stub
  //--------------------------------------------------------------------------------
  void projectStub(){
    // clear background
    background(255);
    
    // prepare text
    String gameResult;
    if(game.won){
      gameResult = "Congratulations! You have won the game!";
    } else {
      gameResult = "It a pitty, but you have lost the game :(";
    }
    String finalText1 = "This is the end of homework. It covers Act#5 and Act#6 from initial proposal. ";
    String finalText2 = "Final project will have more options. Please click anywhere on the screen to start over.";
    
    // show text
    fill(0);
    strokeWeight(5);
    textSize(20);
    text(gameResult, 100, 100, 800, 400);
    text(finalText1 + finalText2, 100, 400, 800, 400);
  }
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle mouse clicks depending on current act
  //--------------------------------------------------------------------------------
  void handleMouseEvents() {
    
    if (currentAct == 5) {
      info.handleMouseEvents();
      
    } else if (currentAct == 6){
      game.handleMouseEvents();
      
    } else {
      currentAct = 5;
    }
  }
  
  //--------------------------------------------------------------------------------
  // EFFECT: go to the next act
  //--------------------------------------------------------------------------------
  void nextAct() {
    if(currentAct == 5) {
      game.reset(this);
    }
    currentAct++;
  }
}