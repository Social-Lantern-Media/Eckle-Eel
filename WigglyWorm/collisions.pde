//global function that handles all collisions
void collisions()
{
  //check for collisions between worm and balls
  //if there are any collisions, game over!
  for (int j=0; j<nBalls; j++)
  {
    for (int i=0; i<nJoints; i++)
    {
      if (dist(joints[i].x, joints[i].y, balls[j].x, balls[j].y) <= joints[i].r + balls[j].r)
      {
        
        penetrated = true; 
         
        score = score - 1000; 
        for (int h=0; h<nBalls; h++)
        {

          //remove ball (it will be reinitialized)
          balls[h].on = false;
          penetrated = false; 
          
        }
        
        
        lives = lives -1;  
        nJoints =  nJoints -1;
        
        image(knockout,0,0);
        fill(255);
        rect(0, 0, 2000, 2000);
     
        /////////////////////////////////////
    
   
        
      } 

      if (score < 0) { 
        background(255, 5, 5); 
        
        gameState = lost;
        println(nJoints);//lives = lives -1; 
  println(lives);
  println("lost to score");
      }
      if ( lives < 0) {
        background(255, 5, 5); 
       
        
      ////////////////\888  //gameState = lost;
        println(nJoints);//lives = lives -1; 
  println(lives);
  println("lost to lives");//lives = lives -1; 
  
      }
      if ( nJoints <= 0) {
        background(255, 5, 5); 
       
        gameState = lost;
        println(nJoints);//lives = lives -1; 
  println(lives);
  println("lost to njoints");
      }
    }
  }


  //check for collisions between worm head and visible bonus squares
  for (int j=0; j<squares.length; j++)
  {
    if (dist(mouseX, mouseY, squares[j].x, squares[j].y) <= 20)
    {
      if (squares[j].timer > 40)
      {
        //play bloop sound

        //add 100 bonus points, extinguish+reinitialize square
        
        score += 50;
        squares[j].timer = 50;
        squares[j].dt = 30;
        squares[j].w += 20;
        squares[j].timerBonus = 50;
        squares[j].dtBonus = 1;
         
        // show bonus text
        fill((squares[j].timerBonus));
        textAlign(CENTER);
        fill(#F1F540); 
        textFont(fontBonus, 38);
        text("+100", (mouseX), (mouseY));

        //temporarily swell wormjoints
        for (int i=0; i<nJoints; i++)
        {
          joints[i].r += 5;
        }
      }
    }
  }

  //check for collisions between balls and explosive triangles
  if (dist(mouseX, mouseY, triangle.x, triangle.y) <= triangle.l*2 && triangle.timer == 255)
  {  

    //trigger explosion behavior (see Triangle class) 
    triangle.explode = true;
   
    //buffer = true;
    
  } 
}

