Cannon c;
ArrayList<CannonBall> balls = new ArrayList<CannonBall>();

void setup() {
  size(1400, 600);
  imageMode(CENTER);
  c = new Cannon();
}

void draw() {
  background(255);
  c.move();
  c.display();
  for (CannonBall b : balls) {
    b.display();
  }
  line(0, height-50, width, height-50);
}


void mousePressed() {
  balls.add(new CannonBall(c.location));
}
