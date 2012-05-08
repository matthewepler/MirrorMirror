import processing.core.*; 
import processing.xml.*; 

import hypermedia.video.*; 
import java.awt.Rectangle; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class MirrorMirror_Final extends PApplet {




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

public void setup(){
 size(720, 480);
 thisShape = new LeShape(0); 
 thatShape = new LeShape(0);
 opencv = new OpenCV( this );
 opencv.capture( width, height, 4 );              
 opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
 smooth();
 
  savedImage = loadImage("me_720.jpg");

}

public void draw(){
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

public void checkFace(){
  opencv.read();
  Rectangle[] faces = opencv.detect( 1.2f, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
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

public PImage renderShapes(){
  thisShape.update();
  thisShape.display(shapeAlpha);
//  thatShape.update();
//  thatShape.display(shapeAlpha);
  int checker = frameCount%255;
  if(checker == 0) adding = !adding;
  if (adding == true){
    shapeAlpha += 2;
  } else {
    shapeAlpha -= 2;
  }
  if(shapeAlpha < 0){
   thisShape = new LeShape(0); 
  }

 PImage thisFrame = get();
 return thisFrame;
}
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
  
  float speed = 0.1f;

  LeShape (int _a) {
    a = _a;
  }

  public void display(int _a) { 
    a = _a;  
    noStroke();
    fill(255, a);
    beginShape();
    curveTightness(-0.25f);
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


  public void update() {
    //    xpos += 0.2;
    text(a, 50, 70);
    leftX -= speed;
    leftY += speed;
    topX += speed;
    topY += speed;
    bottomX += speed;
    bottomY -= speed;
  }

  public PImage captureMask() {
    PImage thisFrame = get();
    return thisFrame;
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "MirrorMirror_Final" });
  }
}
