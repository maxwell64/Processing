Ball ball;

void setup(){
  size(500,500);
  ball = new Ball();
  
}

void draw(){
  frameRate(60);
  background(255);
  updateBall();
  
}

void updateBall(){
  ball.show();
  ball.move();
  
}
