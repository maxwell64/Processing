class Brain{
  
  int inputs;
  int outputs;
  int layers = 2;
  ArrayList<Node> nodes = new ArrayList<Node>;
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
}
