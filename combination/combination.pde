int upwidth = width/2 +1;
int downwidth = width/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = width/2;
int centreheight = height/2;
int colour = 255;
int stroke = 3;
boolean first = true;
IntList colourwheel;

void setup() {
  background(0, 0, 0);
  size(displayWidth, displayHeight);
  colourwheel = new IntList();
  for (int i = 0; i <=255; i = i+5) {
      colourwheel.append(i);
  }
}

void draw() {
//  if(key=='q') {
    first = true;
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
//  }
  
//  if(key == 'w') {
//    first = true;
//    stroke = 4;
//    
//    if(first) {
//      upwidth = width/2 +1;
//      downwidth = width/2 -1;
//      upheight = displayHeight/2 +1;
//      downheight = displayHeight/2 -1;
//      first = false;
//    }
//    
//    centrewidth = width/2;
//    centreheight = height/2;
//    
//    //does the actual drawing
//    for (int i = 0; i < colourwheel.size(); i++) {
//        if (mousePressed == true) {
//          stroke(0, 0, 0);
//        }
//        else {
//          stroke(colourwheel.get(i), colourwheel.get(i), colourwheel.get(i));
//        }
//        strokeWeight(stroke);
//        noFill();
//        quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
//        upwidth = upwidth + 10;
//        upheight = upheight +10;
//        downheight = downheight - 10;
//        downwidth = downwidth -10;
//    }
//    upwidth = width/2 +1;
//    downwidth = width/2 -1;
//    upheight = displayHeight/2 +1;
//    downheight = displayHeight/2 -1;
//    
//    //makes sure you don't generate an infinite amount of data
//    if (colourwheel.size() < width*2) {
//      colourwheel.append(colourwheel.get(colourwheel.size()-1));
//    }
//    
//    //swaps array values one index number up
//    for (int i = colourwheel.size()-1; i > 0; i--) {
//      colourwheel.set(i, colourwheel.get(i-1));
//    }
//    
//    //sets value of first index of array
//      if (colourwheel.get(0) == 0 || colourwheel.get(0) == 255) {
//        colourwheel.set(0, colourwheel.get(2));
//      }
//      else {
//        if (colourwheel.get(1) < colourwheel.get(2)) {
//          colourwheel.set(0, colourwheel.get(0)-5);
//        }
//        if (colourwheel.get(1) > colourwheel.get(2)) {
//          colourwheel.set(0, colourwheel.get(0)+5);
//        }
//      }  
//  }

}

