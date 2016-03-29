class Landing{
  //================================================================================
  // properties
  //================================================================================
  boolean deafaultLandingArea;
  boolean highlighField;
  boolean showLandingLine;
  color badArea;
  color goodArea;
  
  //================================================================================
  // constructor
  //================================================================================
  Landing(color bad, color good) {
    badArea = bad;
    deafaultLandingArea = false;
    goodArea = good;
  }
  
  //================================================================================
  // methods
  //================================================================================
  
  //--------------------------------------------------------------------------------
  // Effect: highlights landing field 
  //--------------------------------------------------------------------------------
  void display(){
    if(showLandingLine){
      // set style
      strokeWeight(5);
      // move every frame
      if(frameCount % 20 == 0){
        highlighField = ! highlighField;
      } 
      
      //----------------------------------------
      if(highlighField) {
        // draw safe landing zone
        stroke(goodArea);
        fill(goodArea);
        rect(leftHillTop,hillHeight, rightHillTop-leftHillTop, 40);
        
        // draw unsafe landing zone
        stroke(badArea);
        fill(badArea);
        
        //head landing
        rect(leftHeadEdge,headHeight, rightHeadEdge-leftHeadEdge,20);
        
        // hand landing
        rect(rightHeadEdge,handHeight, rightHandEdge-rightHeadEdge,20);
        
        // water landing
        rect(rightHandEdge+50,extremeHeight, leftHillBottom-rightHandEdge-50,10);
        
        // left hill botton
        rect(leftHillBottom, extremeHeight-10, leftHillTop-leftHillBottom, 10);
        
        // right hill botton
        rect(rightHillTop, extremeHeight-10, width-rightHillTop,10);
        
        // everithing else
        line(0,extremeHeight, width,extremeHeight);
      }
      strokeWeight(1);
    }
  }
  
  
  //--------------------------------------------------------------------------------
  // EFFECT: Handle arrow keys (pressed)
  //--------------------------------------------------------------------------------
  void handleKeyPressed(){
    if(key == 'l' || key == 'L'){
       opposite();
     } 
  }
    
    
  //--------------------------------------------------------------------------------
  // Effect: hide landing area 
  //--------------------------------------------------------------------------------
  void hide() {
    showLandingLine = false;
  }
  
  
  //--------------------------------------------------------------------------------
  // Effect: switch landing area 
  //--------------------------------------------------------------------------------
  void opposite() {
    showLandingLine = ! showLandingLine;
  }
}