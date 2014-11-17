float diameter;
float margin;
float radius;
int iter = 2;
float times = 1;
boolean first = true;

void setup() {
  size(600, 600, P3D);
  background(0);
}

void draw() {
  //print(iter);
  if(first) {
    diameter = min(height, width)/iter;
  }
  else {
    diameter = diameter/2;
  }
  
  fill(0);
  quad(0, 0, width, 0, width, height, 0, height);
  fill(255);
  
  noStroke();
  margin = diameter/20;
  radius = diameter-(margin*2);
  
  times = width/diameter+1;
  
  lights();
  
  for(int x = 1; x < iter*2; x = x + 2) {
    for(int y = 1; y < iter*2; y = y + 2) {
      translate(diameter*x, diameter*y, 0);
      sphere(radius);
      translate(-diameter*x, -diameter*y, 0);

    }
  }
  
  iter = iter*2;

}
