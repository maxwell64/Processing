class Player
{
  float playerX;
  float playerY;
  int w = 35;
  int h = 70;
  int velY = 0;
  int velYMax = -10;
  int gravity = 1;
  float distanceToObstacle = 100000;
  int nearestObstacleIndex;
  int nearestObstacleHeight;
  
  Player(){
    playerX = width/6;
    playerY = height/2 - h;
  }
  
  void show(){
    fill(255,0,0);
    rect(playerX,playerY,w,h);
  }
  
  void move(float surface){
    applyGravity(surface);
    keepScreen(surface);
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
  }
  
  void jump(float surface){
    if (playerY + h == surface){
      velY = -30;
      playerY += velY;
    }
  }
  
  void keepScreen(float surface)
  {
    if (playerY + h >= surface)
    {
      velY = 0;
      playerY = surface - h;
    }
    if (velY < velYMax)
    {
      velY = velYMax;
    }
    if (playerY < 0)
    {
      playerY = 0;
    }
  }
  
  void checkCollision(){
    for (int i = 0 ; i < obstacles.size() ; i ++){
      if (playerX + w >= obstacles.get(i).posX && playerY >= obstacles.get(i).h + 360/2
      && playerX <= obstacles.get(i).posX + obstacles.get(i).w){
        dead = true;
      }
    }
  }
  
  void look(){
    for (int i = 0 ; i < obstacles.size() ; i ++){
      if (dist(playerX + w,0,obstacles.get(i).posX,0) < distanceToObstacle && playerX + w/2 < obstacles.get(i).posX){
        distanceToObstacle = dist(playerX + w/2,0,obstacles.get(i).posX,0);
        nearestObstacleIndex = i;
        nearestObstacleHeight = obstacles.get(i).h;
      }
      if (distanceToObstacle <= 10){
        distanceToObstacle = 1000;
      }
    }
    text(distanceToObstacle,20,20);
    text(speed,20,40);
    text(playerY,20,60);
  }
  
  void think(){
    
  }
  
  void act(){
    
  }
}
