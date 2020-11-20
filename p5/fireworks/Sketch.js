let fireworks;
let count;
function setup() {
  createCanvas(600,400);
  fireworks = [];
  count = 0;
}

function mousePressed(){
  if(count > 20){
    count = 0;
  }
  fireworks[count] = new Firework(mouseX,mouseY);
  count++;
}

function draw (){
  background(51);
  fireworks.forEach(element => {
    element.show();
  });
  
}
