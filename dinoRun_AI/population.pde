class Population{
  
  int i;
  ArrayList<Player> pop = new ArrayList<Player>();

  Population(float size){
    for (i = 0; i < size ;i ++){
      Player temp = new Player();
      pop.add(temp);
      
    }
  }
  
  void updatePop(){
    if (pop.size() == 0){
      addPlayer();
    }
    movePlayer();
    showPlayer();
    pop.get(0).look();
  }
  
  void addPlayer(){
    Player temp = new Player();
    pop.add(temp);
  }
  
  void showPlayer(){
    for(int i = 0 ; i < pop.size() ; i ++){
      pop.get(i).show();
    }
  }

  void movePlayer(){
    for (i = 0 ; i < pop.size() ; i ++){
      pop.get(0).move(floorHeight);
      pop.get(0).checkCollision();
    }
  }
}
