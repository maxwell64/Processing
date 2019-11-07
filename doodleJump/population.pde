class Population{
  
  ArrayList<Player> pop = new ArrayList<Player>();
  int bestFitness;
  Player best;
  
  Population(int size){
    for (int i = 0;i < size;i ++){
      pop.add(new Player());
    
    }
  }
  
  void update(){
    for (int i = 0;i < pop.size();i ++){
      if (!pop.get(i).dead){
        pop.get(i).update();
      
      }
    }
  }
  
  void showAll(){
    for (int i = 0;i < pop.size();i ++){
      pop.get(i).show();
      
    }
  }
  
  Player get(int i){
    return pop.get(i);
  }
  
  int size(){
    return pop.size();
  }
  
  void assignFitness(){
    for (int i = 0;i < pop.size();i ++){
      if (pop.get(i).dead){
        pop.get(i).fitness = score;
        
      }
    }
  }
  
  boolean allDead(){
    ///check if all players are dead
    for (int i = 0;i < pop.size();i ++){
      if (!pop.get(i).dead) return false;
      
    }
    return true;
    
  }
  
  Player cloneBest(){
    ///clone the best player in the group
    for (int i = 0;i < pop.size();i ++){
      if (pop.get(i).fitness > bestFitness) best = pop.get(i);
      
    }
    return best;
    
  }
}
    
    
