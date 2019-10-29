class Node{
  
  int index;
  int layer;
  float inputSum;
  float output;
  float result;
  
  Node(int in){
    index = in;
    
  }
  
  float sigmoid(float in){
    return (1 / (1 + exp(- in)));
    
  }
  
  void engage(){
    if (layer != 0){
      output = sigmoid(inputSum);
      
    }
  }
}
