class Node{
  
  float inputSum;
  float output;
  ArrayList<Connection> outputConnections = new ArrayList<Connection>();
  int index;
  int layer;
  boolean engaged = false;
  PVector pos;
  
  Node(int n){ 
    index = n;
    
  }
  
  void engage(){
    ///calculates the output of the node
    if (layer != 0){
      output = sigmoid(inputSum);
      
    }
    engaged = true;
    for (int i = 0;i < outputConnections.size();i ++){
      if (outputConnections.get(i).enabled){
        outputConnections.get(i).nodeTo.inputSum += outputConnections.get(i).weight * output;
        
      }
    }   
  }
  
  boolean isConnectedTo(Node node){
    ///checks if two nodes are connected
    if (node.layer == layer) return false;
    if (node.layer < layer){
      for (int i = 0;i < node.outputConnections.size();i ++){
        if (node.outputConnections.get(i).nodeTo == this) return true;
        
      }
    }
    else{
      for (int i = 0;i < outputConnections.size();i ++){
        if (outputConnections.get(i).nodeTo == node) return true;
        
      }
    }
    return false;
    
  }
  
  float sigmoid(float n){
    ///fairly self-explanatory
    return (1 / (1 + exp(-n)));
    
  }
}
