class Player {
  
  float x,y;
  int w,h;
  
  boolean isAlive=true;
  
  Player(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
  void move(float delta) {
    this.y+=delta;
    this.y=constrain(this.y,0,height-h);
  }
  
  void draw() {
    if (isAlive) {
      fill(255,255,0);
    } else {
      fill(255,0,0);
    }
    rect(x,y,w,h);
  }
  
  void kill() {
    isAlive=false;
  }
}
