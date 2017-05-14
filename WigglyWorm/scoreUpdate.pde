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
    
    
    //nJoints =  nJoints +1;
    addJoint();
    
        
    scoreUpdateJoints++;
    println("addjoint joints score" + nJoints);
  }
  
  if (penetrated == true) {
  removeJoint(); 
println("joint removed by penatraton"+ nJoints); 

}

//if (nJoints <1) {
//  lives = lives -1;  
//}
 
}

//create an additional ball every 1000 points
void addBall() {
  balls[nBalls] = new Ball();
  nBalls++;
}

//create an additional joint every 2000 points
void addJoint() {
  //penetrated = false;
  joints[nJoints] = new WormJoint(mouseX, mouseY, 4);
  lives = lives +1;
  highgrowth ++; 
  
 // nJoints++;
  nJoints = nJoints+1;
  println("addjoint joints" + nJoints);
  println("addjoint lives" + lives);
}

void removeJoint() {
  joints[nJoints] = new WormJoint(mouseX, mouseY, 4);
  println("addjoint joints" + nJoints);//lives = lives -1; 
  println("addjoint lives" + lives);
}
