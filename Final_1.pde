int totalShapes = 10;
LeShape[] allShapes;
PImage savedImage;
PImage thisFrame;

void setup(){
 size(720, 480); 
 allShapes = new LeShape[totalShapes];
 for(int i = 0; i<allShapes.length; i++){
  allShapes[i] = new LeShape(); 
 }
}

void draw(){
 savedImage = loadImage("me_720.jpg");
 savedImage.filter(GRAY);
 thisFrame = renderShapes();
 savedImage.mask(thisFrame);
 //savedImage.blend(thisFrame, 0, 0, width, height, 0, 0, width, height, DARKEST);
  image(savedImage, 0, 0);
  //image(thisFrame, 0, 0);


 
}

PImage renderShapes(){
 fill(0);
 rect(0,0,width, height);
 for(int i=0; i<allShapes.length; i++){
  LeShape thisShape = allShapes[i];
  thisShape.update();
  thisShape.display(); 
 } 
 PImage thisFrame = get();
 return thisFrame;
}
