import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
  frameRate(30);
}


void draw() {
  if (video.available()){
    video.read();
  }
  scale(-1, 1);
  image(video.get(), -width, 0);
}