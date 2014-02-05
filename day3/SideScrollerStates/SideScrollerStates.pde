import toxi.color.*;
import toxi.color.theory.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import oscP5.*;

import toxi.geom.*;
import toxi.math.noise.*;

import java.awt.event.*;

float MOUSE_AMP = 2.5;
float MOTION_SMOOTH = 0.5;

TouchOscInput OSC_INPUT=new TouchOscInput();
//MrMrOscInput OSC_INPUT=new MrMrOscInput();

Player player;
Landscape landscape;

OscP5 osc;

int highScore;

Minim minim;
AudioPlayer soundtrack;

GameState state;

void setup() {
  size(1024,720);
  initMouseWheel();
  initOsc();
  initAudio();
  loadHighscores();
  textFont(loadFont("PFTempestaSeven-Bold-32.vlw"));
  setState(new IntroState());
  //setState(new HallOfFameState());
}

void draw() {
  state.update();
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
  if (state instanceof IntroState) {
    setState(state.leave());
  }
}

void restartGame() {
  player=new Player(50,height/2,80,20);
  landscape=new Landscape(100);
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

void setState(GameState s) {
  println("setting new state: "+s);
  state=s;
  state.enter();
}
