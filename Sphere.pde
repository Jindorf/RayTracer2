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
}
