class Player{
  
  PVector pos;
  PVector vel;
  boolean isDead;
  char key;
  int sideLen = 10;
  ArrayList<PVector> moves = new ArrayList<PVector>();
  int len = 1;
  PVector temp = new PVector(0,0);
  
  Player(){
    pos = new PVector(width/4,height/2);
    vel = new PVector(2,0);
    isDead = false;
    
  }
  
  void show(){
    fill(0);
    rect(pos.x,pos.y,sideLen,sideLen);
    if (score > 0){
      for (int i = 1;i <= score;i ++){
        temp = moves.get(step - (i*10));
        rectMode(CENTER);
        rect(temp.x,temp.y,10,10);
      }
    }
    if (isDead == false){
      pos.add(vel);
      checkCrash();
      control();
      moves.add(new PVector(pos.x,pos.y));
        
    }    
  }
  
  void checkCrash(){
    if (pos.x - 5 <= 0 || pos.x + 5 >= width || pos.y - 5 <= 0 || pos.y + 5 >= height){
      isDead = true;
      
    }
  }
  
  void control(){
    if (keyPressed){
      if (keyCode == UP){
        vel.y = -2;
        vel.x = 0;
      }
      if (keyCode == DOWN){
        vel.y = 2;
        vel.x = 0;
      }
      if (keyCode == LEFT){
        vel.x = -2;
        vel.y = 0;
      }
      if (keyCode == RIGHT){
        vel.x = 2;
        vel.y = 0;
      }
    }
  }
}
