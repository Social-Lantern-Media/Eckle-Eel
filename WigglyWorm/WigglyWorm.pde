/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/143139*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/********************************

 Use the mouse to control Timmy the Tapeworm.
 The longer that Timmy evades the red antibiotics, the more points he gains...
 But the antibiotics gradually multiply in number, and Timmy grows longer 
 and longer, making survival progressively more difficult.
 
 Timmy can snack on green nutrients (squares) to gain bonus points. 
 He can also "explode" the orange probiotics (triangles), which destroy any antibiotics 
 in their immediate vicinity, granting additional bonus points.
 
 ********************************/

//import sound library
import ddf.minim.*;
import ddf.minim.analysis.*;

PImage backgroundicon; 
PImage backgroundimage; 
PImage titleimage; 
PImage knockout; 

PImage head;
PImage body; 

  int lag = 0;
  
   float hr =  random(20,40)  ;
   float wr =  random(20,40) ;

int highgrowth = 0;
int numBubbles = 40;
Bubble[] bubbles;

float x1;
  float y1; 

//GLOBAL VARAIBLES
//the three game states
int menu = 1;
int playing = 2;
int lost = 3;

//game state constant
int gameState;

//scoring variables
int score;
int hiScore;
int scoreUpdateBalls;
int scoreUpdateTriangles;
int scoreUpdateJoints;

//create font for menus and score
PFont font;
PFont fontBonus;
color fontColor;

//starting number of balls
int nBalls;
int nJoints;
int lives; 

boolean penetrated = false; 
boolean buffer = false; 
boolean start; 
boolean ready; 

//sound control
boolean muted = false;
int gain;


//Create up to 12 joints, but begin with just 6 (see gameInit) 
WormJoint[] joints = new WormJoint[22];

//Create up to 100 balls, but begin with just 10
Ball[] balls = new Ball[100];

//Create 8 bonus squares
Square[] squares = new Square[8];

//Create 1 explosive triangle
Triangle triangle = new Triangle();

//Import audio library
Minim minim;

//Instantiate various sound effects, soundtrack
AudioPlayer bloop1, bloop3;
AudioPlayer pop1, pop2;
AudioPlayer gameOver;
AudioPlayer soundtrack;

//Instantiate beat detection objects
//BeatDetect beat;
//BeatListener bl;

//Instantiate sound on/off PNG icons (drawn in Illustrator)
PImage speakerOn;
PImage speakerOff;

MovingBall centre;
MovingBall[] arounds;
color[] palette = {
  #FA4747, #F049FA, #49B7FA
};

int numOfObjects;
boolean tester = false; 


void setup()
{

  //canvas and project setup
  size(800, 600);
  smooth();
  //frameRate(60);
  noStroke();
numOfObjects = 100;
  initBalls();
 // background(10,162,115);
  backgroundicon = loadImage("testimage.png"); 
  backgroundimage = loadImage("background.png"); 
  titleimage = loadImage("titlepage.png");
  knockout = loadImage("knockout.png"); 
  
  head = loadImage("head.png");
  body = loadImage("body.png");  
  
  //initialize the different fonts
  font = createFont("ArialRoundedMTBold.vlw", 20);
  fontBonus = createFont("BadaBoomBB", 48);

  fontColor = color(0, random(100, 255), random(100, 240));  
  textAlign(CENTER);

 bubbles = new Bubble[numBubbles];
    for (int i = 0; i < numBubbles; i++) {
        bubbles[i] = new Bubble();
    }
    
  


  //initialize the game (see global function)
  gameInit();
}

void draw()
{
 

 
  
  //background(29,178,132);
  
 //if (frameCount%50==0) {
 //   fill(0, 15);
 //   noStroke();
 //   rect(0, 0, width, height);
 // }

 


  //conditionally draw game modes
  switch(gameState)
  {

    //THIS IS THE IN-GAME STATE
  case 2:
  image(backgroundimage,0,0); 
  //  noCursor();
    //draw, update worm joints, balls, squares
  
    drawObjects();
    
   
    
      for (int i = 0; i < bubbles.length; i++) {
        bubbles[i].update();
        bubbles[i].render();
        if ( bubbles[i].loc.y < -50) {
            bubbles[i].reset();
        }
    }

    //check for collisions between worm and balls, squares;
    //make changes to score or game state if necessary
    collisions();

    //update score; add new balls and worm joints if necessary.
    scoreUpdate();

    //draw score, high score text in lower corners
    scoreText();

    //listen for beat, and make squares, triangle pulse w/ kick and snare
   // beatDetect();

    break;

    //END GAME STATE
  case 3:
   // noCursor();
    image(backgroundimage,0,0); 
  //centre.run();
  //for (int i=0; i < arounds.length; i++ ) {
  //  arounds[i].run();
 // }
    //draw end game text
    gameOverText();

    break;

    //MENU STATE
  case 1:
   // noCursor();
  
  //  centre.run();
  //for (int i=0; i < arounds.length; i++ ) {
 //   arounds[i].run();
  //}
   if( penetrated == false) {    
    //Draw and update background wiggly worm
    for (int i=0; i<nJoints; i++) joints[i].draw();

    // Recenter first joint at mouse position
    joints[0].update(mouseX, mouseY);

    // Recenter each following joint at preceding joint
    for (int i=1; i<nJoints; i++)
      joints[i].update(joints[i-1].x, joints[i-1].y);
   }
   
   if( penetrated == true) { 
      //Draw and update background wiggly worm
    for (int i=0; i<nJoints-1; i++) joints[i].draw();

    // Recenter first joint at mouse position
    joints[0].update(mouseX, mouseY);

    // Recenter each following joint at preceding joint
    for (int i=1; i<nJoints-1; i++)
      joints[i].update(joints[i-1].x, joints[i-1].y);
   }
    //draw main menu text
     image(titleimage,0,0); 
     
     if (mousePressed) {
       
        image(backgroundimage,0,0); 
    menuText ();
   
     }
     
    start = false; 
    
   

    break;
  }
}

//if in menu state, mouse click begins game
//if in end game state, mouse click restarts game
void mousePressed()
{
 
 if (gameState == menu && start == true)
  {
    highgrowth = 0;
    gameState = playing;
  }
  else if (gameState == lost)
  {
    start = false;
   
    initBalls();
    gameInit();
  }
}

void mouseClicked( ) {
  
  if (gameState == menu && start == false) {
  
  }
}

void mouseReleased () {
 
  start = true; 
  
}



