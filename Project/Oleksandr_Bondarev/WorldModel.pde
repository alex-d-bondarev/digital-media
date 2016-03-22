class WorldModel{
  //================================================================================
  // properties
  //================================================================================
  int currentAct;
  
  Instructions info;
  LogicGame game;
  Alien aln;
  Background bkg;
  Foreground frg;
  Landingareas landar;
  Ufo ufo;
  
  
  //================================================================================
  // constructor
  //================================================================================
  WorldModel(int act) {
    currentAct = act;
    
    // initialize objects
    aln = new Alien();
    bkg = new Background();
    frg = new Foreground();
    game = new LogicGame();
    info = new Instructions(game, this);
    landar = new Landingareas(red, UFOStroke);
    ufo = new Ufo(aln, landar);
  }
  
  
  //================================================================================
  // methods
  //================================================================================
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: displays data according to current act
  //--------------------------------------------------------------------------------
  void display() {
    switch(currentAct){
      case 1: //introduction
        nextAct();
        break;
      case 2: // catch meteors
        nextAct();
        break;
      case 3: // landing information
        nextAct();
        break;
      case 4: // landing
        bkg.display();
        aln.display();
        landar.display();
        ufo.display();
        aln.displayTall();
        frg.display();
        aln.displayCloser();
        break;
      case 5: 
        info.displayGuessInstructions();
        break;
      case 6:
        game.play();
        break;
      case 7:
        projectStub(); // in project there will be an alien flying away
        break;
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (pressed)
  //--------------------------------------------------------------------------------
  void handleKeyPressed(){
    if (currentAct == 4) {
      ufo.handleKeyPressed();
      landar.handleKeyPressed();
    }
  } 
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (reliesed)
  //--------------------------------------------------------------------------------
  void handleKeyReleased(){
    if (currentAct == 4) {
      ufo.handleKeyReleased();
    }
  } 
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle mouse clicks depending on current act
  //--------------------------------------------------------------------------------
  void handleMouseEvents() {
    switch(currentAct){
      case 4:
        ufo.handleMousePressed();
        break;
      case 5:
        info.handleMouseEvents();
        break;
      case 6:
        game.handleMouseEvents();
        break;
      case 7:
        currentAct = 5; // TODO: this is temp stub
        break;
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
}