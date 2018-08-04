// a roboRabbit

// draw a window
size(400, 500);
background(#A56534);

// draw all rectangles by corners
rectMode(CORNERS);

// draw all ellipses by radius
ellipseMode(RADIUS); 

//
// grey hands and legs
//
fill(180);
// biceps
rect(150,251, 260,269);

// left forearm
rect(130,269, 150,280);
// right forearm
rect(260,269, 280, 280);

// left arm
rect(125,285, 155,300);
// right arm
rect(255,285, 285,300);

// left knee
quad(180,300, 205,300, 197,350, 188,350);
// right knee
quad(205,300, 230,300, 222,350, 213,350);

// left foot
rect(175,340, 200,350);
// right foot
rect(210,340, 235,350);

//
// green clothes
//
fill(136, 188, 40);

// draw shoulders
quad(155,250, 255,250, 250,270, 160,270);

// draw pullover on a body
rect(180,250, 230,300);

//
// draw a white shirt on a body
//
fill(255);
// triangle
triangle(180,250, 230,250, 205,300);
// shirt neck
rect(180,250, 230,260);
// shirt buttom
rect(180,300, 230,310);

//
// grey head
//
fill(180,180,180);

// head
rect(180,220, 230,250);
// forhead
quad(185,210, 225,210, 230,220, 180,220);
// mouth
rect(175,240, 235,255);

//
// all black staff
//
fill(0);

// left eye
ellipse(195,230,7,7);
// right eye
ellipse(215,230,7,7);

// eyebrows
triangle(197,220, 213,220, 205,225);

// mouth
rect(178,243, 232,252);

// left elbow
triangle(150,269, 130,269, 150,251);
// right elbow
triangle(260,251, 280,269, 260,269);

// left hand
rect(132,280, 148,285);
// right hand
rect(262,280, 278,285);

// shorts
rect(182,310, 228,325);

// left foot
rect(176,339, 199,340);
// right foot
rect(211,339, 234,340);


//
// all light orange staff
//
fill(255,180,20);

// left eye
ellipse(195,230,6,6);
// right eye
ellipse(215,230,6,6);

// button 
ellipse(205,285,4,4);

//
// draw ears
//

// grey part
strokeWeight(10);
stroke(0);

// left ear
line(180,170, 195,210);
// right ear
line(230,170, 215,210);

// orange part
strokeWeight(6);
stroke(255,180,20);

// left ear
line(180,170, 195,210);
// right ear
line(230,170, 215,210);

//
// teeth
//
noStroke();
fill(255);
// left
rect(195,243, 199,247);
// asymmetric right
rect(203,243, 207,247);
//rect(178,243, 232,252);