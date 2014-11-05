int upwidth = displayWidth/2 +1;
int downwidth = displayWidth/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = displayWidth/2;
int centreheight = displayHeight/2;
int colour = 255;
int stroke = 3;

void setup() {
  background(0, 0, 0);
  size(displayWidth, displayHeight);
}

void draw() {
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

