class Button {
  
  boolean isRollover;
  
  int x,y;
  
  color colOff=color(0,255,255);
  color colOn=color(255,0,255);
  
  ButtonAction action;
  
  Button(int x, int y) {
    this.x=x;
    this.y=y;
  }
  
  void draw() {
    if(isRollover) {
      fill(colOn);
    } else {
      fill(colOff);
    }
  }
  
  void checkRollover() {
  }
}
