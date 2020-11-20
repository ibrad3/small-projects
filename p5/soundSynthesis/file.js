function gotFile(file) {
    input.stop();
    input = loadSound(file, () => {
        input.play(); 
        inputType = inputTypes.file;});
}
