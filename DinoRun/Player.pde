class Player
{
  float playerX;
  float playerY;
  int w = 35;
  int h = 70;
  int velY = 0;
  int gravity = 1;
  
  Player()
  {
    playerX = width/6;
    playerY = height/2 - h/2;
  }
  
  void show()
  {
    fill(255,0,0);
    rectMode(CENTER);
    rect(playerX,playerY,w,h);
  }
  
  void move(float surface)
  {
    applyGravity(surface);
    if (keyPressed == true)
    {
      jump(surface);
    }
  }
  
  void applyGravity(float surface)
  {
    if (playerY + h/2 < surface)
    {
      velY += gravity;
      playerY += velY;
    }
    if (playerY + h/2 >= surface)
    {
      velY = 0;
    }
  }
  
  void jump(float surface)
  {
    velY -= 5;
    playerY += velY;
  }
}
