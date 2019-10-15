class Node{

  float output;
  int index;
  int layer = 0;
  float inputSum = 0;
  float outputValue = 0;
  ArrayList<Connection> outConnections = new ArrayList<Connection>();

  Node(int no){
  index = no;

  }
  
  void engage(){
    if (layer != 0){
      output = sigmoid(inputSum);
      
    }
    
    for (int i = 0;i < outConnections.size();i ++){
      if (outConnections.get(i).enabled){
        outConnections.get(i).to.inputSum += outConnections.get(i).weight * outputValue;
        
      }
    }    
  }

  float sigmoid(float x){
  return (1 / (1 + exp(x * -1)));

  }
}
