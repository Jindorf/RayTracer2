class Ray{

  Vector3D origin;
  Vector3D direction;
  
  Ray(Vector3D origin, Vector3D direction){
    this.origin =origin;
    this.direction = direction;
  }
  
  Ray(Vector3D origin){
    this.origin = origin;
    this.direction = new Vector3D(0,0,1);
  }
  Ray(float x, float y, float z){
    this.origin = new Vector3D(x,y,z);
    this.direction = new Vector3D(0,0,1);
  }
  
  Vector3D origin(){
    return origin.copy();
  }
}
