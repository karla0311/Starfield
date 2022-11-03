Heart tim, cherry;
Heart [] hearts = new Heart[155];
int x = 150;

void setup()
{
  size(500,500);
  tim = new Heart();
  cherry = new Heart();
  for(int i = 0; i < hearts.length; i++){
    hearts[i] = new Heart(255,(int)(Math.random()*256),(int)(Math.random()*500),(int)(Math.random()*500));
  }
  hearts[0] = new OddballHeart();
  frameRate(65);
}

void draw()
{
  background(#9acafc);
  tim.show();
  tim.walk();
  cherry.show();
  cherry.walk();
  for(int i = 0; i < hearts.length; i++){
    hearts[i].walk();
    hearts[i].show();
  }
}

void mousePressed(){
  background(#9acafc);
  for(int i = 0; i < hearts.length; i++){
    hearts[i] = new Heart(255,(int)(Math.random()*256),(int)(Math.random()*500),(int)(Math.random()*500));
  }
  hearts[0] = new OddballHeart();
  redraw();
}

class Heart
{
  int myC, myR;
  float myX, myY;
  double myAngle, mySpeed;
  Heart()
  {
    myX = myY = 250;
    myAngle = Math.random()*2*Math.PI;
    myC = color(255, (int)(Math.random()*256),(int)(Math.random()*256));
    myR = 255;
    mySpeed = Math.random()*5;
  }
  
  Heart(color r, color c, float x, float y){
    myR = r;
    myC = c;
    myX = x;
    myY = y;
  }
  void walk()
  {
    myX += + Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed;
    myAngle += 0.05;
    if (myY>550 || myY< -50 || myX>550 || myX< -50) {
      myY=250;
      myX=250;
      mySpeed = Math.random()*3;
    }
    if (myX<250)
      myX--;
    if (myX>250)
      myX++;
    if (myY<250)
      myY--;
    if (myY>250)
      myY++;
  }
  void show()
  {
    fill(#ffffff);
    //right wing
    beginShape();
    curveVertex(myX+20,myY+5);
    curveVertex(myX+20,myY+5);
    curveVertex(myX+25,myY-5); 
    curveVertex(myX+23,myY+10);
    curveVertex(myX+30,myY+15);
    curveVertex(myX+10,myY+20);
    curveVertex(myX+10,myY+20);
    endShape();
    //left wing
    beginShape();
    curveVertex(myX-20,myY+5);
    curveVertex(myX-20,myY+5);
    curveVertex(myX-25,myY-5); 
    curveVertex(myX-23,myY+10);
    curveVertex(myX-30,myY+15);
    curveVertex(myX-10,myY+20);
    curveVertex(myX-10,myY+20);
    endShape();
    //heart
    fill(255,myC,myC);
    beginShape();
    curveVertex(myX,myY); 
    curveVertex(myX,myY);
    curveVertex(myX+10,myY-5);
    curveVertex(myX+20,myY+5); 
    curveVertex(myX,myY+25); 
    curveVertex(myX-20,myY+5);
    curveVertex(myX-10,myY-5);
    curveVertex(myX,myY);
    curveVertex(myX,myY);
    endShape();
  }
}
class OddballHeart extends Heart{ //inherits from Particle
     OddballHeart(){
      myX = myY = 250;
      mySpeed = 1;
      myAngle = Math.random()*2*Math.PI;
      myC = color((int)(Math.random()*256), (int)(Math.random()*256),(int)(Math.random()*256));
      myX += + Math.cos(myAngle)*mySpeed;
      myY += Math.sin(myAngle)*mySpeed;
    }
    void walk(){
      myX += Math.random()*10-5;
      myY += Math.random()*10-5;
      myX += + Math.cos(myAngle)*mySpeed;
      myY += Math.sin(myAngle)*mySpeed;
      myAngle -= 0.1;
    }
    void show(){
      fill(255);
      rect(myX, myY, 50,30);
      fill(0);
      line(myX, myY, myX+25, myY+15);
      line(myX+50, myY, myX+25, myY+15);
    }
  }
