int frameRate = 60;

int obstacleTimer = 0;
float speed = 5;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Player> players = new ArrayList<Player>();

int height = 720;
boolean showNothing = false;
int floorHeight = height/2;

int minimumObGap = 50;
float randomObGap;

void setup()
{
  frameRate(60);
  size(1080,720);
  int floorHeight = height/2;
}

void draw()
{
  if (!showNothing)
  {
    gameScreen();
  }
}

void gameScreen()
{
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0,height/2,width,height/2);
  updatePlayer();
  updateObstacles();
}

void updateObstacles()
{
  obstacleTimer ++;
  moveObstacles();
  randomObGap = random(200);
  if (obstacleTimer > minimumObGap + randomObGap)
  {
    addObstacle();
    obstacleTimer = 0;
  }
  showObstacles();
}

void moveObstacles()
{
  for (int i = 0;i < obstacles.size();i ++)
  {
    obstacles.get(i).move();
    if (obstacles.get(i).posX < 0)
    {
      obstacles.remove(i);
    }
  }
}

void addObstacle()
{
  int obType = floor(random(2));
  Obstacle temp = new Obstacle(obType);
  obstacles.add(temp);
}

void showObstacles()
{
  for (int i = 0;i < obstacles.size();i ++)
  {
    obstacles.get(i).showObstacle();
  }
}

void updatePlayer()
{
  if (players.size() == 0)
  {
    addPlayer();
  }
  movePlayer();
  showPlayer();
}

void addPlayer()
{
  Player temp = new Player();
  players.add(temp);
}

void showPlayer()
{
  players.get(0).show();
}

void movePlayer()
{
  players.get(0).move(floorHeight);
}


  
