class Player {
  
  float x,y,targetY;
  int w,h;
  
  boolean isAlive=true;
  
  Player(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.targetY=y;
    this.w=w;
    this.h=h;
  }
  
  void move(float delta) {
    this.targetY+=delta;
    this.targetY=constrain(this.targetY,0,height-h);
  }
  
  void draw() {
    y+=(targetY-y)*MOTION_SMOOTH;
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
