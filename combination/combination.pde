int upwidth = width/2 +1;
int downwidth = width/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = width/2;
int centreheight = height/2;
int colour = 255;
int stroke = 3;
int bool1 = 0;
int bool2 = 0;
int bool3 = 0;
int temp = 0;
boolean first = true;
IntList colourwheel;

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
int[] b = { 0, 0, 255 };
int[] g = { 0, 255, 0 };
int[] r = { 255, 0, 0 };
int[] c = { 0, 255, 255 };
int[] ma = { 255, 0, 255 };
int[] y = { 255, 255, 0 };
int[][] colourswap = { r, y, g, c, b, ma };

void setup() {
  background(0, 0, 0);
  size(displayWidth, displayHeight);
  colourwheel = new IntList();
  for (int i = 0; i <=255; i = i+5) {
      colourwheel.append(i);
  }
}

void draw() {
  if(key=='z') {
    quad(0, 0, displayWidth, 0, displayWidth, displayHeight, 0, displayHeight);
    fill(0);
    stroke(0);
  }
  
  if(key=='q') {
    if(first) {
      upwidth = width/2 +1;
      downwidth = width/2 -1;
      upheight = displayHeight/2 +1;
      downheight = displayHeight/2 -1;
      first = false;
    }
    
    centrewidth = width/2;
    centreheight = height/2;
    
    stroke(colour, colour, colour);
    strokeWeight(stroke);
    noFill();
    quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
    upwidth = upwidth + 10;
    upheight = upheight +10;
    downheight = downheight - 10;
    downwidth = downwidth -10;
    if(upwidth >= displayWidth*1.5) {
      if(colour == 0) {
        colour = 255;
        stroke = 3;
      }
      else {
        colour = 0;
        stroke = 4;
      }
    upwidth = displayWidth/2 +1;
    downwidth = displayWidth/2 -1;
    upheight = displayHeight/2 +1;
    downheight = displayHeight/2 -1;
    }
  }
  
  if(key == 'w') {
    stroke = 4;
    
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
    for (int i = 0; i < colourwheel.size(); i++) {
        if (mousePressed == true) {
          stroke(0, 0, 0);
        }
        else {
          stroke(colourwheel.get(i), colourwheel.get(i), colourwheel.get(i));
        }
        strokeWeight(stroke);
        noFill();
        quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
        upwidth = upwidth + 10;
        upheight = upheight +10;
        downheight = downheight - 10;
        downwidth = downwidth -10;
    }
    upwidth = width/2 +1;
    downwidth = width/2 -1;
    upheight = displayHeight/2 +1;
    downheight = displayHeight/2 -1;
    
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
  
  if(key=='e') {
    stroke = 4;
    
    //does the actual drawing
    for (int i = 0; i < m.size(); i++) {
        stroke(d.get(i), d.get(i), d.get(i));
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
  
  if(key=='r') {
    stroke = 4;
    int[] b = { 0, 0, 255 };
    int[] g = { 0, 255, 0 };
    int[] r = { 255, 0, 0 };
    int[] c = { 0, 255, 255 };
    int[] ma = { 255, 0, 255 };
    int[] y = { 255, 255, 0 };
    int[][] colourswap = { r, y, g, c, b, ma };
    
    //does the actual drawing
    for (int i = 0; i < m.size(); i++) {
          if(colourswap[temp][0] == 255) {
            bool1 = d.get(i);
          }
          if(colourswap[temp][1] == 255) {
            bool2 = d.get(i);
          }
          if(colourswap[temp][2] == 255) {
            bool3 = d.get(i);
          }   
        stroke(bool1, bool2, bool3);  
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
    bool1 = 0;
    bool2 = 0;
    bool3 = 0;
    
    //iterates variable that swaps colourst
    if(d.get(0) == 0) {
      if(temp >= 5) {
        temp = 0;
      }
      else {
      temp = temp + 1;
      }
    }
    
    
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
  
  if(key=='t') {
    int[] b = { 255, 255, 0 };
    int[] g = { 255, 0, 255 };
    int[] r = { 0, 255, 255 };
    int[] c = { 255, 0, 0 };
    int[] ma = { 0, 255, 0 };
    int[] y = { 0, 0, 255 };
    int[][] colourswap = { r, y, g, c, b, ma };
    
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
    bool1 = 255;
    bool2 = 255;
    bool3 = 255;
    
    //iterates variable that swaps colourst
    if(d.get(0) == 0) {
      if(temp >= 5) {
        temp = 0;
      }
      else {
      temp = temp + 1;
      }
    }
    
    
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
  
  if(key=='y') {
  }
  
  if(key=='u') {
  }
  
  if(key=='i') {
  }
  
  if(key=='o') {
  }
  
  if(key=='p') {
  }
  

}

