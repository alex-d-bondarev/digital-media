class Collect{
  long gameTime = 22000;
  long gameStartTime = 0;
  long startPeriod = 500;
  int numDrops = 0;
  Meteor[] drops = new Meteor[10];
  World world;
  Ufo ufo;
  
  Collect(World model, Ufo inUfo) {
    world = model;
    ufo = inUfo;
    size(1000, 600);
    background(255);
    smooth();
    noStroke();
    for(int i = 0; i < drops.length; i++) {
      drops[i] = new Meteor();
    }
    startMeteors();
    gameStartTime = millis();
  }
  
  void display() {
    if (millis() - gameStartTime > gameTime) { 
      if(ufo.energy > 0){
        world.currentAct = 8;
        ufo.reset();
      } else {
        world.nextAct(); 
        ufo.reset();
      }
    }
    if (millis() - gameStartTime > startPeriod) { startMeteors(); }
    
    ufo.collect();
    intersect();
    
    fill(255);
    text("Energy " + ufo.energy, 20, 20);
    
    fill(50, 50, 100, 30);
    rect(0, 0, 1000, 600);
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
      }
    }
  }
}