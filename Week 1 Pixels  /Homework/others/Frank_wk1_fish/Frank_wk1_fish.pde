//set a background
size(900,1000);
background(74,192,245);

//fish head
fill(242,250,38);
strokeWeight(8);
ellipseMode(CENTER);
ellipse(250,350,300,300);


//fish top fins
strokeWeight(8);
fill(242,250,38);
bezier(290,200,290,120,490,100,490,200);
strokeWeight(8);
line(340,200,390,135);
line(390,200,440,140);
line(440,200,470,165);


//fish bottom fins
strokeWeight(8);
fill(242,250,38);
bezier(290,500,350,600,450,600,450,500);
strokeWeight(8);
line(340,500,390,570);
line(390,500,430,560);


//fish tail
line(700,180,700,480);
bezier(700,180,700,200,350,330,700,480);

ellipseMode(CENTER);
ellipse(600,340,50,50);



//fish body

rectMode(CORNER);
rect(250,200,300,300);




//fish eye
fill(255,255,255);
strokeWeight(4);

ellipseMode(CENTER);
ellipse(190,280,100,100);

strokeWeight(20);
ellipseMode(CENTER);
ellipse(180,280,35,35);

//fish mouth
noFill();
bezier(120,400,120,400,150,430,200,390);

//fishi scale
fill(247,54,0);
strokeWeight(8);

bezier(340,205,450,350,340,500,340,495);
line(340,205,340,495);

bezier(440,200,550,345,440,500,440,495);
line(440,200,440,495);