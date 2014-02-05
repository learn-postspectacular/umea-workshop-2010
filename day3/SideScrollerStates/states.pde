class GameState {

  void enter() {
  }

  GameState leave() {
    return null;
  }

  void update() {
  }
}

class IntroState extends GameState {

  void enter() {
    println("intro");
  }

  GameState leave() {
    return new PlayState();
  }

  void update() {
    background(0,255,0);
    textAlign(CENTER);
    text("INTESTINE RIDERS P(L)USS",width/2,height/2);
    if ((frameCount % 60)<30) {
      text("INSERT COIN",width/2,height/2+50);
    }
  }
}

class PlayState extends GameState {

  void enter() {
    restartGame();
  }

  GameState leave() {
    return new GameOverState();
  } 
 
  void update() {
    background(0);
    if (player.isAlive) {
      landscape.scroll();
      if (landscape.collidesWithPlayer(player)) {
        setState(leave());
      }
    }
    landscape.draw();
    player.draw();
    fill(255);
    textAlign(LEFT);
    text("SCORE: ",20,height-20);
    text(nf(landscape.scrollOffset,5),200,height-20);
    text("HI: ",20,height-60);
    text(nf(highScore,5),200,height-60);
  }
}

class GameOverState extends GameState {
  
  int gameOverTime;
  
  void enter() {
    player.kill();
    highScore=max(highScore,landscape.scrollOffset);
    gameOverTime=millis();
  }
  
  GameState leave() {
    return new PlayState();
  }
  
  void update() {
    if (millis()-gameOverTime < 5000) {
      // TODO add game over music
      background(0);
      textAlign(CENTER);
      text("GAME OVER",width/2,height/2);
      if ((frameCount % 60)<30) {
        text("YOU FAILED!!!",width/2,height/2+50);
      }
    } else {
      // is score a highscore??? (compare with last entry of highscore list)
      if (landscape.scrollOffset > highscores.get(highscores.size()-1).score) {
        setState(new NewHighscoreState());
      } else {
        setState(new HallOfFameState());
      }
    }
  }
}

class NewHighscoreState extends GameState {
}

class HallOfFameState extends GameState {
  
  void enter() {
  }
  
  GameState leave() {
    return new IntroState();
  }
  
  void update() {
    int offsetX=(width-432)/2;
    int offsetY=(height-12*40)/2;
    background(0);
    textAlign(CENTER);
    fill(255);
    text("HALL OF FAME",width/2,offsetY);
    textAlign(LEFT);
    // print out highscores formatted as table
    for(int i=0; i<highscores.size(); i++) {
      // create moving rainbow effect using hue animation in HSB
      float h=((i*0.1)+millis()*0.0004) % 1.0;
      TColor col=TColor.newHSV(h,1.0,1.0);
      // turn color into Processing compatible ARGB representation 
      fill(col.toARGB());
      int y=offsetY+40*(i+2);
      // rank
      text(nf(i+1,2),offsetX,y);
      // name
      text(highscores.get(i).name.toUpperCase(),offsetX+100,y);
      // score
      text(nf(highscores.get(i).score,5),offsetX+300,y);
    }
  }
}

