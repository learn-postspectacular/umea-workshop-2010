class RoundButton extends Button {
  
  int radius;
  
  RoundButton(int x, int y, int radius) {
    super(x,y);
    this.radius=radius;
  }
  
  void draw() {
    super.draw();
    ellipse(x,y,radius,radius);
  }
  
  void checkRollover() {
    float a=mouseX-x;
    float b=mouseY-y;
    // pythagorean c*c = a*a + b*b;
    float d=sqrt(a*a+b*b);
    if (d<=radius) {
      isRollover=true;
    } else {
      isRollover=false;
    }
  }
}
