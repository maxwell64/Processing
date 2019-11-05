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
    output = sigmoid(inputSum);
    engaged = true;
    
  }
  
  boolean isConnectedTo(Node node){
    if (node.layer == layer) return false;
    
    if (node.layer < layer){
      for (int i = 0;i < node.outputConnections.size();i ++){
        if (node.outputConnections.get(i).to == this) return true;
        
      }
    }
    else{
      for (int i = 0;i < outputConnections.size();i ++){
        if (outputConnections.get(i).to == node) return true;
        
      }
    }
    return false
    
  }
  
  float sigmoid(float n){
    return (1 / (1 + math.exp(-n)));
    
  }
}
