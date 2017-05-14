void menuText ()
{
  //display start messages
  textAlign(CENTER);
  fill(#FFFFFF);
  textFont(fontBonus, 100);
  text("Net Node Ned", width/2, height/2 - 60);

  textFont(font, 16);
  fill(#FFFFFF);
  text("Help Ned navigate Net State by selecting it and Surf Ned around the screen. ", 
  width/2, height/2);
  text("Connect with clean data *Insert File* to increase your byzts points", 
  width/2, height/2 + 30);
    text("Connect with user certified records *Insert Bleet* to destroy nearby data pollution", 
  width/2, height/2 + 60);
  text("Avoid meta data pollution *Insert Image* inflating netspace !!!", 
  width/2, height/2 + 90);

  textFont(font, 14);
  text("Touch anywhere to START", width/2, height/2 + 160);

  //display high score in corner
  textFont(font, 20);
  textAlign(RIGHT);
  text("HIGH SCORE: " + hiScore, (width - 20), (height - 30));
}

