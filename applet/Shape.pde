class LeShape {

  float xpos;
  float ypos;
  int Xboundary = width/2 - 70;
  int Yboundary = 70;
  float a;
  float leftX = Xboundary;
  float leftY = random(Yboundary, height-Yboundary);
  float rightX = width-Xboundary;
  float rightY = random(Yboundary, height-Yboundary);
  float topX = random(leftX, rightX);
  float topY = Yboundary;
  float bottomX = random(leftX, rightX);
  float bottomY = height-Yboundary;
  
  float speed = 0.1;

  LeShape (int _a) {
    a = _a;
  }

  void display(int _a) { 
    a = _a;  
    noStroke();
    fill(255, a);
    beginShape();
    curveTightness(-0.25);
    curveVertex(leftX, leftY);
    curveVertex(leftX, leftY);
    curveVertex(topX, topY);
//    curveVertex(rightX, rightY);
    curveVertex(bottomX, bottomY);
    curveVertex(leftX, leftY);
    curveVertex(topX, topY);
    curveVertex(topX, topY);
    endShape();
  }


  void update() {
    //    xpos += 0.2;
    text(a, 50, 70);
    leftX -= speed;
    leftY += speed;
    topX += speed;
    topY += speed;
    bottomX += speed;
    bottomY -= speed;
  }

  PImage captureMask() {
    PImage thisFrame = get();
    return thisFrame;
  }
}

