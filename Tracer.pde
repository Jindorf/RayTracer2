//TODO : "seid ihr alle Hits?" if(pow(center.x-p.x,2)+pow(center.y-p.y,2)+pow(center.z-p.z,2) < radius*radius){

class Tracer{
  
  Sphere sphere;
  SphereFactory sphereFactory;
  
  Tracer(Sphere sphere){
    this.sphere= sphere;
  }
  
  Tracer(SphereFactory sf){
    sphereFactory = sf;
  }

  /*PrimaryHit trace(Ray ray){ 
    float minDistance = 99999;
    PrimaryHit closestHit = new PrimaryHit();   
    for(int i=0;i<sphereFactory.getSize();i++){     
      PrimaryHit currentHit = sphereFactory.getSphere(i).getPrimaryHit(ray);
      if(currentHit.isHit()){
        float currentDistance = currentHit.position.sub(ray.origin).length();
      if(currentDistance < minDistance)
        minDistance = currentDistance;
        closestHit = currentHit;
      }
    }   
    return closestHit;
  }*/
  
  PrimaryHit trace(Ray ray){
   
   Vector3D  closestHit = new Vector3D();
   Vector3D  hitDirection = new Vector3D();
   
     for(Sphere sphere : sphereFactory.getSpheres()){     
       float t = ray.direction.dotProduct(sphere.center.sub(ray.origin)); // t = d*(c-o)
       Vector3D currentHit = ray.origin.add(ray.direction.mult(t));       // p = o+d*t
  
         if(currentHit.sub(ray.origin).length() < closestHit.sub(ray.origin).length() || closestHit.x ==0 && closestHit.y==0 && closestHit.z ==0){
           float deltaT = sqrt(sphere.radius*sphere.radius - (currentHit.sub(sphere.center).dotProduct(currentHit.sub(sphere.center))));;
           Vector3D p = ray.origin.add(ray.direction.mult(t-deltaT));;      
           closestHit.set(p);
           hitDirection.set(sphere.getNormal(p)); 
         }      
     }    
   return new PrimaryHit(closestHit,hitDirection);
  }

}
