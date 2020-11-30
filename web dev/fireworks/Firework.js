class Firework{
  constructor(x,y){
    this.particleCount = 500;
    this.particles = [];
    this.color = color(random(255),random(255),random(255));
    for (let i = 0; i < this.particleCount; i++){
      this.particles[i] = new Particle(x,y);
    }
  }

  show(){
    for (let i = 0; i < this.particleCount; i++){
      noStroke();
      fill(this.color);
      this.particles[i].show();
      this.particles[i].move();
    }
  }
}
