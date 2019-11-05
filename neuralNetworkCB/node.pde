class Node{
  
  int index;
  int layer;
  float inputSum;
  float output;
  float result;
  ArrayList<Connection> outputConnections = new ArrayList<Connection>();
  PVector drawPos;
  
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
    for (int i = 0;i < outputConnections.size();i ++){
      if (outputConnections.get(i).enabled){
        outputConnections.get(i).to.inputSum += outputConnections.get(i).weight * output;
        
      }
    }
  }
  
  boolean isConnectedTo(Node node){
    if (node.layer == layer){
      return false;
      
    }
    if (node.layer < layer){
      for (int i = 0;i < node.outputConnections.size();i ++){
        if (node.outputConnections.get(i).to == this){
          return true;
          
        }
      }
    }
    else{
      for (int i = 0;i < outputConnections.size();i ++){
        if (outputConnections.get(i).to == node){
          return true;
        }
      }
    }
    return false;
    
  }
  
  Node clone(){
    Node clone = new Node(index);
    clone.layer = layer;
    return clone;
    
  }
}
