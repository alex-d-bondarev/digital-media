class Landingareas{

  
  //----------------------------------------
  //----------------------------------------
  // properties
  boolean highlighField;
  boolean showLandingLine;
  
  //----------------------------------------
  //----------------------------------------
  // constructor
  Landingareas(boolean show) {
    showLandingLine = show;
  }
  
  //----------------------------------------
  //----------------------------------------
  // methods
  
  //----------------------------------------
  // Effect: highlights landing field 
  //----------------------------------------
  void display(){
    if(showLandingLine){
      // set style
      strokeWeight(5);
      // move every frame
      if(frameCount % 20 == 0){
        highlighField = ! highlighField;
      } 
      if(highlighField) {
        // draw blue/safe landing zone
        stroke(UFOStroke);
        fill(UFOStroke);
        rect(leftHillTop,hillHeight, rightHillTop-leftHillTop, 40);
        
        // draw red/unsafe landing zone
        stroke(red);
        fill(red);
        
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
    
    
  //----------------------------------------
  // Effect: hide landing area 
  //----------------------------------------
  void hide() {
    showLandingLine = false;
  }
  
  //----------------------------------------
  // Effect: switch landing area 
  //----------------------------------------
  void opposite() {
    showLandingLine = ! showLandingLine;
  }
}