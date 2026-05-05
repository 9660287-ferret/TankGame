class Tank {
  int x, y, w, h, speed, health;
  PImage t1d, t1a, t1w, t1s;
  char idir;
  int turretCount, lasercCount;

  //Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 5;
    speed = 5;
    health = 100;
    t1d = loadImage("tank1d.png");
    t1a = loadImage("tank1a.png");
    t1w = loadImage("tank1w.png");
    t1s = loadImage("tank1s.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }

  void display() {
    imageMode (CENTER);
    if (idir == 'd') {
      image(t1d, x, y);
    } else if (idir == 'a') {
      image(t1a, x, y);
    } else if (idir == 'w') {
      image(t1w, x, y);
    } else if (idir == 's') {
      image(t1s, x, y);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }
  boolean intersect(Obstacle obs) {
    float distance = dist (x, y, obs.x, obs.y);
    if (distance < 100 ) {
      return true;
    } else {
      return false;
    }
  }
}
