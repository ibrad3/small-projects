Object sun, earth;
void setup() {
  size(800, 600);

  sun = new Object(width/2, height/2, 109.197928112*2, color(255, 175, 0));
  earth = new Object(width/2, 150, 2, color(0, 0, 255));
  earth.velocity.x = -0.5553*8;
}
int clicks = 0;
PVector click1, click2;
void mousePressed() {
  

  clicks ++;
  if (clicks == 1) {
    click1 = new PVector(0, 0);
  } else if (clicks == 2) {
    click2 = new PVector(mouseX, mouseY);
    earth = new Object(sun.position.x-width/2+mouseX, sun.position.y-height/2+mouseY, earth.mass, earth.colour);
    earth.position.set(click1);
    earth.velocity.set(click2.sub(click1));
    earth.velocity.div(30);
    clicks = 0;
  }
}
void draw() {
  background(255);
  strokeWeight(earth.mass);
  if (clicks == 1) {
    stroke(255, 50);
    point(click1.x, click1.y);
    line(click1.x, click1.y, mouseX, mouseY);
    text("New Velocity: "+click1.mag(), 0, height);
  }
  translate(-sun.position.x+width/2, -sun.position.y+height/2);
  earth.show();
  sun.show();
  if (dist(sun.position.x, sun.position.y, earth.position.x, earth.position.y)
    >sun.mass/2+earth.mass/2) {

    earth.gravitate(sun);
    sun.gravitate(earth);
    text("Velocity: "+sqrt(sq(earth.velocity.x)+sq(earth.velocity.y)), sun.position.x-width/2, sun.position.y+25-height/2);
    text("Distance: "+dist(sun.position.x, sun.position.y, earth.position.x, earth.position.y), sun.position.x-width/2, sun.position.y+50-height/2);
  }
}
