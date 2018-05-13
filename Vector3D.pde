class Vector3D{
  
  float x;
  float y;
  float z;
  
  Vector3D(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  Vector3D(Vector3D that){
    this.x = that.x;
    this.y = that.y;
    this.z = that.z;
  }
  
  float dotProduct(Vector3D that){
    return this.x*that.x + this.y*that.y + this.z*that.z;
  }
  
  Vector3D sub(Vector3D that){
    return new Vector3D(this.x-that.x,this.y-that.y,this.z-that.z);  
  }
  
  Vector3D add(Vector3D that){
   return new Vector3D(this.x+that.x,this.y+that.y,this.z+that.z);  
  }
  
  Vector3D mult(float scalar){
    return new Vector3D(this.x*scalar,this.y*scalar,this.z*scalar);
  }
  
  Vector3D div(float scalar){
    return new Vector3D(this.x/scalar,this.y/scalar,this.z/scalar);
  }  
 
  Vector3D normalize(){
    return new Vector3D(this.mult(1/(this.getAbsolute()))); //a*1/abs(a)
  }
  
  float getAbsolute(){
    return sqrt(this.x*this.x+this.y*this.y+this.z*this.z); // a= sqrt(x^2+y^2+z^2)
  }
  
  float length(){
    return this.getAbsolute();
  }
  
  Vector3D copy(){
    return new Vector3D(this);
  }
}
