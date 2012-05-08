
import hypermedia.video.*;
import java.awt.Rectangle;
OpenCV opencv;
boolean faceHere;
int faceCounter = 0;
int faceFile;
boolean newFaceAvailable;

ArrayList<PImage> allFaces = new ArrayList();

PImage savedImage;
PImage thisFrame;
LeShape thisShape;
LeShape thatShape;
int shapeAlpha = 0;
boolean adding = true;

void setup(){
 size(720, 480);
 thisShape = new LeShape(0); 
 thatShape = new LeShape(0);
 opencv = new OpenCV( this );
 opencv.capture( width, height, 4 );              
 opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
 smooth();
 
  savedImage = loadImage("me_720.jpg");

}

void draw(){
 background(0);
 checkFace();
 if(newFaceAvailable == true){
   savedImage = loadImage("face" + (faceFile-1) + ".tif");
   newFaceAvailable = false;
 }
 savedImage.filter(GRAY);
 thisFrame = renderShapes();
 savedImage.mask(thisFrame);
 //savedImage.blend(thisFrame, 0, 0, width, height, 0, 0, width, height, DARKEST);
 image(savedImage, 0, 0);
 fill(255);
 text(frameCount, 50, 50);
}

void checkFace(){
  opencv.read();
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  if(faces.length > 0){
    println("faces > 0!!");
   faceHere = true; 
   faceCounter++;
   text(faceCounter,100,100);
   if (faceCounter > 20){
    newFaceAvailable = true;
    image(opencv.image(), 0, 0);
    save("face" + faceFile + ".tif");
    println("FACE SAVED!!");
    faceFile++;
   }
  }
  else {
    faceCounter = 0;
    faceHere = false;
    newFaceAvailable = false;
  }
  println("faceCounter = " + faceCounter);
  //newFaceAvailable = false;
}

PImage renderShapes(){
  thisShape.update();
  thisShape.display(shapeAlpha);
//  thatShape.update();
//  thatShape.display(shapeAlpha);
  int checker = frameCount%255;
  if(checker == 0) adding = !adding;
  if (adding == true){
    shapeAlpha += 1;
  } else {
    shapeAlpha -= 1;
  }
  if(shapeAlpha < 0){
   thisShape = new LeShape(0); 
  }

 PImage thisFrame = get();
 return thisFrame;
}
