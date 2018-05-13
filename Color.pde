class Color{
  
  int r;
  int g;
  int b;
  
  Color(int red, int green, int blue){
    r = red;
    g = green;
    b = blue;
  }
  
  Color(float red, float green, float blue){
    r = (int) red;
    g = (int) green;
    b = (int) blue;
  }
  
  Color(){
    r=0;
    g=0;
    b=0;
  }
  
  int r(){ return r;}
  int g(){return g;}
  int b(){return b;}
  
  Color mult(float skalar){
    return new Color(r*skalar,g*skalar,b*skalar);
  }
  
  void add(Color col){
    this. r = this.r() + col.r();
    if(this.r>255)
      this.r=255;
      
    this. g = this.g() + col.g();
     if(this.g>255)
      this.g=255;
      
    this. b = this.b() + col.b();
     if(this.b>255)
      this.b=255;
  }
  
}
