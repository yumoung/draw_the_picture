class Line{
  ArrayList<PVector> lines =  new ArrayList<PVector>();
  Line(){
  }
  void push(PVector v){
    lines.add(v);
    println(lines.size());
  }
  PVector pop(){
    int t = lines.size()-1;
    PVector v = lines.get(t);
    return v;
  }
  void display(){
    int t = lines.size()-1;
    for(int i=t; i>0; i--){
      PVector v1 = lines.get(i);
      PVector v2 = lines.get(i-1);
      stroke(1);
      line(v1.x, v1.y, v2.x, v2.y);
    }
  }
  
}
