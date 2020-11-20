class Particle{
  constructor(x,y){
    this.pos = new createVector(x,y);
    this.vel = new createVector(random(-1,1),random(-1,1));
    this.grav = 0.05
    this.vel.setMag(random(2));
  }
  move(){
    this.pos.add(this.vel);
    this.vel.add(0,this.grav);
  }
  show(){
    ellipse(this.pos.x,this.pos.y,5);
  }

}
