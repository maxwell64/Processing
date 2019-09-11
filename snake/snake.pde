Player player;
Food food;
int score = 0;
int step = 0;

void setup(){
  frameRate(60);
  size(500,500);
  player = new Player();
  food = new Food();
  rectMode(CENTER);
  
}

void draw(){
  background(255);
  player.show();
  food.show();
  if (food.eaten() == true){
    score ++;
    food = new Food();
    
  }
  keepScore();
  printMoves();
  step ++;
  
}

void keepScore(){
  fill(0,0,255);
  textSize(30);
  text("Score = " + score, width/2,50);
  
}

void printMoves(){
  fill(0,0,255);
  textSize(25);
  text(player.moves.size(),width/2,100);
  
}
