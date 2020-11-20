let inputTypes = {mic: 0, file: 1};
let inputType = inputTypes.mic;
let input;
function preload(){
  if (inputType == inputTypes.file){
    input = loadSound("music/track 1.mp3");
  } else if(inputType == inputTypes.mic){
    input = new p5.AudioIn();
  }
}

function micChanged(){
  if (this.checked()){
    input = new p5.AudioIn();
    input.start();
    input.connect(fft);
  } else {
    input.stop();
  }
}

let track = 7;
let iter = 0;
let canvas;
let micCheckbox;
function setup() {
  canvas = createCanvas(512,512);
  anaCanva = createGraphics(512, 512);
  canvas.drop(gotFile);  
  micCheckbox = createCheckbox(' mic', true)
  micCheckbox.changed(micChanged);
  //background(51);
  multi = maxFreq / height;
  //wave stuff  
  wave = new p5.Oscillator();
  wave.setType('sine');
  wave.freq(440);
  wave.amp(0);
  wave.start();
  //analysis stuff
  if (inputType == inputTypes.file){
    input.play();
  }
  fft = new p5.FFT(0, height);
  if(inputType == inputTypes.mic){
    input.start();
    input.connect(fft);
  }

}

function draw () {
  background(51);
  soundAnalysis();
  image(anaCanva, 0, 0);
  stroke(0,255,0);
  strokeWeight(2);
  line(iter,0,iter,height);
  if (iter > width){
    iter = 0;
  }
  drawSound();
  if (mouseIsPressed && mouseY < height && mouseX < width){
    soundGen();
  } else {
    wave.amp(0,0.1);
  }
  let load = false;
  if (inputType == inputTypes.file){
    if(!input.isPlaying() && !load){
      input = loadSound(`track 1.mp3`);
      track++;
      load = true;
    }
    if(load && input.isLoaded()){
      input.play();
      load = false;
    }
    
  }
  iter+=res;
}