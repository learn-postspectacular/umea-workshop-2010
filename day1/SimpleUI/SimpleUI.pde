Button[] ui;

color[] bgCols=new color[] { color(255,255,0), color(0,255,0), color(255,96,0), color(0,0,255), color(128,0,255) };
int currColor;

boolean isPlaying=false;

void setup() {
  size(640,480);
  ellipseMode(RADIUS);
  noStroke();
  ui=new Button[3];
  ui[0]=new RoundButton(200,200,100);
  ui[1]=new RectButton(320,100,100,20);
  ui[2]=new RectButton(320,140,100,20);
}

void draw() {
  background(bgCols[currColor]);
  // new skool
  for(Button b : ui) {
    b.draw();
  }
  // old skool
  //  for(int i=0; i<ui.length; i++) {
  //    Button b=ui[i];
  //    b.draw();
  //  }
}

void mouseMoved() {
  for(Button b : ui) {
    b.checkRollover();
  }
}

void mousePressed() {
//  if (bt.isRollover) {
//    currColor++;
//    currColor=currColor % bgCols.length;
//  }
}

void mouseDragged() {
  
}

void mouseReleased() {
  
}
