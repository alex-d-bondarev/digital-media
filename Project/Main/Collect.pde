class Collect{
  long gameTime = 25000;
  long gameStartTime = 0;
  long startPeriod = 500;
  int numDrops = 0;
  Meteor[] drops = new Meteor[10]; // Declare and create the array
  
  Collect() {
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
   if (millis() - gameStartTime > gameTime) exit();
   if (millis() - gameStartTime > startPeriod) { startMeteors(); }
   
   fill(50, 50, 100, 30);
   rect(0, 0, 1000, 600);
   
   
   for(int i = 0; i < drops.length; i++) {
     drops[i].fall();
   }
   
  }
  
  void startMeteors() {
    if (numDrops < drops.length) {
      drops[numDrops].start();
      println("Go");
      startPeriod += 1000;
      numDrops ++;
    }
  }
}