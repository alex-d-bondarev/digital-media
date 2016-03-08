class Ufo{

  
  //----------------------------------------
  //----------------------------------------
  // properties
  color UFOFill = color(50,106,70);
  
  //----------------------------------------
  //----------------------------------------
  // constructor
  Ufo() {
    
  }
  
  //----------------------------------------
  //----------------------------------------
  // methods
  
    
  //----------------------------------------
  // Effect: draws UFO 
  //----------------------------------------
  void display(){
     
    // UFO is moved by pushing coordinates
    pushMatrix();
    translate(posX, posY-20); // -20 (landing legs length) for better looking landing
    
    // set UFO style
    fill(UFOFill);
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
    // draw torque (red/orange fire)
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
  
  
  //----------------------------------------
  // Move UFO
  //----------------------------------------
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
    
    // update by gravity
    verticalSpeed += GRAVITY;
    // update by windage
    if(horizontalSpeed > 0){
      horizontalSpeed-= WINDAGE;
    } else if (horizontalSpeed < 0) {
      horizontalSpeed+= WINDAGE;
    }
    
    // check if UFO landed
    setLandingStatus();
  
    
    // update position
    posX += horizontalSpeed;
    posY += verticalSpeed;
    
    // out of the screen
    if(posX < -30) { posX = 1030; }
    if(posX > 1030){ posX = -30; } 
    if(posY < 0) { verticalSpeed = 0; }
  }
}