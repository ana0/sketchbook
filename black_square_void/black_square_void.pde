int up = 301;
int down = 299;
int colour = 255;
int stroke = 3;

void setup() {
  background(0, 0, 0);
  size(600, 600);
}

void draw() {
  stroke(colour, colour, colour);
  strokeWeight(stroke);
  noFill();
  quad(300, up, down, 300, 300, down, up, 300);
  up = up + 10;
  down = down - 10;
  if(up >= 900) {
    if(colour == 0) {
      colour = 255;
      stroke = 3;
    }
    else {
      colour = 0;
      stroke = 4;
    }
    up = 301;
    down = 299;
    quad(300, up, down, 300, 300, down, up, 300);
  }
}

