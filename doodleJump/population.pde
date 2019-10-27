class Population{
  
  ArrayList<Player> pop = new ArrayList<Player>();
  
  Population(int size){
    for (int i = 0;i < size;i ++){
      pop.add(new Player());
    
    }
  }
  
  void update(){
    for (int i = 0;i < pop.size();i ++){
      pop.get(i).update();
      
    }
  }
  
  void showAll(){
    for (int i = 0;i < pop.size();i ++){
      pop.get(i).show();
      
    }
  }
  
  void engage(){
    for (int i = 0;i < pop.size();i ++){
      pop.get(i).brain.connect();
      pop.get(i).brain.engage();
      pop.get(i).brain.show();
      
    }
  }
  
  Player get(int i){
    return pop.get(i);
  }
  
  int size(){
    return pop.size();
  }
}
    
    
