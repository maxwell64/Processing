Population test;

void setup()
{
  size(500,500);
  test = new Population(400);
  
}

void draw()
{
  background(255);
  test.update();
  test.show();
}
