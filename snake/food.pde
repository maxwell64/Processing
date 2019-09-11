class Food{
  
  PVector pos;
  
  Food(){
    pos = new PVector(random(width-5),random(height-5));
    
  }
  
  void show(){
    fill(0,0,255);
    ellipse(pos.x,pos.y,5,5);
    
  }
  
  boolean eaten(){
    if (dist(player.pos.x,player.pos.y,pos.x,pos.y) <= 10){
      return true;
    }
    return false;
    
  }  
}
