class LeShape {

  float xpos;
  float ypos;
  float[] xposArray;
  float[] yposArray;
  float xSpeed;
  float ySpeed;
  int dim = 100;
  int margin = dim/2; 
  int alphaLevel;
  int shapeLength = 20;


  LeShape () {
    xpos = random(1, width);
    ypos = random(1, height);
    xposArray = new float[shapeLength];
    yposArray = new float[shapeLength];
    for(int i=1; i<xposArray.length; i++){
     xposArray[i] = 0;
     yposArray[i] = 0; 
     xposArray[0] = random(1, width);
     yposArray[0] = random(1, width); 
    }
    xSpeed = 0.4;
    ySpeed = 0.6;
    alphaLevel = 255;
  }

  void display() {
     noStroke(); 
     for(int i=0; i<xposArray.length-1; i++){
        fill(255, alphaLevel/(1+(i*10)));
        ellipse(xposArray[i], yposArray[i], dim, dim);
     }
     if(alphaLevel < 0){
      alphaLevel = 255; 
     }
  }

  void update() {
    xpos += xSpeed;
    ypos += ySpeed;
    xposArray[xposArray.length-1] = xpos;
    yposArray[xposArray.length-1] = ypos;
    if (xpos > width + margin) {
      xSpeed *= -1;
    } else if (xpos < 0 - margin) {
      xSpeed *= -1;
    } else if (ypos > height + margin) {
      ySpeed *= -1;
    } else if (ypos < 0 - margin) {
      ySpeed *= -1;
    } 
    for(int i=0; i<xposArray.length-1; i++){
       xposArray[i] = xposArray[i+1];
       yposArray[i] = yposArray[i+1];
     }  
  }
  
  PImage captureMask() {
    PImage thisFrame = get();
    return thisFrame;
  }
  
}

