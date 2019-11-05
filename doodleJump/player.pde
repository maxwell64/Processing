class Player{
  float velX;
  float velY;
  float posX;
  float posY;
  int dimensions = 15;
  Brain brain;
  int fitness = 0;
  boolean dead = false;
  float[] sights = new float[7];
  float[] decisions = new float[3];
  int finalDecision = 0;
  Platform nearestPlatform;
  float nearestPlatformDist = 1000;
  
  Player(){
    posX = width/2;
    posY = 0;
    velY = 0;
    velX = 0;
    brain = new Brain(sights.length,decisions.length);
    
  }
  
  void show(){
    fill(0,255,0);
    ellipse(posX,posY,dimensions,dimensions);
    
  }
  
  void update(){
    posX += velX;
    posY += velY;
    velY += gravity;
    if (velY > 20){
      velY = 20;
      
    }
    if (velY < -20){
      velY = -20;
      
    }
    fitness ++;
    look();
    think();
    act();
  } 
  
  void left(){
    velX = -2;
    
  }
  
  void right(){
    velX = 2;
    
  }
  
  void none(){
    velX = 0;
    
  }
  
  void findNearest(){
    if (platforms.size() > 0);{
      for (int i = 0;i < platforms.size();i ++){
        if (dist(platforms.get(i).posX,platforms.get(i).posY,posX,posY) < nearestPlatformDist){
          nearestPlatform = platforms.get(i);
          
        }
      }   
    }  
  }
  
  void look(){
    findNearest();
    sights[0] = nearestPlatformDist;
    if (platforms.size() > 0){
      sights[1] = nearestPlatform.posX;
      sights[2] = nearestPlatform.posY;
    }
    sights[3] = posX;
    sights[4] = posY;
    sights[5] = velX;
    sights[6] = velY;
    
  }
  
  void think(){
    brain.connect();
    brain.feedForward(sights);
    for (int i = 0;i < decisions.length;i ++){
      decisions[i] = brain.outputValues[i];
      
    }    
  }
  
  void act(){
    int temp = 0;
    for (int i = 0;i < decisions.length;i ++){
      if (decisions[i] > temp){
        finalDecision = i;
        
      }
    }
    switch(finalDecision){
      case 0:
      none();
      break;
      case 1:
      left();
      break;
      case 2:
      right();
      break;
      
    }
  }     
}
