class Connection{
  
  Node to;
  Node from;
  float weight;
  float output;
  float input;
  int index;
  
  Connection(Node nodeFrom,Node nodeTo,int ref){
    to = nodeTo;
    from = nodeFrom;
    index = ref;
    weight = random(-1,1);
    
  }
}
