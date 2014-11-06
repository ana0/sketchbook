int upwidth = width/2 +1;
int downwidth = width/2 -1;
int upheight = displayHeight/2 +1;
int downheight = displayHeight/2 -1;
int centrewidth = width/2;
int centreheight = height/2;
int strokewidth = 3;
int bool1 = 255;
int bool2 = 255;
int bool3 = 255;
int temp = 0;
boolean first = true;

//creates list of colours to swap through
int[] b = { 255, 255, 1 };
int[] g = { 255, 1, 255 };
int[] r = { 1, 255, 255 };
int[] c = { 255, 1, 1 };
int[] ma = { 1, 255, 1 };
int[] y = { 1, 1, 255 };
int[][] colourswap = { r, y, g, c, b, ma };

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
  
  stroke(bool1, bool2, bool3);
  strokeWeight(strokewidth);
  noFill();
  quad(centrewidth, upheight, downwidth, centreheight, centrewidth, downheight, upwidth, centreheight);
  if(bool1 == 0) {
    upwidth = upwidth + 10;
    upheight = upheight +10;
    downheight = downheight - 10;
    downwidth = downwidth -10;
    temp = temp + 1;
    strokewidth = 3;
    bool1 = colourswap[temp][0]; 
    bool2 = colourswap[temp][1];
    bool3 = colourswap[temp][2];
  }
  else {
    bool1 = 0; 
    bool2 = 0;
    bool3 = 0;
    strokewidth = 4;
  }
  
  if(upwidth > displayWidth*1.5) {
    upwidth = displayWidth/2 +1;
    downwidth = displayWidth/2 -1;
    upheight = displayHeight/2 +1;
    downheight = displayHeight/2 -1;
  }
  
  if(temp == 5) {
    temp = 0;
  }
 
  
}

