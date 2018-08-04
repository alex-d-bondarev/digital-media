// Alien
   color alien = color(180,170,140);
   color alienCloth = color(110,160,250);
   color alienNeck = color(215,240,240);
// Main
color black = color(0);
color white = color(255);
color UFOStroke = color(55,240,240);


void setup(){
  //window
  size(400,600);
  background(255);
} 

void draw(){
  drawTallAlien(150, 180);
}

void drawTallAlien(float aPosX, float aPosY){
  pushMatrix();
  translate(aPosX, aPosY);
  strokeWeight(1);
      
      
  //----------------------------------------
  // head
  fill(alien);
  beginShape();
  curveVertex(90, 100);
  curveVertex(90, 100);
  curveVertex(80, 50);
  curveVertex(65, 20);
  curveVertex(55, 20);
  curveVertex(40, 50);
  curveVertex(30, 100);
  curveVertex(30, 100);
  endShape();
  
  
      
  //----------------------------------------
  // draw a right eye
  fill(white);
  ellipse(70,50,10,20);
  fill(black);
  ellipse(70,50,5,7);
      
  //----------------------------------------
  // draw a left eye
  fill(white);
  ellipse(50,50,10,20);
  fill(black);
  ellipse(50,50,5,7);
      
      
  //----------------------------------------
  // hair 
  fill(black);
  beginShape();
  vertex(60,15);
  bezierVertex(60,20, 50,0, 60,-20);
  bezierVertex(60,-20, 80,-30, 70,0);
  bezierVertex(70,0, 65, -15, 70,0 );
  bezierVertex(70,0, 75,-20, 62,-15 );
  bezierVertex(62,-15, 55,0, 60,15 );
  endShape();
      
      
  //----------------------------------------
  // ears
  fill(black);
  // left
  rotate(PI/6);
  ellipse(40,15,10,25);
  rect(40,10, 20,10);
  
  // right
  rotate(-PI/3);
  ellipse(65,75,10,25);
  rect(45,70, 20,10);
  
  rotate(PI/6);
      
  //----------------------------------------
  // mouth
  fill(black);
  beginShape();
  vertex(50, 70);
  bezierVertex(50,70, 60,95, 70, 70);
  bezierVertex(70,70, 60,80, 50, 70);
  endShape();
      
      
  //----------------------------------------
  // left arm
  fill(alien);
  beginShape();
  vertex(10, 270);
  bezierVertex(10, 270, 10,290, 25, 290);
  bezierVertex(25, 290, 30,295, 25, 300);
  bezierVertex(25, 300, 15,300, 15, 300);
  bezierVertex(15, 300, 10,340, 5, 300);
  bezierVertex(5, 300, 0,340, -5, 300);
  bezierVertex(-5, 300, -10,340, -15, 300);
  vertex(-10, 270);
  endShape();
  
  fill(alienNeck);
  ellipse(0, 270, 30, 20);
  
  
  //----------------------------------------
  // right arm
  fill(alien);
  beginShape();
  vertex(110, 270);
  bezierVertex(110, 270, 110,290, 95, 290);
  bezierVertex(95, 290, 90,295, 95, 300);
  bezierVertex(95, 300, 105,300, 105, 300);
  bezierVertex(105, 300, 110,340, 115, 300);
  bezierVertex(115, 300, 120,340, 125, 300);
  bezierVertex(125, 300, 130,340, 135, 300);
  vertex(130, 270);
  endShape();
  
  fill(alienNeck);
  ellipse(120, 270, 30, 20);
  
  
  //----------------------------------------
  // left hand
  strokeWeight(12);
  stroke(15);
  noFill();
  beginShape();
  curveVertex(15,125);
  curveVertex(15,125);
  curveVertex(0,200);
  curveVertex(0,265);
  curveVertex(0,265);
  endShape();
  strokeWeight(1);
  
  
  //----------------------------------------
  // right hand
  strokeWeight(12);
  stroke(15);
  noFill();
  beginShape();
  curveVertex(105,125);
  curveVertex(105,125);
  curveVertex(120,200);
  curveVertex(120,265);
  curveVertex(120,265);
  endShape();
  strokeWeight(1);
      
      
  //----------------------------------------
  // draw shoulders
  fill(alienCloth);
  // left
  ellipse(25, 120, 40, 40);
  // right
  ellipse(95, 120, 40, 40);
      
      
  //----------------------------------------
  // draw body
  fill(alienCloth);
  beginShape();
  vertex(65,380);
  bezierVertex(65,380, 120,170, 90,100);
  vertex(30, 100);
  bezierVertex(30, 100, 0,170, 55,380);  
  vertex(55,380);
  endShape();
      
      
  //----------------------------------------
  //draw zip
  fill(alien);
  beginShape(TRIANGLE_STRIP);
  vertex(65,380);
  vertex(55,380);
  vertex(65,360);
  vertex(55,340);
  vertex(65,320);
  vertex(55,300);
  vertex(65,280);
  vertex(55,260);
  vertex(65,240);
  vertex(55,220);
  vertex(65,200);
  vertex(55,180);
  vertex(65,160);
  vertex(55,140);
  vertex(65,120);
  vertex(55,100);
  vertex(65,100);
  endShape();
      
  //----------------------------------------
  // buttons
  fill(alienNeck);
  rect(40, 130, 40, 10);
  rect(40, 145, 40, 10);
  rect(40, 160, 40, 10);
      
      
  //----------------------------------------
  // neck
  fill(alienNeck);
  beginShape(QUAD_STRIP); 
  vertex(20, 105);
  vertex(100,105);
  vertex(10, 100);
  vertex(110,100);
  vertex(10, 90);
  vertex(110,90);
  vertex(20, 85);
  vertex(100,85);
  endShape();
      
  //----------------------------------------
  // draw legs
  pushMatrix();
  translate(50, 380);
  
  // left leg
  fill(black);
  rotate(-PI/6);
  ellipse(0, 0, 35, 20);
  
  // right leg
  pushMatrix();
  translate(19, 11);
  
  rotate(PI/3);
  ellipse(0, 0, 35, 20);
  
  rotate(-PI/6);
  popMatrix();
  popMatrix();
  //----------------------------------------
  
  popMatrix();
}