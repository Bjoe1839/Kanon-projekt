class CannonBall {
  PImage cannonBall;
  int size;
  
  PVector location, velocity, acceleration;
  float angle, aVelocity, aAcceleration;
  
  CannonBall(PVector loc, PVector dir) {
    cannonBall = loadImage("CannonBall.png");
    size = 30;
    
    location = loc.copy();
    velocity = dir.copy();
    acceleration = new PVector();
  }
  
  void move() {
    
    
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    if (location.y >= floor-size/2) {
      location.y = floor-size/2;
      velocity.y *= -1;
      
      //friktion
      velocity.y += 2;
      velocity.x -= 0.1;
      if (velocity.y > 0) velocity.y = 0;
      if (velocity.x < 0) velocity.x = 0; 
    }
  }
  
  boolean check() {
    if (location.x > width+size/2 || location.x < -size/2) {
      balls.remove(this);
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    image(cannonBall, location.x, location.y, size, size);
  }
  
  void addForce(PVector force) {
    acceleration.add(force);
  }
}
