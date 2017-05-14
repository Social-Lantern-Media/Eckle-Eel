//this class defines Timmy's body, which is comprised of joints, links, and his head

class WormJoint {
  float cx, cy;        // rest position
  float x, y;
  float vx=0, vy=0;    // velocity in the two directions   
  float r;        // joint radius
  float k = 0.08;      // spring constant
  float d = 0.75;      // damping
  float hg = 0.5;  // horizontal gravity
  float red = 50;    //color channels
  float green = 200;
  float blue = 200;
  float a;      //blue color change
  float da;    //rate of blue color change

  // Initialize a worm joint at rest position (x0,y0)
  WormJoint(float x0, float y0, float r0)
  {
    x = x0;
    y = y0;
    r = r0;
    a = TWO_PI;
    da = radians(2);
  }

  void draw()
  {
    //update color
    blue = 140 * (1+sin(a));
    fill(red, green, blue);
    
    //draw worm joints
    stroke(red, green, blue); 
    strokeWeight(2);
    line(cx, cy, x, y);
    fill(red, green, blue); 
    
    //draw worm head
    noStroke();
    ///butt
    //rect(mouseX, mouseY+2, 5*r, 5*r);
   
    ///head
   // rect(x, y, 5*r, 5*r);
    image(body,x-20, y-10,10*r, 10*r);
     image(head,mouseX, mouseY, 10*r, 10*r); 
   
   x1 = x; 
    y1 = y;
  }

  // Update the spring with a new center
  void update(float ncx, float ncy)
  {
    // set the new center
    cx = ncx; 
    cy = ncy;

    // usual spring stuff
    vx -= k * (x-cx); 
    vy -= k * (y-cy); 
    vx -= hg;
    vx *= d; 
    vy *= d;
    x += vx; 
    y += vy;
    a += da;
  
    green = constrain(green, 100, 240);
    blue = constrain(blue, 100, 240);

    //re-shrink joints after he eats a bonus square
    r *= 0.95;
    if (r < 4) r = 4;
    }
  }

