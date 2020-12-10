class Catcher {
  // egenskaber
  float xPos;
  float yPos;
  int catcherColor;
  float catcherRadius;

  // konstruktør

  Catcher() {
    catcherRadius = 10;
    xPos = width/2;
    yPos = height - (2*catcherRadius);
  }

  void setPos(float x, float y) {
    xPos=x;
    yPos=y;
  }

  // metoder

  boolean interSect(Drop drop) {
    boolean killedDrop = false;
    float mDist = dist(xPos, yPos, drop.xPos, drop.yPos);
    if (mDist < (catcherRadius+drop.dropRadius)) {
      
      if (catcherRadius > drop.dropRadius) {
        killedDrop = true;
        /*
        catcherRadius = 10 + ((catcherRadius + 1)%100);
        drop.suicide();
        */
        return killedDrop;
      } else {
        //return killedDrop;
        
        catcherRadius--;   
      }
      if (catcherRadius < 0) {
        noLoop();
      }
      println(mDist + " w rad " + catcherRadius);
    }
    return killedDrop;
  }

  void display() {
    colorMode(RGB);
    fill(120, 100, 100);
    circle(xPos, yPos, catcherRadius);
    colorMode(HSB);
  }
}
