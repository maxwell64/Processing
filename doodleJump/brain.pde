class Brain{
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Connection> connections = new ArrayList<Connection>();
  int i;
  int action;
  float nearestDist;
  Platform nearest;
  float[] sight = new float[4];
  float[] control = new float[3];
  float velY;
  float velX;
  int in;
  int out;
  
  Brain(int inputs,int outputs){
    in = inputs;
    out = outputs;
    for (i = 0;i < inputs;i ++){
      nodes.add(new Node(i));
      nodes.get(i).layer = 0;
      
    }
    for (i = 0;i < outputs;i ++){
      nodes.add(new Node(i + inputs));
      nodes.get(i + inputs).layer = 1;
      
    }
  }
  
  void connect(){
    for (i = 0;i < nodes.size();i ++){
      for (int j = 0;j < nodes.size();j ++){
        if (nodes.get(j).layer > nodes.get(i).layer){
          connections.add(new Connection(nodes.get(i),nodes.get(j)));
          
        }
      }
    }
  }
  
  void engage(){
    for (i = 0;i < nodes.size();i ++){
      nodes.get(i).engage();
    }
  }
  
  void findNearest(){
    for (int j = 0;j < group.size();j ++){
      for (i = 0;i < platforms.size();i ++){
        if (dist(platforms.get(i).posX,platforms.get(i).posY,group.get(j).posX,group.get(j).posY) < nearestDist){
          nearest = platforms.get(i);
          nearestDist = dist(nearest.posX,nearest.posY,group.get(j).posX,group.get(j).posY);
          
        }
      }
    }
  }
  
  void show(){
    fill(255);
    for (i = 0;i < in;i ++){
      ellipse(120 + nodes.get(i).layer * 120,20 + 20 * i,10,10);
    }
    for (i = 0;i < out;i ++){
      ellipse(120 + nodes.get(i + in).layer * 120,20 + 20 * i,10,10);
    }
    fill(0);
    text(connections.size(),120,10);
  }
  
  void look(){
    findNearest();
    sight[0] = velX;
    sight[1] = velY;
    sight[2] = nearest.posX;
    sight[3] = nearest.posY;

  }
  
  void think(){
    connect();
    engage();
    
  }
  
  void act(){
    for (i = 0;i < control.length;i ++){
      if (nodes.get(in + i).output > action){
        action = in + i;
      }
    }
  }    
}
