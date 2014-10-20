int up = 301;
int down = 299;
int colour = 255;
int stroke = 4;
IntList colourwheel;


void setup() {
  background(0, 0, 0);
  size(600, 600);
  colourwheel = new IntList();
  for (int i = 0; i <=255; i = i+5) {
      colourwheel.append(i);
  }
}

void draw() {
  //does the actual drawing
  for (int i = 0; i < colourwheel.size(); i++) {
      stroke(colourwheel.get(i), colourwheel.get(i), colourwheel.get(i));
      strokeWeight(stroke);
      noFill();
      quad(300, up, down, 300, 300, down, up, 300);
      up = up + 10;
      down = down - 10;
  }
  up = 301;
  down = 299;
  
  //makes sure you don't generate an infinite amount of data
  if (colourwheel.size() < width*2) {
    colourwheel.append(colourwheel.get(colourwheel.size()-1));
  }
  
  //swaps array values one index number up
  for (int i = colourwheel.size()-1; i > 0; i--) {
    colourwheel.set(i, colourwheel.get(i-1));
  }
  
  //sets value of first index of array
  if (colourwheel.get(0) == 0 || colourwheel.get(0) == 255) {
    colourwheel.set(0, colourwheel.get(2));
  }
  else {
    if (colourwheel.get(1) < colourwheel.get(2)) {
      colourwheel.set(0, colourwheel.get(0)-5);
    }
    if (colourwheel.get(1) > colourwheel.get(2)) {
      colourwheel.set(0, colourwheel.get(0)+5);
    }
  }  

}


