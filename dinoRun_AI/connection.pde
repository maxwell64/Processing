class Connection{
  
  float weight;
  Node to;
  Node from;  
  
  Connection(float w, Node nodeTo, Node nodeFrom){
    weight = w;
    to = nodeTo;
    from = nodeFrom;
    
  }
}
