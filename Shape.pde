class LeShape {

  float xpos;
  float ypos;
  float xSpeed;
  float ySpeed;
  int dim = 100;
  int margin = dim/2; 


  LeShape () {
    xpos = random(1, width);
    ypos = random(1, height);
    xSpeed = 0.4;
    ySpeed = 0.6;
  }

  void display() {
     noStroke();
     fill(255);
     ellipse(xpos, ypos, dim, dim);
  }

  void update() {
    xpos += xSpeed;
    ypos += ySpeed;
    if (xpos > width + margin) {
      xSpeed *= -1;
    } else if (xpos < 0 - margin) {
      xSpeed *= -1;
    } else if (ypos > height + margin) {
      ySpeed *= -1;
    } else if (ypos < 0 - margin) {
      ySpeed *= -1;
    }
  }
  
  PImage captureMask() {
    PImage thisFrame = get();
    return thisFrame;
  }
  
}

