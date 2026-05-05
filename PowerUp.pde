class PowerUp {
  float x, y, w, h, speed;
  char type;


  //Constructor
  PowerUp() {


    w = 100;
    h = 100;
    speed =2;
    x = random(width);
    y = -100;
    if (random(3) == 1) {
      type = 'h'; // h for health
    } else if (random(2) == 1) {
      type = 't'; //t for turret
    } else {
      type = 'a'; // a for amo
    }
  }








  void display() {
 
    if (type == 'h') {
      fill(#eb1a1a);
      ellipse(x, y, w, h);
      textAlign(CENTER, CENTER);
      text("Health",x,y);
    } else if (type == 't') {
      fill(#fff200);
      ellipse(x, y, w, h);
         fill(#FFFFFF);
       textAlign(CENTER, CENTER);
      text("Turret",x,y);
    } else if (type == 'a') {
      fill(0);
      ellipse(x, y, w, h);
      fill(#FFFFFF);
       textAlign(CENTER, CENTER);
      text("Ammo",x,y);
      fill(0);
    }
  }



  void move() {
    y = y + speed;
  }
  boolean reachedEdge() {
    return x >=width+150 || x <= -150 || y > height +150 || y < -150;
  }
   boolean intersect(Tank t) {
    float distance = dist (x, y, t.x, t.y);
    if (distance < 100 ) {
      return true;
    } else {
      return false;
}
   }
}
