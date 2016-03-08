class Alien{
  
  
  //----------------------------------------
  //----------------------------------------
  // properties
  color alien = color(180,170,140);
  color alienCloth = color(125,155,125);
  color alienNeck = color(215,240,240);
  AlienState alienState;
  float alienX;
  float alienY;
  float alienVelocity = 2;
  long beforeWait;
  long timeToWait = 1000;
    
  //----------------------------------------
  //----------------------------------------
  // constructor
  Alien() {
    
  }
  
  //----------------------------------------
  //----------------------------------------
  // methods
  
  //----------------------------------------
  // Effect: resets alien state
  //----------------------------------------
  void reset() {
    alienState = AlienState.INUFO;
  }
    
    
  //----------------------------------------
  // Effect: draws and moves small alien
  //----------------------------------------
  void inBackground() { 
    
    // right after the landing
    if(alienState == AlienState.LANDED) {
        smallAlien(alienX, alienY);
        
        // give alien some time to understand what is going on (wait timeToWait)
        if (beforeWait == 0) { beforeWait = millis(); }
        if (millis() - beforeWait > timeToWait) { aln.nextState(); }
        
    // start mooving to field entrance
    } else if ( alienState == AlienState.TOHILLENTRANCE ){
        smallAlien(alienX, alienY);
        moveAlienToCoordinate(750, 250);
        
    // start mooving to first point
    } else if ( alienState == AlienState.TOFIRSTPOINT ){
        smallAlien(alienX, alienY);
        moveAlienToCoordinate(735, 330);
        
    // start mooving to second point
    } else if ( alienState == AlienState.TOSECONDPOINT ) {
        smallAlien(alienX, alienY);
        moveAlienToCoordinate(840, 330);
        
    // start mooving out of the sight
    } else if ( alienState == AlienState.BETWEENHILLS ) {
        smallAlien(alienX, alienY);
        moveAlienToCoordinate(910, 570);
    }
  }
  
  
  //----------------------------------------
  // GIVEN: x and y coordinates
  // EFFECT: moves alien to given coordinates
  //         changes status to next when coming
  //----------------------------------------
  void moveAlienToCoordinate(int trgtX, int trgtY) { 
    if (alienX != trgtX || alienY != trgtY) {          
      alienX = moveToCoordinate(alienX,trgtX);
      alienY = moveToCoordinate(alienY,trgtY);
    } else { aln.nextState(); }
  }
  
  
  //----------------------------------------
  // GIVEN: current and target coordinates
  // EFFECT: makes 1 step towards given 
  //         coordinates. Step is taken 
  //         according to aliens' velocity
  //----------------------------------------
  float moveToCoordinate(float cur, float trgt) {
    if (cur > trgt + alienVelocity) { return cur - alienVelocity; } 
    else if (cur < trgt - alienVelocity) { return cur + alienVelocity; }
    else { return trgt; }
  }
  
  
  //----------------------------------------
  // EFFECT: Change state of the alien 
  //         to a next state
  //----------------------------------------
  void nextState() {
    switch(alienState){
      case INUFO: 
        alienState = AlienState.LANDED;
        break;
      case LANDED: 
        alienState = AlienState.TOHILLENTRANCE;
        break;
      case TOHILLENTRANCE: 
        alienState = AlienState.TOFIRSTPOINT;
        break;
      case TOFIRSTPOINT: 
        alienState = AlienState.TOSECONDPOINT;
        break;
      case TOSECONDPOINT: 
        alienState = AlienState.BETWEENHILLS;
        break;
      case BETWEENHILLS: 
        alienState = AlienState.TOHILLTOP;
        break;
      case TOHILLTOP: 
        alienState = AlienState.TOKOZAK;
        break;
      case TOKOZAK: 
        alienState = AlienState.NEARKOZAK;
      case NEARKOZAK:
        break;
    }
  }
  
    
  //----------------------------------------
  // GIVEN: x and y coordinates
  // EFFECT: draws a small alien in given
  //         coordinates
  //----------------------------------------
  void smallAlien(float aPosX, float aPosY) {
    
      // push picture to given coordinates
      pushMatrix();
      translate(aPosX, aPosY);
      
      // draw a small alien           
      fill(alienCloth);
      ellipse(0,-15, 35, 50);
      fill(alien);
      arc(0,-15, 35, 50, 1.10*PI, 1.90*PI, CHORD);
      fill(alienNeck);
      ellipse(0,-22, 40,5);
      
      // draw eyes
      stroke(white);
      strokeWeight(6);
      point(-5,-33);
      point(5,-33);
      
      // draw hands and legs
      stroke(black);
      line(-20, -15, -20, 0);
      line(20, -15, 20, 0);
      line(-5, 10, 5, 10);
      
      // draw hair and mustache
      strokeWeight(1);
      line(0,-40, 0, -50);
      line(0,-27, -20, -30);
      line(0,-27, 20, -30);    
      
      popMatrix();
  }
  
  
  //----------------------------------------
  // GIVEN: x or y coordinate
  // EFFECT: set new coordinate
  //----------------------------------------
  void setX (float x) { alienX = x; }
  void setY (float y) { alienY = y; }
  
  void setBeforeWait(long newVal) { long beforeWait = newVal;}
}