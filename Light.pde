class Light{
  Vector3D position;
  Vector3D direction;
  float brightness;
  Color c;
  
  Light(float x, float y, float z, Color col){
    brightness = 0.1;
    position = new Vector3D(x,y,z);
    c = col;
  }
  
  void drawPositionToScreen(){ 
    ellipse(position.x,position.y,20,20);
  }
  
  Color getColor(){
    return c;
  }
  
  boolean lightVisibility(Vector3D here, Tracer tracer){
    Ray shadowRay = new Ray(here, this.direction);
    PrimaryHit shadowRayHit = tracer.trace(shadowRay);
    return !shadowRayHit.isHit();
  }
  
  Vector3D position(){
    return this.position;
  }
  Vector3D getDirection(Vector3D that){
    return this.position.sub(that);
  }
  
  Vector3D direction(){
    return this.direction;
  }
  
  void setDirection(PrimaryHit there){
    this.direction = (this.position.sub(there.position)).normalize();
  }
  
  float brightness(){
    return this.brightness;
  }
  
  Color shadowColor(){
    return new Color(0,0,0);
  }
}
