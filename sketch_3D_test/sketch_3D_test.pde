float diameter;
float margin;
float radius;
int iter = 2;
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
//  else {
//    diameter = diameter/iter;
//  }
    
  margin = diameter/20;
  radius = diameter-(margin*iter);
  
  //print(radius);
  
  lights();
  translate(width/iter, height/iter, -50);
  sphere(radius);
  
  iter = iter*iter;
  print(iter);
  //noLoop();

  if(diameter/iter < 1) {
    iter = 2;
  }
}
