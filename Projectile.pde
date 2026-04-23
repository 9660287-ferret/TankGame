class Projectile {
  int x, y, w, h, speed, health;



  //Constructor
  Projectile(int x, int y) {
   
    this.x = x+3;
    this.y = y;
    w = 5;
    h = 10;
    speed = 4;
  
  }

  void display() {
rectMode(CENTER);
rect(x,y,w,h);
  }

  void move() {
    y = y-speed;
   
    }
  }
