PImage start;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
//integer = int 
int w=30,h=30,b=20,dir=2,fx=14,fy=12; // w= width h=height b= block size dir= direction f= food
int [] dx= {0,0,1,-1} ;//down up right left position for the direction
int [] dy= {1,-1,0,0} ;
boolean gamestate= true;
boolean gameover = false;
//int posX;
//int posY;
//int moveX= 0;
//int moveY= 0;

void setup() {
  size (600,600);
  x.add (5); //adding a value to the x and y since array they didnt had a value
  y.add (5);
  start=loadImage ("startImg.jpg");
  
}
void draw(){
  if (gamestate == true) {
    imageMode(CENTER);
  image (start, width/2, height/2);
  }
  else { 
    
  
  background (0);
//  for (int i=0; i <w; i++) 
//  line (i*b, 0, i*b, height);
//  for (int i=0; i <h; i++)
//  line (0, i*b, width, i*b); //code for the background squares, to make the grill appear (map of the game)
  for (int i=0; i <x.size (); i++) {// i = 0 < less than. x.size = q X sea igual a size*le de un tamano
   fill(110,171,122);//body of snake color of the snake
  rect (x.get (i)*b, y.get(i)*b, b, b); // .get es para q coja el array y funcione con el
//  rect(posX, posY, 20, 20); //body of the snake, x, y, largo, ancho.
  }
  fill (154,70,28); //food color 
  ellipse(fx*b,fy*b, b,b); //food position and size
  if (!gameover){ //if the game is not over 
  if (frameCount %8==0) { // 5 frames, at framerate = 60 = 1/2 of a second (how fast the snake moves)
  x.add(0, x.get(0) + dx [dir]); //to add x to the frames or direction
  y.add(0, y.get(0) + dy [dir]);
  if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;  // gameover funtion this is for if the snake hits the borders || = or
  for (int i= 1; i < x.size(); i++) //so we cant eat ourselves
  if (x.get(0)==x.get(i) && y.get(0) == y.get(i)) gameover=true;
  if(x.get(0) == fx && y.get (0)==fy){ // to get the variable x down and give it the value of the food
  fx= (int) random (0,w); // so the food appears randomly in the grid
  fy= (int) random (0,h);
  }
  else {
  x.remove (x.size()-1); //so the square doesnt keep adding, it only shows up as one
  y.remove (y.size()-1);
      }
    }
  } 
    else { //when the game is over
      fill (18,0,255);
      textSize (30);
      textAlign(CENTER);
      text ("GAME OVER. Press Space", width/2,height/2);
      if (keyPressed && key == ' '){ // to restart the game
      x.clear ();
      y. clear (); //to restart the values of x and y
      x.add(5);
      y.add(5); //to restart the game, giving x and y their pre set value again
      gameover = false; //taking off gameover function
      }
    }
  }
}

void mousePressed(){
  gamestate = false;
}
void keyPressed() {
 int newdir=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
 // ? is a ternarty operator, which is a statement that works as a expression

  if (newdir != -1 && (x.size () <= 1 || !(x.get (1) == x.get(0)+dx[newdir] && y.get (1) == y.get(0)+dy[newdir]))) dir= newdir;
}
  // ! is a ternarty operator, which is a statement that works as a expression
 //getting the x and y again so the snake cant go back on itself


//void keyPressed(){
//  if(key == CODED){
//    if(keyCode == LEFT){
//      dir = "left";
//    }
//    if(keyCode == RIGHT){
//      dir = "right";
//    }
//    if(keyCode == UP){
//      dir = "up";
//    }
//    if(keyCode == DOWN){
//      dir = "down";
//    }
//  }
//}
 




