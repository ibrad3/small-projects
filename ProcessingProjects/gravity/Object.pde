class Object {
  float mass, gravitationalConstant;
  PVector position, velocity, force;
  color colour;
  Object(float x, float y, float m, color c) {
    colour = c;
    position = new PVector(x, y);
    velocity = new PVector();
    force = new PVector();
    mass = m;
    gravitationalConstant = 6.67408;
  }
  void show() {
    stroke(colour);
    strokeWeight(mass);
    point(position.x, position.y);
  }
  void gravitate(Object object) {
    force.set(object.position.x-position.x, object.position.y-position.y);

    float mag = (gravitationalConstant*(mass*object.mass)/sq(dist(position.x, position.y, object.position.x, object.position.y)-mass/2))/mass;
    force.setMag(mag*2);
    position.add(velocity);
    velocity.add(force);
    textSize(25);
  }
}
