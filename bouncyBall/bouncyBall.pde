Ball ball;
Population balls;

void setup(){
  size(500,500);
  balls = new Population(1000);
  
}

void draw(){
  frameRate(60);
  background(255);
  balls.updatePop();
  
}
