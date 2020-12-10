class Board {
  int score;
  int rounds;
  float xPos;
  float yPos;
  float w;
  float h;
  PFont f;

  Board(float x, float y) {
    score = 0;
    rounds = 0;
    xPos = x;
    yPos = y;
    w=width/10;
    h=height/50;
    f = createFont("Arial", 16);
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
    rect(xPos, yPos, w*2, h*2);
    strokeWeight(1);
    textFont(f, 16);
    fill(0);
    text("Score: "+score, xPos, yPos);
  }
}
