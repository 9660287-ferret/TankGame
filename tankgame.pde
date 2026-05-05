//CD | apr 14 2026 | TankGame
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer objTimer, puTimer;



void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  score = 0;
  objTimer = new Timer(2000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(#5a5a4a);
  imageMode(CORNER);
  image(bg, 0, 0);
  //distribute timer
  if (objTimer.isFinished()) {
    //add object
    obstacles.add(new Obstacle(-100, int(random(height))));
    //restart timer
    objTimer.start();
  }
  //distribute timer
  if (puTimer.isFinished()) {
    //add power up
    powerups.add(new PowerUp());
    //restart timer
    puTimer.start();
  }
  // display/remoe power ups
  for (int i = 0; i <powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health + 1;
        powerups.remove(pu);
      } else  if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 3;
        powerups.remove(pu);
      } else  if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount + 1;
        powerups.remove(pu);
      }

      for (int i = 0; i < obstacles.size(); i++) {
        Obstacle obs = obstacles.get(i);
        obs.display();
        obs.move();
        if (obs.reachedEdge()) {
          obstacles.remove(i);
        }
        if (tank1.intersect(obs)) {
          obstacles.remove(obs);
          tank1.health = tank1.health -1;
        }
      }
      for (int i = 0; i < projectiles.size(); i++) {
        Projectile p = projectiles.get(i);
        for (int j = 0; j < obstacles.size(); j++) {
          Obstacle o = obstacles.get(j);
          score = score + 100;
          projectiles.remove(p);
          obstacles.remove(o);
        }
        p.display();
        p.move();
        if (p.reachedEdge()) {
          projectiles.remove(i);
        }
      }
      scorePanel();
      tank1.display();
      println("Objects in Memory:"+obstacles.size());
      println("Projectiles in Memory:"+projectiles.size());
    }
  }
}
void scorePanel() {
  fill(#3a4727, 127);
  rectMode(CENTER);
  rect(width/2, 490, width, 25);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("SCORE:" + score, width/5, 495);
  text("HEALTH:" + tank1.health, width/5-20, 495);
  text("AMO:" + tank1.laserCount, width/5+20, 495);
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
  if (tank1.turretCount = 1) {

    projectiles.add(new Projectile(tank1.x, tank1.y));
  } else if (tank1.turretCount = 2) {
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
  }
}
