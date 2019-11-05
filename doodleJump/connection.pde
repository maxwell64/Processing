class Connection{
  
  Node nodeFrom;
  Node nodeTo;
  float weight;
  boolean enabled = true;
  
  Connection(Node from,Node to){
    
    nodeFrom = from;
    nodeTo = to;
    weight = random(-1,1);
    
  }
}
