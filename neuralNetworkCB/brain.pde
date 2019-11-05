class Brain{
  
  int inputs;
  int outputs;
  int layers = 2;
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Connection> connections = new ArrayList<Connection>();
  int nodeCounter = 0;
  
  Brain(int in,int out){
    inputs = in;
    outputs = out;
    
    for (int i = 0;i < inputs;i ++){
      nodes.add(new Node(nodeCounter));
      nodeCounter ++;
      nodes.get(i).layer = 0;
      
    }
    for (int i = 0;i < outputs;i ++){
      nodes.add(new Node(nodeCounter));
      nodes.get(nodeCounter).layer = 1;
      nodeCounter ++;
      
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
  
  boolean fullyConnected(){
    ///checks if the network is fully connected
    int maxConnections = 0;
    int[] nodesPerLayer = new int[layers];
    
    for (int i = 0;i < nodes.size();i ++){
      nodesPerLayer[nodes.get(i).layer] += 1;
      
    }
    for (int i = 0;i < layers - 1;i ++){
      int nodesNext = 0;
      
      for (int j = i + 1;j < layers;j ++){
        nodesNext += nodesPerLayer[j];
        
      }
      maxConnections += nodesPerLayer[i] * nodesNext;
      
    }
    if (maxConnections == connections.size()){
      return true;
      
    }
    return false;
  }
  
  void addConnection(){
    ///adds connections between unconnected nodes
    if (fullyConnected()){
      println("Connection failed");
      return;
      
    }
    int randomNode1 = floor(random(nodes.size()));
    int randomNode2 = floor(random(nodes.size()));
    
    if (randomNodesBad(randomNode1,randomNode2)){
      randomNode1 = floor(random(nodes.size()));
      randomNode2 = floor(random(nodes.size()));
      
    }
    if (nodes.get(randomNode1).layer > nodes.get(randomNode2).layer){
      ///switches the nodes if they are the wrong way around
      int temp = randomNode1;
      randomNode1 = randomNode2;
      randomNode2 = temp;
      
    }
    connections.add(new Connection(nodes.get(randomNode1),nodes.get(randomNode2)));
    connect();
    
  }
  
  boolean randomNodesBad(int rand1,int rand2){
    ///checks if random nodes are already connected, in the same layer, or the same node
    if (nodes.get(rand1).layer == nodes.get(rand2).layer) return true;
    if (rand1 == rand2) return true;
    if (nodes.get(rand1).isConnectedTo(nodes.get(rand2))) return true;
    
    return false;
  }
    
}
