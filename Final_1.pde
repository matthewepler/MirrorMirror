float xpos;
float ypos;
float xSpeed;
float ySpeed;
int dim = 60;
int margin = dim/2;

void setup(){
 size(720, 480); 
 xpos = random(1, width);
 ypos = random(1, height);
 xSpeed = 0.4;
 ySpeed = 0.6;
}

void draw(){
 background(0);
 noStroke();
 fill(255);
 ellipse(xpos, ypos, dim, dim); 
 xpos += xSpeed;
 ypos += ySpeed;
 if(xpos > width + margin){
  xpos = 0 - margin;
 } else if (xpos < 0 - margin){
  xpos = width + margin;
 } else if (ypos > height + margin){
  ypos = 0 - margin; 
 } else if (ypos < 0 - margin){
  ypos = height + margin; 
 }
}
