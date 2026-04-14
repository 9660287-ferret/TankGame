//CD | apr 14 2026 | TankGame
PImage bg;
Tank tank1;

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
}

void draw() {
  background(#5a5a4a);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank1.display();
}

void keyPressed() {
  if (keyCode == RIGHT){
  tank1.move();
}
  if (keyCode == LEFT){
  tank1.move();
}
}
