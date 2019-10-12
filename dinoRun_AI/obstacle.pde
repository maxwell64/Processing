class Obstacle{

  float posX;
  int w;
  int h;
  int type;

  Obstacle(int t){
    posX = width;
    type = t;
    switch(type){
      case 0:
        w = 30;
        h = 60;
        break;
      case 1:
        w = 40;
        h = 80;
        break;
    }
  }

  void showObstacle(){
    fill(0);
    switch(type){
      case 0:
        rect(posX,floorHeight-h,w,h);
        break;
      case 1:
        rect(posX,floorHeight-h,w,h);
        break;
    }
  }

  void move(){
    posX -= speed;
  }
}
