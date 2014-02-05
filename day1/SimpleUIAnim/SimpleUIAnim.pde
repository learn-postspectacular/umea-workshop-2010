Button[] ui;

color[] bgCols=new color[] { color(255,255,0), color(0,255,0), color(255,96,0), color(0,0,255), color(128,0,255) };
int currColor;

boolean isAnimating=true;

float curveA=1.38;
float curveB=0.73;

void setup() {
  size(640,480);
  ellipseMode(RADIUS);
  noStroke();
  ui=new Button[3];
  ui[0]=new RoundButton(200,200,100);
  ui[0].action=new ColorChangeAction();
  ui[1]=new RectButton(320,100,100,20);
  ui[1].action=new PlaybackAction(true);
  ui[2]=new RectButton(320,140,100,20);
  ui[2].action=new PlaybackAction(false);
}

void draw() {
  background(bgCols[currColor]);
  if (isAnimating) {
    drawAnimation();
  }
  for(Button b : ui) {
    b.draw();
  }
}

void drawAnimation() {
  float t=frameCount*0.05;
  float x=sin(curveA*t)*200+width/2;
  float y=sin(curveB*t)*200+height/2;
  fill(0);
  ellipse(x,y,10,10);
}

void mouseMoved() {
  for(Button b : ui) {
    b.checkRollover();
  }
}

void mousePressed() {
  for(int i=0; i<ui.length; i++) {
    Button b=ui[i];
    if (b.isRollover) {
      b.action.execute();
    }
  }
}

void mouseDragged() {
  
}

void mouseReleased() {
  
}
