import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import oscP5.*;

import toxi.geom.*;
import toxi.math.noise.*;

import java.awt.event.*;

float MOUSE_AMP = 2;

TouchOscInput OSC_INPUT=new TouchOscInput();
//MrMrOscInput OSC_INPUT=new MrMrOscInput();

Player player;
Landscape landscape;

OscP5 osc;

int highScore;

Minim minim;
AudioPlayer soundtrack;

void setup() {
  size(640,480);
  restartGame();
  initMouseWheel();
  initOsc();
  initAudio();
  textFont(loadFont("PFTempestaSeven-Bold-32.vlw"));
}

void draw() {
  background(0);
  if (player.isAlive) {
    landscape.scroll();
    if (landscape.collidesWithPlayer(player)) {
      player.kill();
      highScore=max(highScore,landscape.scrollOffset);
      restartGame();
    }
  }
  landscape.draw();
  player.draw();
  fill(255);
  text("SCORE: ",20,height-20);
  text(nf(landscape.scrollOffset,5),200,height-20);
  text("HI: ",20,height-60);
  text(nf(highScore,5),200,height-60);
}

void initMouseWheel() {
  frame.addMouseWheelListener(new MouseWheelListener() {

    public void mouseWheelMoved(MouseWheelEvent e) {
      if (player.isAlive) {
        player.move(e.getWheelRotation()*MOUSE_AMP);
      }
    }
  }
  );
}

void keyPressed() {
  if (key=='r' || key=='R') {
    restartGame();
  }
}

void restartGame() {
  player=new Player(50,height/2,80,20);
  landscape=new Landscape(50);
  //landscape.function=new RandomLandscape();
  landscape.function=new NoiseLandscape();
  landscape.init();
}

void initOsc() {
  osc=new OscP5(OSC_INPUT,7777);
}

void initAudio() {
  minim=new Minim(this);
  soundtrack=minim.loadFile("chiptune.mp3");
  soundtrack.loop();
}

