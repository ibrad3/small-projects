Player player;
Platform platform, p2;
boolean keyP = false;
boolean collide;
void setup() {
  size(300, 300);
  player = new Player();
  platform = new Platform(0, 250, 300, 20);
  p2 = new Platform(width/2,150,150,20);
}

void draw() {
  
  translate(-player.pos.x+width/2, -player.pos.y+height/2);
  collide=!player.collides(platform) && !player.collides(p2);
  background(0);
  player.show();
  platform.show();
  p2.show();
  

  player.update(collide);
  collide(platform);
  collide(p2);
  
  if (keyPressed) {
    if (key == 'a') {
      player.vel.set(-player.speed, player.vel.y);
    }
    if (key == 'd') {
      player.vel.set(player.speed, player.vel.y);
    }
    if (key == 'w' && !collide) {
      player.pos.add(0, -1);
      player.vel.set(0, -5);
    }
  } if (!keyPressed) {
    player.vel.set(0,player.vel.y);
  }
  
}
void collide(Platform p){
  if (player.collides(p)) {
    player.pos.set(player.pos.x, 1+(p.pos.y-player.size/2));
    player.vel.set(player.vel.x,0);
  }
}