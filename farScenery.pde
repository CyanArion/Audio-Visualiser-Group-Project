class farCacti //background scenery, behind the car
{
  float cx;
  float cy;
  float size;
  float speed;
  
  void update()
  {
    cx += speed;
    
    if (cx > width)
    {
      cx = random(-width, 0); //spawns the cacti off screen to scroll in
      cy = random(430, 480); //give some height variation
      size = random(20.0f, 40.0f); 
      speed = 3;
    }
  }
  
  void render()
  {
    image(cactus, cx, cy, size, size);
  }
}