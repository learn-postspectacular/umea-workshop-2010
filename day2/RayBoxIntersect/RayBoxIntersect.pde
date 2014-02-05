import toxi.geom.*;
import toxi.processing.*;

ToxiclibsSupport gfx;

void setup() {
  size(400,400);
  gfx=new ToxiclibsSupport(this);
}

void draw() {
  background(255);
  noFill();
  Ray2D ray=new Ray2D(new Vec2D(mouseX,mouseY),new Vec2D(1,0.3).normalize());
  Rect box=new Rect(100,100,100,40);
  if (box.intersectsRay(ray,0,50)!=null) {
    stroke(255,0,0);
  } else {
    stroke(0);
  }
  gfx.rect(box);
  gfx.ray(ray,50);
}
