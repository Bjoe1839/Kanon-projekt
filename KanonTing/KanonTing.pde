Cannon c;

void setup() {
  size(1400, 600);
  imageMode(CENTER);
  c = new Cannon();
}

void draw() {
  background(255);
  c.move();
  c.display();
  line(0, height-50, width, height-50);
}
