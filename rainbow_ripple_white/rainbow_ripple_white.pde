int up = 301;
int down = 299;
int strokewidth = 3;
int bool1 = 255;
int bool2 = 255;
int bool3 = 255;
int temp = 0;

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
  size(600, 600);
}

void draw() {
  stroke(bool1, bool2, bool3);
  strokeWeight(strokewidth);
  //noFill();
  quad(300, up, down, 300, 300, down, up, 300);
  if(bool1 == 0) {
    up = up + 10;
    down = down - 10;
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
  
  if(up > 900) {
    up = 301;
    down = 299;
  }
  
  if(temp == 5) {
    temp = 0;
  }
 
  
}

