class TouchOscInput {

  public void oscEvent(OscMessage msg) {
    println(msg);
    if(msg.checkAddrPattern("/accxyz")) {
      float y=map(msg.get(0).floatValue(),-1,+1,0,height);
      player.move(y-player.y);
    }
  }
}

class MrMrOscInput {
  
  float mi=1000000,mx=-100000;
  public void oscEvent(OscMessage msg) {
    println(mi+" "+mx);
    if(msg.getAddrPattern().indexOf("/mrmr/accelerometerX/1/")>-1) {
      float raw=msg.get(0).floatValue();
      float y=map(msg.get(0).floatValue(),0.007,0.954,0,height);
      mi=min(raw,mi);
      mx=max(raw,mx);
      player.move(y-player.y);
    }
  }
}

