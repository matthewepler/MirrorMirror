class LeShape {

  float xpos, ypos, xSpeed, ySpeed;
  int dim = 100;
  int margin = dim/2; 
  float[] xposA, yposA;
  int arrayLength = 1200;
  int indexNum;


  LeShape (float _x, float _y) {
    xpos = _x;
    ypos = _y;
    xSpeed = 1.4;
    ySpeed = 3.6;
    xposA = new float[arrayLength];
    yposA = new float[arrayLength];
    for (int i=0; i<arrayLength; i++) {
      xposA[i] = xpos;
      yposA[i] = ypos;
    }
  }

  void display() {
    for (int i=0; i<xposA.length-1; i++) {
      xposA[i] = xposA[i+1];
      yposA[i] = yposA[i+1];
    }
    xposA[xposA.length-1] = xpos;
    yposA[yposA.length-1] = ypos;

    for (int i=0; i < xposA.length-1; i++) {
      noStroke();
      fill(0+i*5);
      ellipse(xposA[i], yposA[i], dim, dim);
    }
  }

  void update() {
    xpos += xSpeed;
    ypos += ySpeed;
    if (xpos > width + margin) {
      xpos = 0-margin;
    } else if (xpos < 0 - margin) {
      xpos = width+margin;
    } else if (ypos > height + margin) {
      ypos = 0-margin;
    } else if (ypos < 0 - margin) {
      ypos = height+margin;
    }
  }

  PImage captureMask() {
    PImage thisFrame = get();
    return thisFrame;
  }
}

