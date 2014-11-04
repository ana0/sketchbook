int up = 301;
int down = 299;
int colour = 255;
int stroke = 4;
int bool1 = 255;
int bool2 = 255;
int bool3 = 255;
int temp = 0;


class GradientArray {
  public IntList colourwheel;
  
  public IntList create() {
    colourwheel = new IntList();
    for (int i = 0; i <=255; i = i+5) {
      colourwheel.append(i);
    }
    return colourwheel;
  }
  
  public IntList cycle() {
    //makes sure you don't generate an infinite amount of data
    if (colourwheel.size() < width*2) {
      colourwheel.append(colourwheel.get(colourwheel.size()-1)); 
    }
  
    //swaps array values one index number up
    for (int i = colourwheel.size()-1; i > 0; i--) {
      colourwheel.set(i, colourwheel.get(i-1));
    }
    return colourwheel;
  }
  
  public IntList cyclefirst() {
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
   return colourwheel; 
 }

}

GradientArray master = new GradientArray();
GradientArray dummy = new GradientArray();
IntList m = master.create();
IntList d = dummy.create();

//creates list of colours to swap through
int[] b = { 255, 255, 0 };
int[] g = { 255, 0, 255 };
int[] r = { 0, 255, 255 };
int[] c = { 255, 0, 0 };
int[] ma = { 0, 255, 0 };
int[] y = { 0, 0, 255 };
int[][] colourswap = { r, y, g, c, b, ma };

void setup() {
  background(0, 0, 0);
  size(600, 600);
}

void draw() {
  
  //does the actual drawing
  for (int i = 0; i < m.size(); i++) {
        if(colourswap[temp][0] == 0) {
          bool1 = d.get(i);
        }
        if(colourswap[temp][1] == 0) {
          bool2 = d.get(i);
        }
        if(colourswap[temp][2] == 0) {
          bool3 = d.get(i);
        }   
      stroke(bool1, bool2, bool3);  
      strokeWeight(stroke);
      noFill();
      quad(300, up, down, 300, 300, down, up, 300);
      up = up + 10;
      down = down - 10;
      
  }
  up = 301;
  down = 299;
  bool1 = 255;
  bool2 = 255;
  bool3 = 255;
  
  //iterates variable that swaps colourst
  //if(d.get(0) == 0) {
    if(temp == 5) {
      temp = 0;
    }
    else {
    temp = temp + 1;
    }
  //}
  
  
  m = master.cycle();
  d = dummy.cycle();
  m = master.cyclefirst();
  
  if(mousePressed == true) {
    d.set(0, 0);
  }
  else {
    d.set(0, m.get(0));
  }
  
}


