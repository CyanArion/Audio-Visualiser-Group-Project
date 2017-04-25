class closeScenery //the foreground scenery, in front of the car
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
      cx = random(-width, 0); //spawns cacti off screen
      cy = random(540, height); // gives height variation
      size = random(100.0f,150.0f); //gives size variation
      speed = 10;
    }
  }
  
  void render()
  {
    image(cactus, cx, cy, size, size);
  }
}