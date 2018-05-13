class Lightsample{
  
  Vector3D position;
  Vector3D direction;
  float brightness;
  
  Lightsample(Vector3D pos,Vector3D thatPosition){
    this.position =pos;
    this.direction = pos.sub(thatPosition);
    brightness = 0.1;
  }

  Vector3D direction(){
    return direction;
  }
  
  float brightness(){
    return brightness;
  }
}
