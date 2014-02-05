class RectButton extends Button {
  
  int width,height;
  
  RectButton(int x, int y, int w, int h) {
    super(x,y);
    this.width=w;
    this.height=h;
  }
  
  void draw() {
    super.draw();
    rect(x,y,width,height);
  }
  
  void checkRollover() {
    isRollover=(mouseX>=x && mouseX<x+width && mouseY>=y && mouseY<y+height);
  }
}

