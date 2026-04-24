//CD | apr 14 2026 | TankGame
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;
Timer obsTimer;


void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  // obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(300, 50));
  //  obstacles.add(new Obstacle(150, 400));
  score = 0;
  obsTimer = new Timer(5000);
  obsTimer.start();
}

void draw() {
  background(#5a5a4a);
  imageMode(CORNER);
  image(bg, 0, 0);
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }
  //obstacles.add(new Obstacle(150, 400));

  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
    if (obs.reachedEdge()) {
      obstacles.remove(i);
    }
  }
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if(p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  scorePanel();
  tank1.display();
}

void scorePanel() {
  fill(#3a4727, 127);
  rectMode(CENTER);
  rect(width/2, 490, width, 25);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("SCORE:" + score, width/5, 495);
}




void keyPressed() {
  if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a');
  } else if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(tank1.x, tank1.y));
}
