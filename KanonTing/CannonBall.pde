class CannonBall {
  PImage cannonBall;
  
  PVector location;
  
  CannonBall(PVector loc) {
    cannonBall = loadImage("CannonBall.png");
    
    location = loc.copy();
  }
  
  
  void display() {
    image(cannonBall, location.x, location.y);
  }
}
