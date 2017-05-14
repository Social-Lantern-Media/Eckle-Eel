
 
    
 public class Bubble
{
    PVector loc;
    float   speed;
    float   radius;
    
   
    Bubble()
    {
     

        loc = new PVector(  x1 , y1);
        speed = random(0.5, 3);
        radius = random( 0.1,0.8 );
    }
     
    void update()
    {
        loc.y -= speed;
    }
     
    void render()
    {
          
      
      stroke(#E6F523);
        fill(#F7D239);
        for (int i = 1; i < 3; i++) {
            rect( loc.x, loc.y, i * radius * 0.2, i * radius * 0.2 );
        }
    }
     
    void reset()
    {
        loc.x = x1;
        loc.y =y1;
       speed = random(0.5, 3);
        radius = random( 0.1,0.8 );
    }
     
}
