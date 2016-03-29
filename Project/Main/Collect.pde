class Collect{
  //================================================================================
  // properties
  //================================================================================
  long gameTime = 22000;
  long gameStartTime = 0;
  long startPeriod;
  int energy;
  int numDrops;
  Meteor[] drops;
  World world;
  Sound sound;
  Ufo ufo;
  
  //================================================================================
  // constructor
  //================================================================================
  Collect(World model, Ufo inUfo, Sound music) {
    world = model;
    ufo = inUfo;
    sound = music;
    reset();
    size(1000, 600);
    background(space);
    smooth();
    noStroke();
    startMeteors();
  }
  
  //================================================================================
  // methods
  //================================================================================
  
  //--------------------------------------------------------------------------------
  // Effect: reset critical variables to initial point 
  //--------------------------------------------------------------------------------
  void reset(){
    gameStartTime = millis();
    startPeriod = 500;
    drops = new Meteor[10];
    numDrops = 0;
    ufo.reset();
    for(int i = 0; i < drops.length; i++) {
      drops[i] = new Meteor();
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: display all data that is needed for this game
  //--------------------------------------------------------------------------------
  void display() {
    energy = ufo.energy;
    
    transparentBackground();
    endAct();
    displayEnergy();   
    ufo.display();
    intersect();
    fallMeteors();    
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: makes visible "tails" for moving objects
  //--------------------------------------------------------------------------------
  void transparentBackground() {
    fill(space, 30);
    rect(0, 0, width, height);
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: analyze game status and check if game is over
  //--------------------------------------------------------------------------------
  void endAct() {
    textSize(15);
    if (energy <= 0) {
      world.nextAct(); 
      ufo.reset();
    } else if (millis() - gameStartTime > gameTime) { 
      if(energy > 0){
        world.currentAct = 9;
      } else {
        world.nextAct(); 
        ufo.reset();
      }
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: show energy bar in top left corner of the screen
  //--------------------------------------------------------------------------------
  void displayEnergy(){
    // empty rectangle
    noFill();
    stroke(orange);
    strokeWeight(2);
    rect(20,20,200,20);
    // energy left
    fill(orange);
    rect(20, 20, energy*3, 20);
    // energy number
    text(energy, 120, 35);
    noStroke();
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: analyze position of UFO and all meteors. 
  //         if UFO intersects with one of the meteors -> meteor changes position
  //                                                      UFO's energy is updated
  //--------------------------------------------------------------------------------
  void intersect(){
    float x1 = ufo.posX;
    float y1 = ufo.posY;
    float d1 = ufo.ufoRange;
    float x2, y2, d2;
    int q;
    for(int i = 0; i < drops.length; i++){
      x2 = drops[i].getX();
      y2 = drops[i].getY();
      d2 = drops[i].getSize();
      q  = drops[i].getQuality();
      if(dist(x1, y1, x2, y2) < (d1/2 + d2/2)) {
        switch(q){
          case 0:
            ufo.energy += 2;
            break;
          case 1:
            ufo.energy += 1;
            break;
          case 2:
            ufo.energy -= 1;
            break;
          case 3:
            ufo.energy -= 2;
            break;
        }
        drops[i].collect();
        sound.play("meteor");
      }
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: launch meteors one by one every "startPeriod" milliseconds
  //         update meteors position
  //--------------------------------------------------------------------------------
  void fallMeteors() {
    if (millis() - gameStartTime > startPeriod) { startMeteors(); }
    for(int i = 0; i < drops.length; i++) {
        drops[i].fall();
    }   
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: launch next meteor, until all are launched
  //         update time period
  //         update UFO's energy
  //--------------------------------------------------------------------------------
  void startMeteors() {
    if (numDrops < drops.length) {
      drops[numDrops].start();
      numDrops ++;
    }
    startPeriod += 1000;
    ufo.energy--;
  }
}