class Brain{
  
  int in;
  int out;
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Connection> connections =  new ArrayList<Connection>();
  
  Brain(int inputs,int outputs){
    in = inputs;
    out = outputs;
    
    for (i = 0;i < (in + out - 1);i ++){
      nodes.add(new Node(i));
      
      if (i < in){
        nodes.get(i).layer = 0;
        
      }
      else{
        nodes.get(i).layer = 1;
        
      }      
    }
    for (i = 0;i < nodes.size();i ++){
      for (int j = 0;j < nodes.size();j ++){
        if (nodes.get(i).layer + 1 == nodes.get(j).layer){
          connections.add(new Connection(nodes.get(i),nodes.get(j),i*j));
          
        }
      }
    }
  }
}
