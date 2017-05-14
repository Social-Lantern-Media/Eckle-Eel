void scoreUpdate()
{
  //update score each frame
  //score++;


  //update, set high score if current score is greater than previous high score
  hiScore = score > hiScore ? score : hiScore;

  //increase level and number of balls every 2000 points
  if (score / 1000 > scoreUpdateBalls)
  {
    addBall();
    scoreUpdateBalls++;
  }

  else if (score / 2000 > scoreUpdateJoints)
  {   
    
    
    
    addJoint();
    scoreUpdateJoints++;
    println(nJoints);
  }
}

//create an additional ball every 1000 points
void addBall() {
  balls[nBalls] = new Ball();
  nBalls++;
}

//create an additional joint every 2000 points
void addJoint() {
  joints[nJoints] = new WormJoint(mouseX, mouseY, 4);
  nJoints++;
}

