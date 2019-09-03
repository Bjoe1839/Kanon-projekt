class Cannon {
  PImage cannon;
  
  PVector location;
  PVector mouse, direction;
  int xOffSet, yOffSet; //punktet kanonen skal rotere om er hjulets midtpunkt og ikke midten af kanonen
  float angle, angleOffset;

  Cannon() {
    cannon = loadImage("Cannon.png");
    
    location = new PVector(100, height-100);
    xOffSet = 4;
    yOffSet = 31;
    
    angleOffset = 0.375;
  }


  void move() {
    pushMatrix();
    mouse = new PVector(mouseX, mouseY);
    direction = PVector.sub(mouse, location);
    angle = atan2(direction.y, direction.x);
    angle = constrain(angle, -HALF_PI, 0);
    
    angle += angleOffset; //kanonen skal pege vandret ved 0 grader
    
    translate(location.x-xOffSet, location.y+yOffSet);
    rotate(angle);
  }

  void display() {
    image(cannon, xOffSet, -yOffSet, 100, 100);
    popMatrix();
  }
}
