class Population{
  int size;
  Ball ball;
  Ball[] ballList;
  
  Population(int size){
    ballList = new Ball[size];
    
    for (int i = 0;i < size;i ++){
      ballList[i] = new Ball();
      
    }
  }
  
  void updatePop(){
    for(int i = 0;i < ballList.length;i ++){
      ballList[i].show();
      ballList[i].move();
      
    }
  }
}
