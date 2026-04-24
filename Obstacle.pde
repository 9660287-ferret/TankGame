class Obstacle {
  float x, y, w, h, speed, health;
  PImage obst1;
  char idir;


  //Constructor
  Obstacle(float w, float h) {
    this.w = w;
    this.h = h;
    this.speed = 0.5;
    this. health = 10;
    if (int(random(4)) == 2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(3))==1) {
      idir = 'a';
      x = -100;
      y = random(height);
    } else if (int(random(3))==1) {
      idir = 's';
      y = -100;
      x = random(width);
    }
 
    obst1 = loadImage("flag2.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }
  void move() {
    switch(idir) {
    case 'w':
      y = y - speed;
      break;
    case 'a':
      x = x - speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd':
      x = x + speed;
    }
  }
  boolean reachedEdge() {
    return x >=width+150 || x <= -150 || y > height +150 || y < -150;
  }
}
