class Meteor {
  
int quality = int(random(4));
float x = random(500, 1300);
float y = -20;
float velocity = 0;
float growth = 0;
float size = 5;
color meteorColor;

Meteor() {
  switch(quality) {
    case 0:
      meteorColor = color(255);
      break;
    case 1:
      meteorColor = color(130, 255, 105);
      break;
    case 2:
      meteorColor = color(255, 255, 40);
      break;
    case 3:
      meteorColor = color(255, 90, 90);
      break;
  }
}

void fall() {

 y += velocity;
 x -= velocity;
 size+=growth;
 fill(meteorColor, 240);
 ellipse(x, y, size, size);

}

  int getQuality() { return quality; }
  float getX() { return x; }
  float getY() { return y; }
  float getSize() { return size; }
  
  void start() { 
    velocity += 1;
    growth = 0.15;
  }

}