interface LandscapeFunction {
  float[] getElevationFor(int pos);
}

class RandomLandscape implements LandscapeFunction {

  float[] getElevationFor(int pos) {
    return new float[] { 
      random(0.33)*height, random(0.33)*height
    };
  }
}

class NoiseLandscape implements LandscapeFunction {
  
  float[] getElevationFor(int pos) {
    // amplification factor for elevation values (0.0 ... 100%)
    float amp=min(pos/100.0, 1.0);
    // calculate top elevation and gap size
    float top=map((float)SimplexNoise.noise(pos*0.01,0),-1,+1,0,height*0.65*amp);
    // enforce min gap of 20% of screen height
    float gap=map((float)SimplexNoise.noise(pos*0.03,0),-1,+1,height*0.2,height*0.5);
    float bottom=(height-top-gap)*amp;
    return new float[] {
      top, bottom
    };
  }
}


