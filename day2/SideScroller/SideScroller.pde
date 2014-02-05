import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;

import java.awt.event.*;

float MOUSE_AMP = 2;

Player player;
Landscape landscape;

void setup() {
  size(640,480);
  restartGame();
  initMouseWheel();
}

void draw() {
  background(0);
  if (player.isAlive) {
    landscape.scroll();
    if (landscape.collidesWithPlayer(player)) {
      player.kill();
    }
  }
  landscape.draw();
  player.draw();
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
