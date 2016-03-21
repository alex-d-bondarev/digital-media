class Ufo{

  
  //================================================================================
  // properties
  boolean landed;
  boolean niceLanding;
  boolean paused;
  boolean moveLeft;
  boolean moveRight;
  boolean moveUp;
  
  color ufoMainColor;
  
  float GRAVITY;
  float TORQUE;
  float WINDAGE;
  
  float posX;
  float posY;
  
  String message;
  
  //================================================================================
  // constructor
  Ufo() {
    ufoMainColor = color(50,106,70);
    GRAVITY = 0.015;
    TORQUE = 0.05;
    WINDAGE = 0.005;
  }
  
  //================================================================================
  // methods
  
  //--------------------------------------------------------------------------------
  // Effect: set UFO variables to starting point
  //--------------------------------------------------------------------------------
  void init() {
    aln.reset();
    landar.hide();
    posX = 100;
    posY = 20;
    horizontalSpeed = 0;
    verticalSpeed = 0;
    moveRight = false;
    moveLeft = false;
    moveUp = false;
    landed = false;
    paused = false;
    niceLanding = false;
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: set UFO variables to starting point
  //--------------------------------------------------------------------------------
  void reset() {
    aln.reset();
    landar.hide();
    posX = 100;
    posY = 20;
    horizontalSpeed = 0;
    verticalSpeed = 0;
    moveRight = false;
    moveLeft = false;
    moveUp = false;
    landed = false;
    paused = false;
    niceLanding = false;
  }
  
    
  //--------------------------------------------------------------------------------
  // Effect: draws UFO 
  //--------------------------------------------------------------------------------
  void display(){
     
    // UFO is moved by pushing coordinates
    pushMatrix();
    translate(posX, posY-20); // -20 (landing legs length) for better looking landing
    
    // set UFO style
    fill(ufoMainColor);
    stroke(UFOStroke);
    
    //----------------------------------------
    // draw top
    // it will open when landed nicely
    if(niceLanding) {
      rotate(radians(90));
      arc(-20,-25, 40, 40, PI, 2*PI, CHORD);
      rotate(radians(-90));
    } else {
      arc(0,0, 40, 40, PI, 2*PI, CHORD);
    }
    
    //----------------------------------------
    // draw legs
    if (landed) {
      line(-35,25, -10,0);
      line(35,25, 10,0);
    }
    
    //----------------------------------------
    // draw body
    arc(0,30,80,80, 1.15*PI, 1.85*PI, CHORD);
  
    // if not paused
    // calculate GRAVITY force on UFO and move
    if(!paused) { moveUFO(); }
    
    //----------------------------------------
    // draw torque (red and orange fire)
    noStroke();
    // color will be changing each frame
    if(frameCount % 2 == 0){ fill(red); } 
    else { fill(orange); }
    
    // "up" 
    if(moveUp) {
      ellipse(0, 25, 10, 20);
    }
      
    // draw "left" torque
    if(moveLeft){
      rotate(radians(-45));
      ellipse(17, 45, 10, 15);
      rotate(radians(45));
    }
    // draw "right" torques
    if(moveRight){
      rotate(radians(45));
      ellipse(-17, 45, 10, 15);
      rotate(radians(-45));
    }
    
    //----------------------------------------
    strokeWeight(1);
    popMatrix();
  }
  
  
  //--------------------------------------------------------------------------------
  // Move UFO
  //--------------------------------------------------------------------------------
  void moveUFO(){
    // update by controls
    if(moveRight) { 
      horizontalSpeed+=TORQUE/2; 
      verticalSpeed-=TORQUE/4; 
    } if(moveLeft) { 
      horizontalSpeed-=TORQUE/2;
      verticalSpeed-=TORQUE/4;  
    } if(moveUp) { 
      verticalSpeed-=TORQUE; 
    }
    
    //----------------------------------------
    // update by gravity
    verticalSpeed += GRAVITY;
    // update by windage
    if(horizontalSpeed > 0){
      horizontalSpeed-= WINDAGE;
    } else if (horizontalSpeed < 0) {
      horizontalSpeed+= WINDAGE;
    }
    
    //----------------------------------------
    // check if UFO landed
    setLandingStatus();
  
    //----------------------------------------
    // update position
    posX += horizontalSpeed;
    posY += verticalSpeed;
    
    //----------------------------------------
    // out of the screen
    if(posX < -30) { posX = 1030; }
    if(posX > 1030){ posX = -30; } 
    if(posY < 0) { verticalSpeed = 0; }
  }
  
  
  //--------------------------------------------------------------------------------
  // Handle landing
  //--------------------------------------------------------------------------------
  void setLandingStatus(){
    
    if(!landed) {
      landed = true;
      
      //----------------------------------------
      // for big hill landing
      if(posY >= hillHeight && posY < hillHeight+40 && posX > leftHillTop && posX < rightHillTop) {
        message = "Nice!";
        niceLanding = true;
        
        // change alien coordinates
        aln.setX(posX);
        aln.setY(posY-25);
        aln.nextState();
        
      //----------------------------------------  
      // for landing on right part of big hill
      } else if(posX > rightHillTop && posY > handHeight) {
        message = "Go left";
      
      // for landing on left part of big hill
      } else if(posX < leftHillTop && posX > leftHillBottom && posY > extremeHeight) {
        message = "Go right";
      
      // for river landing
       } else if(posX > rightHandEdge+70 && posX < leftHillBottom && posY > extremeHeight) {
        message = "No water!!";
        
      // for hand landing 
       } else if(posX > rightHeadEdge && posX < rightHandEdge 
                                       && posY > handHeight && posY < handHeight+30) {
        message = "Impossible!";
      
      // for head landing
       } else if(posX > leftHeadEdge && posX < rightHeadEdge 
                                       && posY > headHeight && posY < headHeight+20) {
        message = "???";
      
      // for far hills landing
      } else if (posY > extremeHeight) {
      // landOnFarHills = true;
        message = "Too far";
      
      // still flying
      } else {
        landed = false;
      }
    }
  
    //----------------------------------------
    // draw landed ship with text in dialog
    if(landed) {
      // stop UFO
      verticalSpeed = 0;
      horizontalSpeed = 0;
      
      // switch off landing highlighter
      landar.hide();
      
      // start showing a small alien for nice landing
      if (niceLanding) {
      
      //----------------------------------------  
      // show dialog for wrong landing
      } else {
        pushMatrix();
        translate(-10,-50);
        
        // set style
        noStroke();
        textAlign(CENTER);
        fill(white);
        
        // draw dialog cloud
        ellipse(10,-10,90,50);
        beginShape();
        vertex(-35,-10);
        bezierVertex(-35,-10, -35,15, 0,25);
        endShape();
        
        fill(black);
        text(message, 10,-10);
        
        popMatrix();
        
      }
    }  
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (pressed)
  //--------------------------------------------------------------------------------
  void handleKeyPressed(){
   if(key == CODED){
     switch(keyCode){
        case(RIGHT): 
          moveRight = true;
          break;
        case(LEFT):  
          moveLeft = true;
          break;
        case(UP):
          moveUp = true;
          break;
      }
      
   //----------------------------------------   
   } else if(key == ' ') {
     // reset UFO
     reset();
   } else if(key == 'p' || key == 'P'){
     pausedOpposite();
   }
  } 


  //--------------------------------------------------------------------------------
  // Effect: changes value of "paused" to opposite value
  //--------------------------------------------------------------------------------
  void pausedOpposite() {
    paused = ! paused;
  }
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (reliesed)
  //--------------------------------------------------------------------------------
  void handleKeyReleased(){
   moveRight = false;
   moveLeft = false;
   moveUp = false;
  } 
  

  //--------------------------------------------------------------------------------
  // Effect: makes some "wind"
  //         wind power can be changed very little
  //         wind angle depends on mouse position
  //--------------------------------------------------------------------------------
  void handleMousePressed() {
    
    // calculate whole distance from UFO to mouse
    // by using Pythagorean theorem
    distance = sqrt( pow(mouseX - posX, 2) 
                   + pow(mouseY - posY, 2) );
                   
    // change speed by getting direction => (x1 - x2)^0
    // multiplying by distance 
    // adding to vertical and horizontal speed
    verticalSpeed = verticalSpeed - (mouseY - posY)/(2*distance);
    horizontalSpeed = horizontalSpeed - (mouseX - posX)/(2*distance);
  } 
}