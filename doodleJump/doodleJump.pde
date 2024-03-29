Population group;
float gravity = 0.5;
ArrayList<Platform> platforms = new ArrayList<Platform>();
int platformTimer = 0;
int score;
int nearestX;

void setup(){
  size(360,540);
  frameRate(60);
  group = new Population(5);
  
}

void draw(){
  gameScreen();
  platformTimer ++;
  score ++;
  
}

void gameScreen(){
  background(255);
  if (!group.allDead()){
    group.update();
    group.showAll();
    
  }
  if (group.allDead()){
    score = 0;
    platformTimer = 0;
    platforms.clear();
    group = new Population(5);
    
  }
  updatePlatforms();
  checkCollision();
  text(platforms.size(),30,50);
  text(score,30,30);

}

void updatePlatforms(){
  for (int i = 0;i < platforms.size();i ++){
    if (platforms.get(i).posY > height){
      platforms.remove(i);
    }
    platforms.get(i).update();
    platforms.get(i).show();
  }
  if (platforms.size() < 5 && platformTimer > 100){
    platforms.add(new Platform());
    platformTimer = 0;
  }
  if (score == 0){
    platforms.add(new Platform());
  }
}

void checkCollision(){
  for (int i = 0;i < platforms.size();i ++){
    for (int j = 0;j < group.size();j ++){
      if (group.get(j).velY > 0 && platforms.get(i).posX < group.get(j).posX && group.get(j).posX < platforms.get(i).posX + 100 
      && platforms.get(i).posY <= group.get(j).posY && group.get(j).posY < platforms.get(i).posY + 10){
        group.get(j).velY *= -1;
      }
      if (group.get(j).posX <= 0){
        group.get(j).posX = 0;
        
      }
      if (group.get(j).posX >= width){
        group.get(j).posX = width;
        
      }
      if (group.get(j).posY >= height){
        group.get(j).dead = true;
        
      }
    }
  }
}
