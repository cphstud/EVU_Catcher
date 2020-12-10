Drop drop;
Catcher catcher;
Board board;
Drop[] drops;
float maxRad, maxSpeed, mouseRad;
int unit, numOfDrops, dropFrequency, dropCounter;

void setup() {
  size(800, 600);
  numOfDrops=20;
  mouseRad = 8;
  maxRad = 70;
  maxSpeed = 4;
  dropFrequency = 30;
  dropCounter=10;
  
  catcher = new Catcher();
  board = new Board(25,height-50);
  drops = new Drop[numOfDrops];
  initArr();
  colorMode(HSB);
}

void draw() {
  background(255);
  
  if (frameCount%dropFrequency == 0) {
    
    if (dropCounter == numOfDrops) {
      board.setRounds();
      dropCounter = 10;
      initArr();
    }
    dropCounter++;
  }
  
  catcher.setPos(mouseX, mouseY);
  catcher.display();
  for (int i = 0; i<dropCounter; i++) {
    if (catcher.interSect(drops[i])) {
      println("done ..");
      float newRadius = 10 + ((catcher.catcherRadius + 1)%100);
      catcher.catcherRadius = newRadius;
      drops[i].suicide();
      board.setScore(1);
    } 
    
    for (int j=0; j<dropCounter; j++) {
      if (j!=i) {
        drops[i].interSect(drops[j]);
      }
    }
    drops[i].move();
    drops[i].display();
    board.display();
    println("Present score: " + board.score + " in round " + board.rounds);
    // TODO: fill board with text-label
  }
}

void initArr() {
  
  for (int i=0; i<numOfDrops; i++) {
    float rad=random(maxRad);
    int speed=int(random(1, maxSpeed));
    int col=int(random(255));
    float xPos=random(1, width-maxRad);
    float yPos=0;
    drop = new Drop(xPos, yPos, col, rad, speed);
    drops[i]=drop;
  }
}
