int obstacleTimer = 0;
float speed = 5;
int score = 0;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

int height = 720;
int width = 1080;

boolean showNothing = false;
int floorHeight = height/2;

float playerX = width/6;

float minimumObGap = 50;
float randomObGap;

boolean dead = false;
Population players = new Population(1);

void setup(){
  frameRate(60);
  size(1080,720);
}

void draw(){
  if (!showNothing){
    if (!dead){
      gameScreen();
      players.updatePop();
      updateObstacles();
      if (score > 0 && score % 10 == 0 && speed < 9.5){
        speed += 1.5;
      }
    }
    minimumObGap = 250/speed;
    randomObGap = random(1000/speed);
    
  }
}

void gameScreen(){
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0,floorHeight,width,floorHeight);
  text(score,360,580);
  text(obstacles.size(),360,600);
  text(speed,360,620);
  
}

void updateObstacles(){
  obstacleTimer ++;
  moveObstacles();
  if (obstacleTimer > minimumObGap + randomObGap){
    addObstacle();
    obstacleTimer = 0;
  }
  showObstacles();
}

void moveObstacles(){
  for (int i = 0;i < obstacles.size();i ++){
    obstacles.get(i).move();
    if (obstacles.get(i).posX < 0){
      obstacles.remove(i);
      score ++;
    }
  }
}

void addObstacle(){
  int obType = floor(random(2)) * 0;
  Obstacle temp = new Obstacle(obType);
  obstacles.add(temp);
}

void showObstacles(){
  for (int i = 0;i < obstacles.size();i ++){
    obstacles.get(i).showObstacle();
  }
}
