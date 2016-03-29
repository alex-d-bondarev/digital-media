class Collect{
  long gameTime = 22000;
  long gameStartTime = 0;
  long startPeriod = 500;
  int energy;
  int numDrops = 0;
  Meteor[] drops = new Meteor[10];
  World world;
  Sound sound;
  Ufo ufo;
  
  
  Collect(World model, Ufo inUfo, Sound music) {
    world = model;
    ufo = inUfo;
    sound = music;
    size(1000, 600);
    background(space);
    smooth();
    noStroke();
    for(int i = 0; i < drops.length; i++) {
      drops[i] = new Meteor();
    }
    startMeteors();
    gameStartTime = millis();
  }
  
  
  void display() {
    energy = ufo.energy;
    
    transparentBackground();
    endAct();
    displayEnergy();    
    ufo.collect();
    intersect();
    fallMeteors();    
  }
  
  
  void transparentBackground() {
    fill(space, 30);
    rect(0, 0, width, height);
  }
  
  
  void endAct() {
    textSize(15);
    if (energy == 0) {
      world.nextAct(); 
      ufo.reset();
    } else if (millis() - gameStartTime > gameTime) { 
      if(energy > 0){
        world.currentAct = 9;
        ufo.reset();
      } else {
        world.nextAct(); 
        ufo.reset();
      }
    }
  }
  
  
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
  
  
  void fallMeteors() {
    if (millis() - gameStartTime > startPeriod) { startMeteors(); }
    for(int i = 0; i < drops.length; i++) {
        drops[i].fall();
    }   
  }
  
  
  void startMeteors() {
    if (numDrops < drops.length) {
      drops[numDrops].start();
      numDrops ++;
    }
    startPeriod += 1000;
    ufo.energy--;
  }
}