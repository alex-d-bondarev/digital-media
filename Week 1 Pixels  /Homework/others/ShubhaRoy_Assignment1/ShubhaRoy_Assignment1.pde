void setup() {
  size(725,600);
  noStroke();

  
  //define colors
  color c1 = color(255,100,3);
  color c2 = color(160,70,2);
}

void draw() {
  //setGradient(0,0,500,500,c1,c2,Y_AXIS); tried using this function to put gradient in background
  
  background(255);

  //sky blue clouds
  fill(111,227,255,99);
  ellipseMode(CENTER);
  ellipse(70,350,100,100);
  ellipse(90,400,110,110);
  ellipse(130,375,100,100);
  ellipse(155,420,80,80);
  ellipse(200,400,80,80);
  
  //pink clouds
  fill(255,70,246,90);
  ellipseMode(CENTER);
  ellipse(400,125,80,80);
  ellipse(370,75,100,100);
  ellipse(450,90,80,80);
  ellipse(475,120,110,110);
  ellipse(525,140,80,80);
  
  //yellow clouds
  fill(255,241,111,99);
  ellipseMode(CENTER);
  ellipse(400,500,100,100);
  ellipse(450,490,80,80);
  ellipse(410,550,80,80);
  ellipse(490,525,100,100);
  ellipse(530,550,80,80);
  ellipse(575,550,80,80);
  
  //LEFT BIRD
  
  //head of left bird
  fill(255,241,111);
  triangle(200,150,250,100,300,125);
  fill(111,227,255);
  ellipseMode(CENTER);
  ellipse(255,120,10,10);
  fill(255);
  ellipse(258,118,5,5);
  
  //body of left bird
  fill(111,227,255);
  triangle(150,200,250,100,200,250);
  
  fill(57,64,255);
  triangle(150,200,175,300,200,250);
  
  //wings of left bird
  fill(255,70,246,99);
  triangle(50,150,150,200,175,300);
  triangle(15,200,150,200,175,300);
  
  //tail of left bird
  fill(255,241,111);
  triangle(100,450,200,250,225,275);
  
  //RIGHT BIRD
  
  //head of right bird
  fill(255,70,246);
  triangle(400,300,450,275,475,325);
  ellipseMode(CENTER);
  fill(111,227,255);
  ellipse(435,295,10,10);
  fill(255);
  ellipse(433,293,5,5);
  
  //body of right bird
  fill(255,241,111);
  triangle(450,275,475,475,525,400);
  
  fill(57,64,255);
  triangle(475,475,550,525,555,350);
  
  //tail of right bird
  fill(255,70,246);
  triangle(550,525,551,475,700,525);
  
  //wings of right bird
  fill(111,227,255,99);
  triangle(551,475,555,350,650,275);
  triangle(551,475,555,350,675,325);
  fill(0);
}




