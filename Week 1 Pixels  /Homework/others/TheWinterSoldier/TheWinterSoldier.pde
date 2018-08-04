 size(800,930);
 background(40);
  
//Shield
strokeWeight(5);
stroke(45);
fill(130,0,0);
ellipse(400,400,750,750);
stroke(70);
fill(175,175,175);
ellipse(400,400,600,600);
fill(130,0,0);
ellipse(400,400,450,450);
stroke(140);
fill(31,34,90);
ellipse(400,400,315,315);

  //Star
  fill(175);
  stroke(175);
  beginShape(TRIANGLES);

    //top triangle
    vertex(400,250);
    vertex(435,360);
    vertex(365,360);
    
    //right triangle
    vertex(435,360);
    vertex(544,360);
    vertex(455,430);
    
    //left triangle
    vertex(365,360);
    vertex(257,360);
    vertex(347,430);
    
    //bottom right triangle
    vertex(455,430);
    vertex(485,524);
    vertex(400,465);
    
    //bottom left triangle
    vertex(400,465);
    vertex(315,525);
    vertex(347,430);
    
    endShape();

    //center
    beginShape();
    vertex(435,360);
    vertex(455,430);
    vertex(400,465);
    vertex(347,430);
    vertex(365,360);
    endShape(CLOSE);


//LEFT SIDE BACKGROUND
  
  rectMode(CORNERS);
  fill(40);
  noStroke();
  rect(0,0,400,800);
  


//Winter Soldier Jacket
  
   //strip2 (lighter)
  fill(40);
  noStroke();
  
  //small strip 2 
  noFill();
  beginShape();
  stroke(100);
  strokeWeight(3);
  vertex(400,100);
  bezierVertex(350,90,300,65,110,240);
  vertex(0,345);
  endShape();
  

  //big strip
  fill(60);
  noStroke();
  
  beginShape();
  vertex(400,25);
  bezierVertex(380,0,50,150,-3,300);
  endShape(CLOSE);
  
  beginShape();
  vertex(400,60);
  bezierVertex(390,70,300,100,110,180);
  vertex(0,340);
  bezierVertex(-3,300,200,150,400,30);
  endShape(CLOSE);
  
  beginShape(TRIANGLES);
  vertex(0,300);
  vertex(0,340);
  vertex(140,150);
  endShape();
  
  beginShape();
  vertex(400,25);
  vertex(400,75);
  vertex(300,90);
  vertex(400,25);
  endShape(CLOSE);
  
  
  //Clips
  
  stroke(170);
  fill(150);
  beginShape();
  vertex(360,65);
  vertex(330,32);
  vertex(310,40);
  vertex(340,75);
  vertex(360,65);
  endShape();
  
  fill(120);
  stroke(130);
  beginShape();
  vertex(360,65);
  vertex(360,80);
  vertex(340,85);
  vertex(340,75);
  vertex(360,65);
  endShape();
  
  stroke(170);
  fill(150);
  beginShape();
  vertex(100,165);
  vertex(50,210);
  vertex(90,230);
  vertex(140,190);
  vertex(100,165);
  endShape();
  
  fill(120);
  stroke(130);
  beginShape();
  vertex(140,190);
  vertex(140,205);
  vertex(90,240);
  vertex(90,230);
  vertex(140,190);
  endShape();


//Winter Soldier Arm
  //Metal outline
  fill(150);
  noStroke();
  line(400,780,150,800);

  beginShape();
  vertex(150,800);
  bezierVertex(140,600,160,520,170,530);
  endShape(CLOSE);

  beginShape();
  vertex(165,530);
  bezierVertex(170,530,160,500,110,480);
   endShape(CLOSE);

  beginShape();
  vertex(110,480);
  bezierVertex(5,500,15,400,30,350);
  endShape(CLOSE);
 
  beginShape();
  vertex(30,350);
  bezierVertex(40,320,60,300,98,272);
  endShape(CLOSE);
 
  stroke(150);
  
  line(98,272,200,200);
  
  noStroke();
  beginShape();
  vertex(200,200);
  bezierVertex(300,110,350,100,400,130);
  endShape(CLOSE);
  
  //Metal filler
  noStroke();
  beginShape();
  vertex(400,780);
  vertex(400,120);
  vertex(340,116);
  vertex(200,200);
  vertex(98,272);
  vertex(30,350);
  vertex(110,480);
  vertex(155,530);
  vertex(141,800);
  endShape(CLOSE);
  
     //Metal Lines
  noFill();
  strokeWeight(5);
  stroke(100);
  line(400,700,145,735);
  line(400,625,150,660);
  line(400,550,153,585);
  line(400,475,153,525);
  line(400,400,53,475);
  line(400,325,20,405);
  line(400,250,33,345);
  line(400,175,82,285);
  line(374,120,227,178);
  
   //Winter Soldier Star
  strokeWeight(5);
  fill(130,0,0);
  stroke(20);
  beginShape();
  vertex(400,250);
  vertex(400,465);
  vertex(315,525);
  vertex(347,430);
  vertex(257,360);
  vertex(365,360);
  vertex(400,250);
  endShape();
  

   
//MISC
noStroke();
fill(40);
beginShape();
vertex(0,0);
vertex(0,930);
vertex(20,930);
vertex(20,0);
endShape();

  //line in the middle
  stroke(3);
  line(401,0,401,930);
  
//Text


String lines = "T\nH\nE";
textSize(16);
fill(250);
textLeading(22);
text(lines, 100,846);

textSize(75);
fill(180,0,0);
text("WINTER", 125,890);

textSize(75);
fill(250);
text("SOLDIER", 405,890);
 

