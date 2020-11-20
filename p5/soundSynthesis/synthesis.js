let sounds = [];
let maxFreq = 22050;
let res = 1;
let freq;
function soundGen () {
    freq = mouseY*multi;
    if (freq < 0){
      freq = 0;
    }
    if (freq > maxFreq){
      freq = maxFreq;
    } 
    sounds.unshift([freq, iter]);
    wave.freq(freq, 0.1);
    
      wave.amp(1,0.1);
      let pos;
      if (mouseY > 20){
        pos = mouseY-10;
      }
      if (mouseY < 21){
        pos = 11;
      }
      if (mouseY > height){
        pos = height-10;
      }
      text(freq+" Hz",0,pos);
  }
  
  function drawSound(){
    let size = 4;
    noStroke();
    fill(255,0,0);
    for (let i = sounds.length-1; i > 0; i--){
      
      ellipse(sounds[i][1]*res, sounds[i][0]/multi, size);
      if (sounds[i][1] == iter){
        sounds.splice(i); 
      }
    }
  }