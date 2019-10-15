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
    
    for (int i = 0;i < in;i ++){
      nodes.add(new Node(i));
      nodes.get(i).layer = 0;
      nodeCounter ++;
      
    }
    
    for (int i = 0;i < outputs;i ++){
      nodes.add(new Node(i + inputs));
      nodes.get(i).layer = 1;
      nodeCounter ++;
      
    }    
  }
  
  void connect(){
    for (int i = 0;i < nodes.size();i ++){
      for(int j = 0;j < nodes.size();j ++){
        if (nodes.get(i).layer < nodes.get(j).layer){
          connections.add(new Connection(random(-1,1),nodes.get(j),nodes.get(i)));
          
        }
      }
    }
  }
  
  void engageNodes(){
    for (int i = 0;i < nodes.size();i ++){
      nodes.get(i).engage();
      
    }
  }
}
