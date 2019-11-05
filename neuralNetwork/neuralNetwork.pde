Brain brain;
float[] in = new float[5];

void setup(){
  brain = new Brain(5,3);
  brain.makeConnections();

}

void draw(){
  for (int i = 0;i < in.length;i ++){
    in[i] = random(100);
  }
  brain.feedForward(in);
  println(brain.outputValues);
  println(brain.connections.size());
  println(brain.nodes.size());
  
}
