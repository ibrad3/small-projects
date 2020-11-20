let multi;
let fft;
function soundAnalysis(){
    let spectrum = fft.analyze();
    anaCanva.push();
    
      for (let i = 0; i < spectrum.length; i++){
        let amp = spectrum[i];
        anaCanva.stroke(amp);
        anaCanva.line(iter, i, iter+res, i);
      }
      anaCanva.translate(iter, 0);
      anaCanva.pop();
      strokeWeight(10);
      stroke(255);
  }