class Platform{
  
  float posX;
  float posY;
  float w = 100;
  float h = 10;
  float speed = 2;
  
  Platform(){
    posX = random(0,width - w);
    posY = 0;
    
  }
  
  void show(){
    fill(0);
    rect(posX,posY,w,h);
    
  }
  
  void update(){
    posY += speed;
    
  }
}
