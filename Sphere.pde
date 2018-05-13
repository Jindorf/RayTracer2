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
    return new Vector3D(hitpoint.sub(center).normalize());
  }
  
  PrimaryHit getPrimaryHit(Ray ray){
    t=calcT(ray);
    p=calcP(ray,t);
    //is p in Sphere?
    if(pow(center.x-p.x,2)+pow(center.y-p.y,2)+pow(center.z-p.z,2) < radius*radius){
      deltaT=calcDeltaT();
      Vector3D position = calcP(ray,t-deltaT);
      Vector3D direction = getNormal(position);
      return new PrimaryHit(position,direction);
    }
    else
      return new PrimaryHit();
  }
  
  float calcT(Ray ray){
    Vector3D direction= ray.direction.copy();
    Vector3D origin = ray.origin.copy();
    return direction.dotProduct(center.sub(origin)); // t = d*(c-o) 
  }
  
  float calcDeltaT(){
   //sqrt(r^2 -(p-c)^2)
   return sqrt(radius*radius - (p.sub(center).dotProduct(p.sub(center))));
  }
  
  //p(t)
  Vector3D calcP(Ray ray, float t){
    Vector3D direction= ray.direction.copy();
    Vector3D origin = ray.origin.copy();
    return origin.add(direction.mult(t)); // p = o+t*d
  }    
}
