void gameOverText()
{
    
  //display "GAME OVER" messages
    textAlign(CENTER);
    fill(245,20,0);

    textFont(fontBonus, 24);
    text("SYSTEM CRASH - Rebooting Security Imagery and Audio Buffers -", (width/2), (height/2) - 40);
    
    fill(255);
    textFont(font, 20);
    text("Corrupted Encryption Entry detected.", width/2, height/2 + 20); 
    text("Last known version unknown @ 404 script exception error." , width/2, height/2 + 40);
    text(" Local Hosting: " + 2 + " Extension Domain Nodes: " + highgrowth , width/2, height/2+70);
    
    fill(255);
    textFont(font, 20);
    text("Residual driver SCORE of :  " + score + " Byzts", width/2, height/2 + 90);
    
    fill(255);
    textFont(font, 20);
    text("TAP anywhere to REPLAY game", width/2, height/2 + 135);

    //display score in left corner
    textAlign(LEFT);
    textFont(font, 20);
    text("SCORE BYZTS: " + score, 20, (height - 30));
    

    //display high score in corner
    textAlign(RIGHT);
    text("HIGHEST SCORE BYZTS: " + hiScore, (width - 20), (height - 30));
}
