class Brain{
  
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Connection> connections = new ArrayList<Connection>();
  ArrayList<Node> network = new ArrayList<Node>();
  int inputs;
  int outputs;
  nodeCounter = 0;
  
  Brain(int in,int out){
    
    inputs = in;
    outputs = out;
    
    for (int i = 0;i < inputs;i ++){
      nodes.add(new Node(nodeCounter));
      nodes.get(nodeCounter).layer = 0;
      nodeCounter ++;
      
    }
    for (int i = 0;i < outputs;i ++){
      nodes.add(new Node(nodeCounter));
      nodes.get(nodeCounter).layer = 1;
      nodeCounter ++;
      
    }
  }
  
  boolean randomNodesBad(int rand1,int rand2){
    if (rand1 == rand2) return true;
    if (nodes.get(rand1).layer >= nodes.get(rand2).layer) return true;
    if (nodes.get(rand1).isConnectedTo(nodes.get(rand2))) return true;
    
    return false;
  }
  
  void makeConnections(){
    for (int i = 0;i < nodes.size();i ++){
      for (int j = 0;j < nodes.size();j ++){
        if (!randomNodesBad(i,j) && !nodes.get(i).isConnectedTo(nodes.get(j))){
          connections.add(new Connection(nodes.get(i),nodes.get(j)));
          
        }
      }
    }
  }
  
  void connect(){
    for (int i = 0;i < nodes.size();i ++){
      nodes.get(i).outputConnections.clear();
      
    }
    for (int i = 0;i < connections.size();i ++){
      connections.get(i).from.outputConnections.add(connections.get(i));
      
    }
  }
}
