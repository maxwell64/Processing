class Node{

  float output;
  int index;
  int layer = 0;
  float inputSum = 0;
  float outputValue = 0;

  Node(int no){
  index = no;

  }
  
  void engage(){
    if (layer != 0){
      outputValue = sigmoid(inputSum);
      
    }
  }

  float sigmoid(float x){
  return (1 / (1 + exp(x * -1)));

  }
}
