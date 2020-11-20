class Firework{
  constructor(x,y){
    this.particleCount = 250;
    this.particles = [];
    colormode(HSB);
    this.color = color(random(360),random(255),255);
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
