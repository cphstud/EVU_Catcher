class Board {
  int score;
  int rounds;
  float xPos;
  float yPos;
  float w;
  float h;
  
  Board(float x, float y) {
    score = 0;
    rounds = 0;
    xPos = x;
    yPos = y;
    w=width/10;
    h=height/50;
    
  }
  //TODO: metoder til at sætte score og rounds
  
  void setScore(int faktor) {
     score = score + faktor; 
  }
  
  void setRounds() {
   rounds++; 
  }
  
  
  
  void display() {
    fill(255);
    strokeWeight(4);
    rectMode(CENTER);
    rect(xPos,yPos,w,h);
    strokeWeight(1);
  }
}
