class Connection{
  
  Node to;
  Node from;
  float weight;
  float output;
  float input;
  int index;
  boolean enabled = true;
  
  Connection(Node nodeFrom,Node nodeTo){
    to = nodeTo;
    from = nodeFrom;
    weight = random(-1,1);
    
  }
}
