class Population
{
  Dot[] dots;
  float fitnessSum;
  int gen = 1;
  int bestDot;
  int minStep = 400;
  
  Population(int size)
  {
    dots = new Dot[size];
    
    for (int i = 0;i < size;i ++)
    {
      dots[i] = new Dot();
      
    }
  }
  
  void show()
  {
    for (int i = 1;i < dots.length;i ++)
    {
      dots[i].show();
      
    }
    dots[0].show();
  }
  
  void update()
  {
    for (int i = 0;i < dots.length;i ++)
    {
      if (dots[i].brain.step > minStep)
      {
        dots[i].dead = true;
      }
      if (dots[i].pos.x > obstacle.pos.x && dots[i].pos.x < obstacle.pos.x + obstacle.obsW && dots[i].pos.y > obstacle.pos.y && dots[i].pos.y < obstacle.pos.y + obstacle.obsH)
      {
        dots[i].dead = true;
      }
      dots[i].update();
      
    }
  }
  
  void calculateFitness()
  {
    for (int i = 0;i < dots.length;i ++)
    {
      dots[i].calculateFitness();
      
    }
  }
  
  boolean allDead()
  {
    for (int i = 0;i < dots.length;i ++)
    {
      if (!dots[i].dead && !dots[i].reachedGoal)
      {
        return false;
        
      }
    }
    return true;
  }
  
  void naturalSelection()
  {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    
    calculateFitnessSum();
    
    newDots[0] = dots[bestDot].freshRock();
    newDots[0].isBest = true;
    for (int i = 1;i < newDots.length;i ++)
    { 
      //select parent based on fitness
      Dot parent = selectParent();
      //make baby
      newDots[i] = parent.freshRock();
      
    }
    dots = newDots.clone();
    gen ++;
  }
  
  void calculateFitnessSum()
  {
    fitnessSum = 0;
    for (int i = 0;i < dots.length;i ++)
    {
      fitnessSum += dots[i].fitness;
    }
  }
  
  Dot selectParent()
  {
    float rand = random(fitnessSum);
    
    float runningSum = 0;
    
    for (int i = 0;i < dots.length;i ++)
    {
      runningSum += dots[i].fitness;
      if (runningSum > rand)
      {
        return dots[i];
      }
    }
    return null;
  }
  
  void mutantRocks()
  {
    for (int i = 1;i < dots.length;i ++)
    {
      dots[i].brain.mutate();
      
    }
  }
  
  void setBestDot()
  {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0;i < dots.length;i ++)
    {
      if (dots[i].fitness > max)
      {
        max = dots[i].fitness;
        maxIndex = i;
        
      }
    }
    bestDot = maxIndex;
    
    if (dots[bestDot].reachedGoal)
    {
      minStep = dots[bestDot].brain.step;
    }
    
  }
}
