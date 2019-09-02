Population test;
Obstacle obstacle;
PVector goal = new PVector(400,10);

void setup()
{
  size(800,800);
  test = new Population(1000);
  obstacle = new Obstacle(height/8,width/3,600,10);
  
}

void draw()
{
  frameRate(60);
  background(255);
  fill(255,0,0);
  ellipse(goal.x,goal.y,10,10);
  
  
  if (test.allDead())
  {
    test.calculateFitness();
    test.naturalSelection();
    test.mutantRocks();
    
  }
  else
  {
    test.update();
    test.show();
    obstacle.show();
  }
}
