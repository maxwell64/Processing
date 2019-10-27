class Player{
  
  float velX;
  float velY;
  float posX;
  float posY;
  int dimensions = 15;
  Brain brain;
  
  Player(){
    posX = width/2;
    posY = 0;
    velY = 0;
    velX = 0;
    brain = new Brain(4,3);
    
  }
  
  void show(){
    fill(0,255,0);
    ellipse(posX,posY,dimensions,dimensions);
    
  }
  
  void update(){
    posX += velX;
    posY += velY;
    velY += gravity;
    if (posY >= height){
      velY *= -1;
      
    }
    if (velY > 20){
      velY = 20;
      
    }
    if (velY < -20){
      velY = -20;
      
    }
  } 
  
  void left(){
    velX -= 2;
    
  }
  
  void right(){
    velX += 2;
    
  }
  
  void none(){
    velX = 0;
    
  }
}
