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
  
  margin = diameter/20;
  radius = diameter-(margin*2);
  
  times = width/diameter+1;
  
  lights();
  //translate(width/iter, height/iter, -50);
  //sphere(radius);
  //if(times > 1) {
    for(int i = 0; i < times; i++) {
      translate(width/iter, height/iter, 0);
      sphere(radius);
    }
  //}
  
  iter = iter*iter;
  print(diameter);
  //noLoop();

//  if(diameter/iter < 0.1) {
//    iter = 2;
//  }
}
