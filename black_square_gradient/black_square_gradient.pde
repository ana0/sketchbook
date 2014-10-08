int up = 301;
int down = 299;
int colour = 255;
int stroke = 4;

void setup() {
  background(0, 0, 0);
  size(600, 600);
}

void draw() {
  if (colour == 255 || colour < 0) {
    colour = 0;
    for (int i = 0; i < 900; i++) {
      stroke(colour, colour, colour);
      strokeWeight(stroke);
      noFill();
      quad(300, up, down, 300, 300, down, up, 300);
      up = up + 10;
      down = down - 10;
      colour = colour + 5;
      if (colour > 100) {
        stroke = 3;
      }
    }
  }
  else {
    colour = 255;
    for (int i = 0; i < 900; i++) {
      stroke(colour, colour, colour);
      strokeWeight(stroke);
      noFill();
      quad(300, up, down, 300, 300, down, up, 300);
      up = up + 10;
      down = down - 10;
      colour = colour - 5;
      if (colour < 100) {
        stroke = 4;
      }
    }
  }
  up = 301;
  down = 299;
}


