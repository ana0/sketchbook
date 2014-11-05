int upwidth = width/2 +1;
int downwidth = width/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = width/2;
int centreheight = height/2;
int colour = 255;
int stroke = 4;
boolean first = true;

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
  
  if (colour == 255 || colour < 0) {
    colour = 0;
    for (int i = 0; i < displayWidth*1.5; i++) {
      stroke(colour, colour, colour);
      strokeWeight(stroke);
      noFill();
      quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
      upwidth = upwidth + 10;
      upheight = upheight +10;
      downheight = downheight - 10;
      downwidth = downwidth -10;
      colour = colour + 2;
      if (colour > 100) {
        stroke = 3;
      }
    }
  }
  else {
    colour = 255;
    for (int i = 0; i < displayWidth*1.5; i++) {
      stroke(colour, colour, colour);
      strokeWeight(stroke);
      noFill();
      quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
      upwidth = upwidth + 10;
      upheight = upheight +10;
      downheight = downheight - 10;
      downwidth = downwidth -10;
      colour = colour - 2;
      if (colour < 100) {
        stroke = 4;
      }
    }
  }
  upwidth = displayWidth/2 +1;
  downwidth = displayWidth/2 -1;
  upheight = displayHeight/2 +1;
  downheight = displayHeight/2 -1;
}


