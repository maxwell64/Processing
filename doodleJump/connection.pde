class Connection{
  
  Node nodeFrom;
  Node nodeTo;
  float weight;
  boolean enabled = true;
  
  Connection(Node from,Node to,float w){
    nodeFrom = from;
    nodeTo = to;
    weight = w;
    
  }
}
