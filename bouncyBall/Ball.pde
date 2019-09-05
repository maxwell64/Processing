class Ball{
  
  PVector vel;
  PVector pos;
  int size;
  
  Ball(){
    size = 10;
    vel = new PVector(0,0);
    pos = new PVector(width/2,height/2);
    
  }
  
  void show(){
    fill(0,0,255);
    ellipse(pos.x,pos.y,size,size);
    
  }
  
  void move(){
    if(vel.x == 0 && vel.y == 0){
      vel.x = random(-5,5);
      vel.y = random(-5,5);
    }
    else{
      pos.add(vel);
      bounce();
    }
  }
  
  void bounceX(){
    vel.x *= -1;
    
  }
  
  void bounceY(){
    vel.y *= -1;
    
  }
  
  void bounce(){
    if(pos.x - size/2 <= 0 || pos.x + size/2 >= width){
      bounceX();
    }
    if(pos.y - size/2 <= 0 || pos.y + size/2 >= height){
      bounceY();
    }
    
  }
}
