class Connection{
  
  Node from;
  Node to;
  float weight;
  float output;
  
  Connection(Node nodeFrom,Node nodeTo){
    from = nodeFrom;
    to = nodeTo;
    weight = random(-1,1);
    output = from.output * weight;
    
  }
}
