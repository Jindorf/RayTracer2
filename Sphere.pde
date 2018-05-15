class Sphere{
  
 Vector3D center;
 float radius;
 float t;
 float deltaT;
 Vector3D p;
    
 Sphere(Vector3D _center, float _radius){
   center = _center;
   radius = _radius;
 }   
 
 Sphere(){
   radius = random(10,50);
   center = new Vector3D(random(radius,width-radius),
   random(radius,height-radius),0);
 }
 
   Vector3D getcenter(){
    return this.center;
  }
  
  float getRadius(){
    return this.radius;
  }
  
  Vector3D getNormal(Vector3D hitpoint){
    return new Vector3D(hitpoint.sub(center)).normalize();
  }
  
  PrimaryHit getPrimaryHit(Ray ray){
    t=calcT(ray);
    p=calcP(ray,t);
    //is p in Sphere?
    if(pow(center.x-p.x,2)+pow(center.y-p.y,2)+pow(center.z-p.z,2) < radius*radius){ // (c-p)^2 < r^2
      deltaT=calcDeltaT();
      Vector3D position = calcP(ray,t-deltaT);
      Vector3D direction = getNormal(position);
      return new PrimaryHit(position,direction);
    }
    else
      return new PrimaryHit();
  }    
}
