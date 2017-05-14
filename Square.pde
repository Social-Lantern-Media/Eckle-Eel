//a class for the bonus squares. Each square that Timmy consumes grants 100 bonus points.
class Square {
  float x, y;   // current position
  float vx, vy;  // velocity
  float w;   //width
  float timer;   // time left before square disappears
  float timerBonus;  //time left before "BONUS!" message disappears
  float dt;  // extinguishing speed
  float a; //rotation angle
  float da; //rotation rate 
  float dtBonus;  //text extinguishing speed
  float spring = 0.05; //ball springiness (for collisions)
  float red = 50;
  float green = 200;
  float blue = 200;
  float aBlue; //
  float daBlue; //rate of color change
  boolean on = false;

  Square() {
  }

  // Initialize squares offscreen (right of canvas)
  void initialize()
  {
    on = true;
    x = random(width+400, width+800); 
    y = random(0, height);
    vx = random(-10, -4); 
    vy = random(-2, 2);
    w = random(10, 55);
    timer = 255;
    timerBonus = 100;
    dt = random(0.1, 5);
    dtBonus = 0;
    a = 90;
    da = 90;
    //da = random(-90.5, 180.3);    
    aBlue = TWO_PI;
    daBlue = radians(2);
  }

  void draw()
  {
    
    //update color
    blue = 140 * (1+sin(aBlue));
    if (!on) return;
    fill(red, green, blue, timer);
    
    //draw squares
    pushMatrix();
    translate(x, y);
    rotate(a);
    noStroke();
    rectMode(CENTER);
    
    /////////////////////////////////////
    rect(0, 0, w, w);
    popMatrix();
  }

  void update()
  {
    // initialize if necessary
    if (!on) { 
      if (random(0, 1) < 0.5) initialize(); 
      return;
    }

    //move squares
    x += vx;
    y += vy;

    //rotate squares
    a += da;

    //update blue color channel
    aBlue += daBlue;

    green = constrain(green, 100, 240);
    blue = constrain(blue, 100, 240);

    //square transparency decay
    timer -= dt;
    timerBonus -= dtBonus;

    //reverse square vy when it hits floor/ceiling
    if (y > height-w || y < w)
    {
      vy = -vy;
    }

    // When square exits screen, re-initialize
    //x + 601 is to ensure reinitialization if 
    //freak collision sends it in positive x direction
    if (x < 0 || x > width+601 || timer < 0) {
      on = false;
    }
  }

  //check for collisions with other squares; rebound, if necessary
  void bounce() {
    for (int i = 0; i < squares.length; i ++) {
      // if this is myself, continue
      if (this == squares[i]) continue;
      // distance between two squares
      float d = dist(x, y, squares[i].x, squares[i].y);
      // minimum distance between two squares
      float md = w+squares[i].w;
      // if I collide with one of them
      if (d < md) {
        // push back in the opposite direction
        float dx = (x - squares[i].x)/d;
        float dy = (y - squares[i].y)/d;
        // check if perfectly overlapping
        if (dx == 0 && dy == 0) { 
          dx = random(-1, 1); 
          dy = random(-1, 1);
        }
        // compute the speed to add
        float s = min(10, spring*(md-d));
        vx += dx*s;
        vy += dy*s;
      }
    }
  }
}

