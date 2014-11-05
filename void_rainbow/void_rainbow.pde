int up = 301;
int down = 299;
int stroke = 3;
int bool1 = 255;
int bool2 = 255;
int bool3 = 255;
int temp = 0;

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
  
 
//  bool1 = colourswap[temp][0]; 
//  bool2 = colourswap[temp][1];
//  bool3 = colourswap[temp][2];


  
  stroke(bool1, bool2, bool3);
  strokeWeight(stroke);
  noFill();
  quad(300, up, down, 300, 300, down, up, 300);
  up = up + 10;
  down = down - 10;
  if(up >= 900) {
    bool1 = 0; 
    bool2 = 0;
    bool3 = 0;
    stroke = 4;
    up = 301;
    down = 299;
    }
  else {
    bool1 = colourswap[temp][0]; 
    bool2 = colourswap[temp][1];
    bool3 = colourswap[temp][2];
    //up = 301;
    //down = 299;
    //quad(300, up, down, 300, 300, down, up, 300);
  }
  
  
 if(temp == 5) {
   temp = 0;
 }
 else {
   temp = temp + 1;
 }
  
  
}

