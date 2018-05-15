class PrimaryHit{
  
  Vector3D position;
  Vector3D direction; //n
  
  boolean isHit;
  
  PrimaryHit(Vector3D position, Vector3D direction){
    this.isHit = true;
    this.position = position;
    this.direction = direction;
  }
  
  PrimaryHit(){
    this.isHit = false;
  }
  
  boolean isHit(){
    
    return isHit;
  }
  
  Vector3D position(){
    return position;
  }
  
  Vector3D direction(){
    return direction;
  }
}
