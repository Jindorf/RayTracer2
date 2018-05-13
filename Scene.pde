class Scene{
  
  Sphere sphere;
  ArrayList<PrimaryHit> primaryHits;
  ArrayList<PrimaryHit> hits;
  ArrayList<PrimaryHit> visibleHits;
  Tracer tracer;
  Color colorOfPixel;
  Light light;
  SphereFactory sphereFactory;
  
  Scene(){   
    sphere = new Sphere(new Vector3D(width/2,height/2,500),100);
    sphereFactory = new SphereFactory(10);
    primaryHits=new ArrayList<PrimaryHit>();
    hits = new ArrayList<PrimaryHit>();
    light = new Light(50,50,0, new Color(200,200,200));
    tracer = new Tracer(sphereFactory);
    background(0);
  }
  
  void create(){
   //for every pixel, make a ray, trace the primaryHits.. 
    for(int i =0; i< width; i++){
      for(int j=0; j< height; j++){
        Ray ray = new Ray (i,j,0);
        primaryHits.add(tracer.trace(ray));
      }
    }
  // check if primaryHits are actually Hitting an object
    for(int k=0;k<primaryHits.size();k++){
      PrimaryHit currentHit = primaryHits.get(k); 
      if(currentHit.isHit()){
        hits.add(currentHit);
      }
    }               //<>//
  // for every real Hit, fire an shadowray to the light, color the pixel  
    for(int l=0;l<hits.size();l++){
      PrimaryHit currentHit = hits.get(l);
      shade(currentHit);
      //colorOfPixel = shade(currentHit);
      //set((int)currentHit.position.x,(int)currentHit.position.y,color((int)(colorOfPixel.r()),(int)(colorOfPixel.g()),(int)(colorOfPixel.b())));
    }
    
  }
  
  void shade(PrimaryHit currentHit){
    
    Vector3D currentPos = currentHit.position();
    Vector3D normalVec = currentHit.direction();
    //Vector3D lightDirection = (light.position().sub(currentPos)).normalize();
    light.setDirection(currentHit);
    colorOfPixel = new Color();
    //Ray shadowRay = new Ray(currentPos,lightDirection);    
    /*PrimaryHit shadowHit = tracer.trace(shadowRay);
    if (shadowHit.isHit()){
      float brightness = normalVec.dotProduct(shadowRay.direction);
      colorOfPixel.add(light.getColor().mult(brightness));
    }
    else{
      float brightness = normalVec.dotProduct(shadowRay.direction);
      //if(brightness>0)
      colorOfPixel.add(light.getColor().mult(brightness));
    }
     set((int)currentPos.x,(int)currentPos.y,color(colorOfPixel.r(),colorOfPixel.g(),colorOfPixel.b()));   
     */
     if(!light.lightVisibility(currentHit.position.copy(),tracer)){
       float dotProduct=normalVec.dotProduct(light.direction());
       if(dotProduct>0.0){
         colorOfPixel.add(light.getColor().mult(dotProduct));        
       }
       else
       colorOfPixel.add(new Color());
     }
     set((int)currentPos.x,(int)currentPos.y,color(colorOfPixel.r(),colorOfPixel.g(),colorOfPixel.b())); 
   /* //Vector3D here = sampleHere.position();
    Vector3D n = sampleHere.direction();
    Color summed = new Color();
    light.setDirection(sampleHere);
    if(light.lightVisibility(sampleHere.position(),tracer)){
      //Lightsample ls=light.sample(here);
      float dotProduct = light.direction().dotProduct(n);
      if(dotProduct>0.0){
        float bright = light.brightness()*dotProduct;
        Color deltaCol = light.getColor().mult(bright);
        summed.add(deltaCol);
      }
    }
    else
      summed.add(light.shadowColor());
  return summed;*/
  }
}
