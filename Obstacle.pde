class Obstacle {
  int x, y, w, h, speed, health;
PImage obst1;


  //Constructor
  Obstacle(int x, int y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 1;
    health = 25;
    obst1 = loadImage("flag2.png");
  }

  void display() {
imageMode(CENTER);
image(obst1,x,y);
  }

  void move() {
    x = x+speed;
    if(x > width+130) {
    x = 0;
    }
  }
}
