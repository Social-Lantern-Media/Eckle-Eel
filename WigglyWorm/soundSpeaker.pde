void initBalls() {
  
  
  centre = new MovingBall(width/2, height/2, palette[int(random(3))]);
  arounds = new MovingBall[numOfObjects];
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height), palette[i%3] );
  }
}


/*
 * MovingBall class
 *
 * Represents a moving ball that moves in a single direction
 *
 */
class MovingBall {

  float x, y;        // position
  float tx, ty;      // target in x and y
  float step, inc;
  float radius;
  color col;
   
  
  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float _x, float _y, color _col) {
    x = _x;
    y = _y;
    col = _col;

    reset();
  }
  
  // run
  // calls move() followed by display()
  // 
  void run() {
    this.move();
    this.display();
  }

  // move
  // move the ball in the desired direction
  //
  void move() {

    
    step -= inc;

    if (step < 0) {
      x = tx;
      y = ty;
      reset();
    }

    x = lerp(tx, x, step); 
    y = lerp(ty, y, step);

    checkBounds();
  }

  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
  
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      x = width/2;
      y = height/2;
      reset();
    }
  }


  void reset() {
    step = 1;
    inc = random(0.01);
    radius = random(2, 10);
    tester = true; 
    
   

    int numDirections = 7;
    float angleUnit = TWO_PI/numDirections; 
    direction = (int) random(numDirections);

    tx = x + radius*cos(direction * angleUnit);
    ty = y + radius*sin(direction * angleUnit);
  }

  // display method
  //
  //
  void display() {
    
  
    
    noStroke();
   
    //rectMode(CENTER);
    fill(0, 30);
    image(backgroundicon,tx, ty, hr, wr);
    fill(col, 60);
    image(backgroundicon,x, y, hr, wr);
  }
}


