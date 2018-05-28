class Tracer{
  
  Sphere sphere;
  SphereFactory sphereFactory;
  
  Tracer(Sphere sphere){
    this.sphere= sphere;
  }
  
  Tracer(SphereFactory sphereFactory){
    this.sphereFactory = sphereFactory;
  }
  
  PrimaryHit trace(Ray ray){
   
   Vector3D  closestHit = new Vector3D();
   Vector3D  hitDirection = new Vector3D();
   
     for(Sphere sphere : sphereFactory.getSpheres()){  
       
       // t = d*(c-o)
       float t = ray.direction.dotProduct(sphere.center.sub(ray.origin));
       
       // p = o+d*t
       Vector3D currentHit = ray.origin.add(ray.direction.mult(t));    
       
        // (p-c)^2 < r^2
        if(pow(sphere.center.x-currentHit.x,2)+pow(sphere.center.y-currentHit.y,2)+pow(sphere.center.z-currentHit.z,2) < sphere.radius*sphere.radius) 
        
         // determining the closest hit
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
