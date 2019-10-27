class Node{  
  float inputSum;
  float output;
  int index;
  int layer;
  
  Node(int n){
    index = n;
    
  }
  
  float sigmoid(float in){
    return 1 / (1 + exp(in * -1));
    
  }
  
  void engage(){
    output = sigmoid(inputSum);
    
  }
}
