public static int SNOW = 0, RAIN = 1, HAIL = 2; 

ArrayList<Pre> rain = new ArrayList<Pre>();
ArrayList<Pre> snow = new ArrayList<Pre>();
ArrayList<Pre> hail = new ArrayList<Pre>();

float grav;
PVector wind;
void setup() {
  fullScreen();
  //size(600,400);
  frameRate(60);
  grav=0.05;
  wind = new PVector(1,1);
}

int abc=0;
void draw() {
  for (int i = 0; i < 15; i++) {
      rain.add(new Pre(RAIN));
      snow.add(new Pre(SNOW));
      hail.add(new Pre(HAIL));
      
    }
  background(50);
  //show(rain);
  show(snow);
  //show(hail);
}

void createWind(){
  wind = PVector.random2D();
  wind.limit(grav*1.5);
}

void show(ArrayList<Pre> w){
  for (int i = w.size()-1; i >= 0; i--) {
    if (w.get(i).offScreen()) {
      w.remove(i);
    }
    
    w.get(i).fall(grav, wind);
    w.get(i).show();
  }
  createWind();
  println(w.size());
}
