class Landscape {
  
  float[] valuesT;
  float[] valuesB;
  
  LandscapeFunction function;
  
  int scrollOffset;
  
  Landscape(int res) {
    valuesT=new float[res];
    valuesB=new float[res];
    scrollOffset=res;
  }
  
  void init() {
    for(int i=0; i<valuesT.length; i++) {
      float[] el=function.getElevationFor(i);
      valuesT[i]=el[0];
      valuesB[i]=el[1];
    }
  }
  
  void scroll() {
    // shift register equivalent
    // move all entries to preceeding index
    for(int i=1; i<valuesT.length; i++) {
      valuesT[i-1]=valuesT[i];
      valuesB[i-1]=valuesB[i];
    }
    float[] el=function.getElevationFor(scrollOffset);
    valuesT[valuesT.length-1]=el[0];
    valuesB[valuesB.length-1]=el[1];
    scrollOffset++;
  }
  
  void draw() {
    fill(0,0,128);
    noStroke();
    // single column width
    float w=(float)width/valuesT.length;
    for(int i=0; i<valuesT.length; i++) {
      // x of each column = array index * w
      rect(i*w,0,w,valuesT[i]);
      rect(i*w,height-valuesB[i],w,valuesB[i]);
    }
  }
  
  boolean collidesWithPlayer(Player player) {
    // single column width
    float w=(float)width/valuesT.length;
    Rect playerRect=new Rect(player.x,player.y,player.w,player.h);
    for(int i=0; i<valuesT.length; i++) {
      // first check top obstacles
      Rect r=new Rect(i*w,0,w,valuesT[i]);
      if (r.intersectsRect(playerRect)) {
        return true;
      }
      // then check bottom
      r=new Rect(i*w,height-valuesB[i],w,valuesB[i]);
      if (r.intersectsRect(playerRect)) {
        return true;
      }
    }
    return false;
  }
}
