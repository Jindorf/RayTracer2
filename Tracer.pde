class Tracer{
  
  Sphere sphere;
  SphereFactory sphereFactory;
  
  Tracer(Sphere sphere){
    this.sphere= sphere;
  }
  
  Tracer(SphereFactory sf){
    sphereFactory = sf;
  }

  PrimaryHit trace(Ray ray){
    float minDistance = 99999;
    PrimaryHit closestHit = new PrimaryHit();
    for(int i=0;i<sphereFactory.getSize();i++){     
      PrimaryHit currentHit = sphereFactory.getSphere(i).getPrimaryHit(ray);
      if(currentHit.isHit()){
      if(currentHit.position.sub(ray.origin).length() < minDistance)
        closestHit = currentHit;
      }
    }
    return closestHit;
  }

}
