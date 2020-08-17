Line[] picture = new Line[10000];
PImage img;
boolean[][] check = new boolean[2000][2000];
int[] dx = {0, 0, 1, 1, 1, -1, -1, -1};
int[] dy = {1, -1, 0, -1, 1, 0, -1, 1}; 
int num = 0;

int in = 0;

int f1=0, f2=0;

boolean finish = true;

void setup() {
  size(900, 900);
  frameRate(2400);
  img = loadImage("image\\google.png");
  for (int i=0; i<10000; i++) {
    picture[i] = new Line();
  }
  image(img, 0, 0);
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      for (int k=0; k<8; k++) {
        int ip = i+dx[k];
        int jp = j+dy[k];
        if (ip>=0 && ip<img.height && jp>=0 && jp<img.width) {
          color c = get(i, j);
          color cp = get(ip, jp);
          float tem = red(c) + blue(c) + green(c);
          float temp = red(cp) + blue(cp) + green(cp);
          if (abs(tem - temp) > 50 && !check[ip][jp]) {
            check[i][j] = true;
          }
        }
      }
    }
  }
  fill(255, 100);
  rect(0, 0, width, height);


forout:
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      if (check[i][j]) {
        point(i, j);
        PVector temp = new PVector(i, j);
        picture[0].push(temp);
        println("sans");
        break forout;
      }
    }
  }
}

void draw() {
  if (finish) {
    boolean chk = true;
    while (chk) {
      PVector v = picture[in].pop();
      int i = (int)v.x;
      int j= (int)v.y;
      chk = false;
    for1:
      for (int k=-3; k<=3; k++) {
        for (int l=-3; l<=3; l++) { 
          int ip = i+k;
          int jp = j+l;
          if (ip>=0 && ip<img.height && jp>=0 && jp<img.width) {
            if (check[ip][jp]) {
              chk = true;
              PVector temp = new PVector(ip, jp);
              picture[in].push(temp);
              check[i][j] = false;
              check[ip][jp] = false;
              break for1;
            }
          }
        }
      }
    }

    in++;

    finish = false;
  for2:
    for (int i=0; i<img.height; i++) {
      for (int j=0; j<img.width; j++) {
        if (check[i][j]) {
          fill(random(0, 255), random(0, 255), random(0, 255));
          ellipse(i, j, 10, 10);
          PVector temp = new PVector(i, j);
          picture[in].push(temp);
          println("sans");
          finish = true;
          break for2;
        }
      }
    }
    println("index: " + in);
  } 
  else {
    f2++;
    if (f2 >= picture[f1].lines.size()-1) {
      f1++;
      f2 = 0;
      //println("End!");
    }
    if(f1>=in){
      println("End");
      delay(100000);
    }
    PVector v1 = picture[f1].lines.get(f2);
    PVector v2 = picture[f1].lines.get(f2+1);
    stroke(1);
    line(v1.x, v1.y, v2.x, v2.y);
  }
}
