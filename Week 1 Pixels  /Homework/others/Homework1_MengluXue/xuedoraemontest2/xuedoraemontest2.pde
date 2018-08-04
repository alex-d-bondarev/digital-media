//create a white background
size(1000,1000);
background(255);

//create a grid paper
stroke(133,181,216,50);
strokeWeight(17);
for(int i=25;i<951;i+=25){
  line(i,25,i,951);
}

for(int o=25;o<951;o+=25){
  line(25,o,950,o);
}




//create doraemon's blue face
stroke(0);
strokeWeight(4);
fill(15,112,236);
smooth();
ellipseMode(CENTER);
ellipse(500,400,550,550);

//create doraemon's white face
stroke(0);
strokeWeight(4);
fill(255);
smooth();

bezier(315,600,100,100,900,100,688,600);

bezier(315,600,500,755,700,600,688,600);




//create doraemon's inside mouth
stroke(0);
strokeWeight(4);
fill(99,18,9);
smooth();
bezier(320,410,300,625,700,625,680,413);



//create doraemon's top right mouth
stroke(0);
strokeWeight(4);
fill(255);
smooth();
bezier(510,225,850,270,800,500,510,420);



//create doraemon's top left mouth
stroke(0);
strokeWeight(4);
fill(255);
smooth();
bezier(510,225,200,270,172,500,510,420);

line(510,320,510,420);

//create a face ball
//line(300,310,355,433);
beginShape();
vertex(300.0, 308.0);
//bezierVertex(300.0, 310.0, 386.0, 335.0, 300.0, 310.0);
bezierVertex(214.0, 285.0, 232.0, 445.0, 355.0, 436.0);
endShape();





//create doraemon's left eye
stroke(0);
strokeWeight(4);
fill(255);
smooth();
ellipseMode(CENTER);
ellipse(432,240,150,190);

fill(0);
smooth();
ellipseMode(CENTER);
ellipse(468,245,40,50);

//create doraemon's right eye
stroke(0);
strokeWeight(4);
fill(255);
smooth();
ellipseMode(CENTER);
ellipse(582,245,140,180);

fill(0);
smooth();
ellipseMode(CENTER);
ellipse(550,245,40,50);

//create doraemon's red nose
stroke(0);
strokeWeight(4);
fill(255,30,30);
smooth();
ellipseMode(CENTER);
ellipse(512,325,100,100);

//create doraemon's red neck
stroke(0);
strokeWeight(4);
fill(255,30,30);
smooth();

//create left beard
stroke(0);
strokeWeight(5);
noFill();
bezier(280,325,300,325,400,345,410,345);
bezier(270,375,400,350,440,370,440,370);
bezier(280,420,330,400,425,400,425,400);


//create right beard
stroke(0);
strokeWeight(5);
noFill();
bezier(610,345,610,345,700,320,750,320);
bezier(600,370,600,370,680,350,760,367);
bezier(610,400,610,400,680,390,710,410);

//create tongue
stroke(0);
strokeWeight(4);
fill(247,173,140);

bezier(388,540,500,400,614,540,614,540);
bezier(388,540,500,630,614,540,614,540);

fill(251,75,70);
noStroke();
bezier(388,540,500,460,614,540,614,540);
bezier(388,540,500,630,614,540,614,540);




//create a tie
stroke(0);
strokeWeight(4);
strokeJoin(ROUND);
fill(255,30,30);
rectMode(CORNER);
rect(330,620,340,50);

//create a bell
stroke(0);
strokeWeight(4);
fill(255,255,0);
smooth();
ellipseMode(CENTER);
ellipse(500,700,100,100);


bezier(452,695,452,700,550,700,550,695);
strokeWeight(10);
ellipseMode(CENTER);
ellipse(500,720,10,10);
strokeWeight(4);
line(500,720,500,750);




//create font
PFont font;
font=loadFont("Algerian-150.vlw");
textFont(font);
fill(15,112,236);
text("DO  AE  ON",100,900);


font=loadFont("Algerian-160.vlw");
textFont(font);
fill(255,30,30);
text("R",280,900);

font=loadFont("Algerian-160.vlw");
textFont(font);
fill(249,179,12);
text("M",580,900);

//create letter eyes
stroke(15,112,236);
strokeWeight(4);
strokeJoin(ROUND);
fill(255);
ellipseMode(CENTER);
ellipse(140,800,30,30);
ellipse(169,805,30,30);


ellipse(140,800,5,5);

line(161,802,171,805);


//create R ball
stroke(255,30,30);
strokeWeight(3);
strokeJoin(ROUND);
fill(245,175,175);
ellipse(305,912,30,25);
stroke(255,30,30);
strokeWeight(1);
fill(255,255,0);
ellipse(305,912,18,13);

//create a bell on letter

stroke(15,112,236);
strokeWeight(4);
fill(255,255,0);
smooth();
ellipseMode(CENTER);
ellipse(720,850,60,60);

bezier(690,850,690,855,750,855,750,850);


ellipseMode(CENTER);
ellipse(720,865,5,5);
strokeWeight(3);
line(720,865,720,880);

