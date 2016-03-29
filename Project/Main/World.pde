class World{
  //================================================================================
  // properties
  //================================================================================
  int currentAct;
  
  Instructions info;
  LogicGame game;
  Alien aln;
  Background bkg;
  Foreground frg;
  Landing landar;
  Ufo ufo;
  Collect collectGame;  
  
  //================================================================================
  // constructor
  //================================================================================
  World(int act) {
    currentAct = act;
    
    // initialize objects
    aln = new Alien(this);
    bkg = new Background();
    frg = new Foreground();
    game = new LogicGame();
    info = new Instructions(game, this);
    landar = new Landing(red, UFOStroke);
    ufo = new Ufo(this, aln, landar);
    collectGame = new Collect(this, ufo);
    
    ufo.reset();
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
        info.displayStart();
        break;
      case 2: // ufo in space introduction
        info.spaceInfo();
        break;
      case 3: // catch meteors
        collectGame.display();
        break;
      case 4: // landing information
        info.landing();
        break;
      case 5: // landing
        bkg.display();
        aln.display();
        landar.display();
        ufo.display();
        aln.displayTall();
        frg.display();
        aln.displayCloser();
        break;
      case 6: 
        info.displayGuessInstructions();
        break;
      case 7:
        game.play();
        break;
      case 8: // regular ending
        projectStub(); 
        break;
      case 9: // great pilot ending
        background(0);
        fill(255);
        text("You are great pilot", 20, 20);
        break;
      case 10: // shame ending
        background(0);
        fill(255);
        text("You did not help him. Shame on you.", 20, 20);
        break;
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (pressed)
  //--------------------------------------------------------------------------------
  void handleKeyPressed(){
    if (currentAct == 3) {
      ufo.handleKeyPressed();
    } else if (currentAct == 5) {
      ufo.handleKeyPressed();
      landar.handleKeyPressed();
    }
  } 
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (reliesed)
  //--------------------------------------------------------------------------------
  void handleKeyReleased(){
    if (currentAct == 3 || currentAct == 5) {
      ufo.handleKeyReleased();
    }
  } 
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle mouse clicks depending on current act
  //--------------------------------------------------------------------------------
  void handleMouseEvents() {
    switch(currentAct){
      case 1:
      case 2:
      case 4:
      case 6:
        info.handleMouseEvents();
        break;
      case 3:
        ufo.handleMousePressed();
        break;
      case 5:
        ufo.handleMousePressed();
        break;
      case 7:
        game.handleMouseEvents();
        break;
      case 8:
        currentAct = 5; // TODO: this is temp stub
        break;
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: go to the next act
  //--------------------------------------------------------------------------------
  void nextAct() {
    if(currentAct == 6) {
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