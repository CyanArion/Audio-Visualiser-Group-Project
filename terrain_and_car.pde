PImage cactus;


void setup()
{
  size(1000, 600);
  background(#B3E8FF);
  
  cactus = loadImage("cactus.png"); //used a simple cactus image from google. Source unknown, I couldnt find an artist to credit.
  
  
  for (int i = 0 ; i < farCactii.length ; i ++) //array for background cacti
  {
    farCactii[i] = new farCacti();
    farCactii[i].cx = random(-width, 0);
    farCactii[i].cy = random(430, 480);
    farCactii[i].speed = 3;
    farCactii[i].size = random(20.0f, 40.0f);
  }
  
  for (int i = 0 ; i < foreground.length ; i ++) //array for foreground cacti
  {
    foreground[i] = new closeScenery();
    foreground[i].cx = random(-width, 0);
    foreground[i].cy = random(500, height);
    foreground[i].speed = 10;
    foreground[i].size = random(100.0f, 150.0f);
  }
  
}

float cx = 200; //temporary values. Will be changed to variables.
float cy = 430; //temporary values. Will be changed to variables.

int cactusCount = 20;
farCacti[] farCactii = new farCacti[cactusCount];

int FGcount = 10;
closeScenery[] foreground = new closeScenery[FGcount];

void draw()
{
  
   
  drawLandscape();
  
  for (int i = 0 ; i < farCactii.length ; i ++)
  {
    farCactii[i].update();
    farCactii[i].render();
  }
  
  drawCar1();
  
  for (int i = 0 ; i < foreground.length ; i ++)
  {
    foreground[i].update();
    foreground[i].render();
  }
  
  colourShift();
  
}

void drawLandscape() //renders a mountain range in the background with perlin noise.
{
  fill(255, 0, 255);
  float noiseScale = 0.01;
  for (int x=0; x < width; x++)
  {
    float noiseVal = noise((0+x)*noiseScale, 600*noiseScale);
    stroke(#6E253C);
    line(x, 300+noiseVal*100, x, height);
  }
  
  noStroke(); 
  fill(#EB712F);
  rect(0, height/8*6, width, height/8*2); //draws the orange terrain
  
  fill(#59484F);
  rect(0, height/8*7, width, height/8); //draws the road
  
}

float carX = 500;
float carY = 500;

void drawCar1()
{
  //Interior
  stroke(0);
  strokeWeight(3);
  fill(0);
  line(carX, carY + 5, carX - 5, carY - 18);
  strokeWeight(1);
  fill(10);
  ellipse(carX + 75, carY - 30, 20, 30);
  ellipse(carX + 80, carY - 10, 30, 20);
  ellipse(carX + 10, carY - 10, 10, 10);
  quad(carX + 90, carY + 5, carX + 110, carY + 5, carX + 120, carY - 35, carX + 100, carY - 33);

  // Lights
  stroke(255);
  fill(2555, 255, 100);
  ellipse(carX - 180, carY + 18, 10, 18);
  fill(255,50,50);
  rect(carX + 320, carY + 14, 10, 15);
  
  // Roof
  stroke(0);
  strokeWeight(1);
  fill(#C25E4F);
  quad(carX + 180, carY, carX + 250, carY, carX + 160, carY - 50, carX + 120, carY - 55);
  quad(carX + 130, carY - 55, carX + 130, carY - 50, carX + 20, carY - 52, carX + 20, carY - 55);
  strokeWeight(3);
  stroke(10);
  line(carX + 120, carY, carX + 123, carY - 48);
  line(carX - 30, carY, carX + 20, carY - 53);
  
  // Body
  // Front
  stroke(0);
  strokeWeight(1);
  
  rect(carX - 100, carY - 10, 25, 20);
  fill(#C25E4F);
  quad(carX, carY - 10, carX - 180, carY + 2, carX - 180, carY + 50, carX, carY +62);
  quad(carX - 160, carY + 50, carX - 170, carY + 50, carX - 180, carY + 60, carX - 180, carY + 60);
  rect(carX - 190, carY + 30, 40, 8);
  
  
  // Rear
  stroke(0);
  strokeWeight(1);
  fill(#C25E4F);
  quad(carX + 160, carY - 10, carX + 330, carY + 1, carX + 320, carY + 50, carX +160, carY + 62);
  line(carX + 170, carY + 40, carX + 175, carY + 30);
  line(carX + 180, carY + 40, carX + 185, carY + 30);
  rect(carX + 300, carY + 30, 30, 8);
  
  // Middle
  stroke(0);
  strokeWeight(1);
  fill(#75191C);
  rect(carX - 30,carY - 10, 190, 70);
  stroke(130);
  strokeWeight(2);
  line(carX + 120, carY + 1, carX + 140, carY);
  // Star Decal
  stroke(250);
  fill(250);

  
 
  // Front Wheel
  stroke(0);
  strokeWeight(1);
  fill(50);
  ellipse(carX - 100, carY + 50, 80, 80);
  fill(150);
  ellipse(carX - 100, carY + 50, 60, 60);
  noFill();
  strokeWeight(4);
  arc(carX - 100, carY + 50, 50, 50, 0, PI / 3.0);
  arc(carX - 100, carY + 50, 40, 40, 0, PI / 3.0);
  arc(carX - 100, carY + 50, 30, 30, 0, PI / 3.0);
  arc(carX - 100, carY + 50, 50, 50, PI, PI+QUARTER_PI);
  arc(carX - 100, carY + 50, 40, 40, PI, PI+QUARTER_PI);
  arc(carX - 100, carY + 50, 30, 30, PI, PI+QUARTER_PI);
  
  // Rear Wheel
  stroke(0);
  strokeWeight(1);
  fill(50);
  ellipse(carX + 230, carY + 50, 80, 80);
  fill(150);
  ellipse(carX + 230, carY + 50, 60, 60);
  noFill();
  strokeWeight(4);
  arc(carX + 230, carY + 50, 50, 50, 0, PI / 3.0);
  arc(carX + 230, carY + 50, 40, 40, 0, PI / 3.0);
  arc(carX + 230, carY + 50, 30, 30, 0, PI / 3.0);
  arc(carX + 230, carY + 50, 50, 50, PI, PI+QUARTER_PI);
  arc(carX + 230, carY + 50, 40, 40, PI, PI+QUARTER_PI);
  arc(carX + 230, carY + 50, 30, 30, PI, PI+QUARTER_PI);

  strokeWeight(1);
}

// Car Frame 2
void drawCar2()
{
    //Interior
  stroke(0);
  strokeWeight(3);
  fill(0);
  line(carX, carY + 5, carX - 5, carY - 18);
  strokeWeight(1);
  fill(10);
  ellipse(carX + 75, carY - 26, 20, 30);
  ellipse(carX + 80, carY - 8, 30, 20);
  ellipse(carX + 10, carY - 8, 10, 10);
  quad(carX + 90, carY + 5, carX + 110, carY + 5, carX + 120, carY - 35, carX + 100, carY - 33);

  // Lights
  stroke(255);
  fill(2555, 255, 100);
  ellipse(carX - 180, carY + 18, 10, 18);
  fill(255,50,50);
  rect(carX + 320, carY + 14, 10, 15);
  
  // Roof
  stroke(0);
  strokeWeight(1);
  fill(190);
  quad(carX + 180, carY, carX + 250, carY, carX + 160, carY - 50, carX + 120, carY - 55);
  quad(carX + 130, carY - 55, carX + 130, carY - 50, carX + 20, carY - 52, carX + 20, carY - 55);
  strokeWeight(3);
  stroke(10);
  line(carX + 120, carY, carX + 123, carY - 48);
  line(carX - 30, carY, carX + 20, carY - 53);
  
  // Body
  // Front
  stroke(0);
  strokeWeight(1);
  fill(210);
  rect(carX - 120, carY - 28, 50, 20);
  fill(0);
  ellipse(carX - 118, carY - 18, 3, 11);
  fill(180);
  rect(carX - 100, carY - 8, 25, 20);
  fill(60);
  quad(carX, carY - 10, carX - 180, carY + 2, carX - 180, carY + 50, carX, carY +62);
  quad(carX - 160, carY + 50, carX - 170, carY + 50, carX - 180, carY + 60, carX - 180, carY + 60);
  rect(carX - 190, carY + 30, 40, 8);
  
  
  // Rear
  stroke(0);
  strokeWeight(1);
  fill(60);
  quad(carX + 160, carY - 10, carX + 330, carY + 1, carX + 320, carY + 50, carX +160, carY + 62);
  line(carX + 170, carY + 40, carX + 175, carY + 30);
  line(carX + 180, carY + 40, carX + 185, carY + 30);
  rect(carX + 300, carY + 30, 30, 8);
  
  // Middle
  stroke(0);
  strokeWeight(1);
  fill(30);
  rect(carX - 30,carY - 10, 190, 70);
  stroke(130);
  strokeWeight(2);
  line(carX + 120, carY + 1, carX + 140, carY);
  // Star Decal
  stroke(250);
  fill(250);

  
 
  // Front Wheel
  stroke(0);
  strokeWeight(1);
  fill(50);
  ellipse(carX - 100, carY + 50, 80, 80);
  fill(150);
  ellipse(carX - 100, carY + 50, 60, 60);
  noFill();
  strokeWeight(4);
  arc(carX - 100, carY + 50, 45, 45, HALF_PI, PI);
  arc(carX - 100, carY + 50, 35, 35, HALF_PI, PI);
  arc(carX - 100, carY + 50, 25, 25, HALF_PI, PI);
  arc(carX - 100, carY + 50, 45, 45, PI+HALF_PI, TWO_PI);
  arc(carX - 100, carY + 50, 35, 35, PI+HALF_PI, TWO_PI);
  arc(carX - 100, carY + 50, 25, 25, PI+HALF_PI, TWO_PI);
  
  // Rear Wheel
  stroke(0);
  strokeWeight(1);
  fill(50);
  ellipse(carX + 230, carY + 50, 80, 80);
  fill(150);
  ellipse(carX + 230, carY + 50, 60, 60);
  noFill();
  strokeWeight(4);
  arc(carX + 230, carY + 50, 45, 45, HALF_PI, PI);
  arc(carX + 230, carY + 50, 35, 35, HALF_PI, PI);
  arc(carX + 230, carY + 50, 25, 25, HALF_PI, PI);
  arc(carX + 230, carY + 50, 45, 45, PI+HALF_PI, TWO_PI);
  arc(carX + 230, carY + 50, 35, 35, PI+HALF_PI, TWO_PI);
  arc(carX + 230, carY + 50, 25, 25, PI+HALF_PI, TWO_PI);

  strokeWeight(1);
}

float RShift = 0;
float GShift = 0; //THESE 3 values represent the opacity of the colour.
float BShift = 0;

/*the colours can be controlled using the following keys
z - increases red tint
x - increases blue tint
c - increases green tint

b - decreases red tint
n - decreses blue tint
m - decreases green tint

*/

void colourShift() //this is my favourite part of the code, as it changes the colours and softly blurs the sketch to add an almost foggy effect.
{
  fill(255, 0, 0, RShift); //the 3 large blocks that are the colour. 
  rect(0,0, width, height);
  
  fill(0, 255, 0, GShift);
  rect(0,0, width, height);
  
  fill(0, 0, 255, BShift);
  rect(0,0, width, height);

  if (keyPressed)
    {
      if (key == 'z')
      {
        RShift++;
        if (RShift >= 80)
        {
          RShift = 80;
        }
      }   
      
      if (key == 'x')
      {
        BShift++;
        if (BShift >= 80)
        {
          BShift = 80;
        }
      }
      
      if (key == 'c')
      {
        GShift++;
        if (GShift >= 80)
        {
          GShift = 80;
        }
      }
      
      if (key == 'b')
      {
        RShift++;
        if (RShift <= 0)
        {
          RShift = 0;
        }
      }   
      
      if (key == 'n')
      {
        BShift++;
        if (BShift <= 0)
        {
          BShift = 0;
        }
      }
      
      if (key == 'm')
      {
        GShift--;
        if (GShift <= 0)
        {
          GShift = 0;
        }
      }
   }
   
   
   
     
   }