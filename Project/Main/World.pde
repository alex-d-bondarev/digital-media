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
  Sound sound;
  Ufo ufo;
  Collect collectGame;  
  
  //================================================================================
  // constructor
  //================================================================================
  World(int act) {
    currentAct = act;
    reset();
  }
  
  
  //================================================================================
  // methods
  //================================================================================
  
  //--------------------------------------------------------------------------------
  // Effect: reset world to initial state for starting new world 
  //--------------------------------------------------------------------------------
  void reset() {
    // initialize objects
    sound = new Sound();
    aln = new Alien(this, sound);
    bkg = new Background();
    frg = new Foreground();
    game = new LogicGame(sound);
    info = new Instructions(game, this, sound);
    landar = new Landing(red, UFOStroke);
    ufo = new Ufo(this, aln, landar, sound);
    collectGame = new Collect(this, ufo, sound);
    
    ufo.reset();
  }
  
  
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
      case 6: // instructions for guess game
        info.displayGuessInstructions();
        break;
      case 7: // play logic game
        game.play();
        break;
      case 8: // regular ending
        info.end(); 
        break;
      case 9: // great pilot ending
        info.secretPilot();
        break;
      case 10: // shame ending
        info.secretShame();
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
    } else if (currentAct == 8) {
      sound.stop();
      exit();
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
        info.handleMouseEvents();
        collectGame.reset();
        ufo.reset();
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
        currentAct = 6;
        game.reset(this,info);
        sound.stop();
        break;
      case 9:
        currentAct = 1;
        sound.stop();
        reset();
        break;
      case 10:
        currentAct = 6;
        sound.stop();
        break;
      default:
        info.handleMouseEvents();
        break;
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: go to the next act
  //--------------------------------------------------------------------------------
  void nextAct() {
    if(currentAct == 6) {
      game.reset(this, info);
    }
    currentAct++;
  }
}