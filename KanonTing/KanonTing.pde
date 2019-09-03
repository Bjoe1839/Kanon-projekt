Cannon c;
ArrayList<CannonBall> balls = new ArrayList<CannonBall>();
PVector gravity;
int floor, chargeSize;
float charge;

void setup() {
  size(1400, 600);
  imageMode(CENTER);
  cursor(CROSS);
  
  c = new Cannon();
  gravity = new PVector(0, 0.2);
  floor = height-50;
  chargeSize = 50;
}

void draw() {
  background(255);
  c.move();
  c.display();
  for (int i = balls.size()-1; i >= 0; i--) {
    balls.get(i).addForce(gravity);
    balls.get(i).addForce(wind(balls.get(i)));
    balls.get(i).move();
    if (!balls.get(i).check()) {
      balls.get(i).display(); //Hvis bolden ikke er uden for skærmen og er blevet slettet skal den vises
    }
  }

  line(0, floor, width, floor);

  if (mousePressed) {
    charge += 0.05;
    if (charge > TWO_PI) charge = TWO_PI;
    strokeWeight(5);
    arc(mouseX, mouseY, chargeSize, chargeSize, -HALF_PI, charge-HALF_PI);
    strokeWeight(1);
  } else {
    charge = 0;
  }
}


void mouseReleased() {
  //Ny bold
  PVector heading = c.direction.copy();
  if (heading.x > 0 && heading.y < 0) {

    heading.normalize();
    heading.mult(charge*5);

    PVector loc = c.location.copy();

    loc.x += cos(c.angle-c.angleOffset)*43;
    loc.y += sin(c.angle-c.angleOffset)*13;

    balls.add(new CannonBall(loc, heading));
  }
}


PVector wind(CannonBall b) {
  //Vindmodstand
  float c = 0.002;
  float speed = b.velocity.mag();
  float dragMagnitude = c * speed * speed;

  PVector drag = b.velocity.copy();
  drag.mult(-1);
  drag.normalize();
  drag.mult(dragMagnitude/2);

  return drag;
}
