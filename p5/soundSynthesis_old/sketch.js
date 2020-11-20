function setup() {
  createCanvas(500,500);
  background(51);
  //wave stuff  
  wave = new p5.Oscillator();
  wave.setType('sine');
  wave.amp(0.1);
  wave.start();
}
let play = false;
function mousePressed(){
  play = !play;
}

let sounds = [];
let iter = 0;
let freq;
function draw () {
  background(51);
  freq = mouseY*40;
  sounds.push(freq);
  wave.freq(freq, 0.1);
  if (play){
    wave.amp(0.3,0.1);
    let size = 4;
    noStroke();
    fill(255,0,0);
    push();
    translate(sounds.length, 0);
    for (let i = 0; i < sounds.length; i++){
      ellipse(-i, sounds[i]/40, size);
    }
    pop();
    let pos;
    if (mouseY>20){
      pos = mouseY-10;
    } else{
      pos = mouseY+15;
    }
    text(freq+" Hz",0,pos);
     
  } else{
    iter = 0;
    wave.amp(0,0.1);
    sounds = [];
  }
  iter++;
}
