int upwidth = width/2 +1;
int downwidth = width/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = width/2;
int centreheight = height/2;
//int colour = 255;
int stroke = 4;
int bool1 = 0;
int bool2 = 0;
int bool3 = 0;
int temp = 0;
boolean first = true;


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

GradientArray red = new GradientArray();
GradientArray green = new GradientArray();
GradientArray blue = new GradientArray();
IntList re = red.create();
IntList gr = green.create();
IntList bl = blue.create();

//creates list of colours to swap through
//int[] b = { 0, 0, 255 };
//int[] g = { 0, 255, 0 };
//int[] r = { 255, 0, 0 };
//int[] c = { 0, 255, 255 };
//int[] ma = { 255, 0, 255 };
//int[] y = { 255, 255, 0 };
//int[][] colourswap = { r, y, g, c, b, ma };

void setup() {
  background(0, 0, 0);
  size(displayWidth, displayHeight);
}

void draw() {
    if(first) {
    upwidth = width/2 +1;
    downwidth = width/2 -1;
    upheight = displayHeight/2 +1;
    downheight = displayHeight/2 -1;
    first = false;
  }
  
  centrewidth = width/2;
  centreheight = height/2;
  
  //does the actual drawing
  for (int i = 0; i < re.size(); i++) {
      bool1 = re.get(i);
      bool2 = gr.get(i);
      bool3 = bl.get(i);
      if(mousePressed == true) {
        stroke(0, 0, 0);
      }
      else {
        stroke(bool1, bool2, bool3);  
      }
      strokeWeight(stroke);
      noFill();
      quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
      upwidth = upwidth + 10;
      upheight = upheight +10;
      downheight = downheight - 10;
      downwidth = downwidth -10;
  }
  upwidth = displayWidth/2 +1;
  downwidth = displayWidth/2 -1;
  upheight = displayHeight/2 +1;
  downheight = displayHeight/2 -1;
//  bool1 = 0;
//  bool2 = 0;
//  bool3 = 0;
  
  //iterates variable that swaps colourst
    if(temp == 5) {
      temp = 0;
    }
    else {
    temp = temp + 1;
    }

  re = red.cycle();
  re = red.cyclefirst();
  for(int i=0; i<5; i++) {
    gr = green.cycle();
    gr = green.cyclefirst();
  }
  for(int i=0; i<10; i++) {
    bl = blue.cycle();
    bl = blue.cyclefirst();
  }
  
}


