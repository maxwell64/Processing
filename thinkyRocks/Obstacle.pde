class Obstacle
{
  PVector pos;
  int obsW;
  int obsH;
  
  Obstacle(int x, int y, int w, int h)
  {
    pos = new PVector(x,y);
    obsW = w;
    obsH = h;
  }
  
  void show()
  {
    fill(0,0,255);
    rect(pos.x,pos.y,obsW,obsH);
  }
}
  
  
