class Scene{
  
  Sphere sphere;
  ArrayList<PrimaryHit> primaryHits;
  ArrayList<PrimaryHit> visibleHits;
  ArrayList<Sphere> spheres;
  Tracer tracer;
  Color colorOfPixel;
  Light light;
  SphereFactory sphereFactory;
  
  Scene(){   
    spheres = new ArrayList<Sphere>();
    primaryHits=new ArrayList<PrimaryHit>();
    visibleHits = new ArrayList<PrimaryHit>();
    sphereFactory=new SphereFactory(spheres);
    tracer = new Tracer(sphereFactory);
    init();
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
        visibleHits.add(currentHit);
      }
    }               //<>//
  // for every real Hit, fire an shadowray to the light, color the pixel  
    for(int l=0;l<visibleHits.size();l++){
      PrimaryHit currentHit = visibleHits.get(l);
      shade(currentHit);     
    }
  }
  
  void shade(PrimaryHit currentHit){
    Vector3D currentPos = currentHit.position();
    Vector3D normalVec = currentHit.direction();
    light.setDirection(currentHit);
    colorOfPixel = new Color();
     if(light.lightVisibility(currentHit.position.copy(),tracer)){
       float dotProduct=normalVec.dotProduct(light.direction());
       if(dotProduct>0.0){ //<>//
         colorOfPixel.add(light.getColor().mult(dotProduct));        
       }
       else
       colorOfPixel.add(new Color());
     }
     set((int)currentPos.x,(int)currentPos.y,color(colorOfPixel.r(),colorOfPixel.g(),colorOfPixel.b())); 
  }
  
  void init(){
    spheres.add(new Sphere(new Vector3D(width/2,height/2,100),50));
    spheres.add(new Sphere(new Vector3D(width/2+100,height/2,500),100));
    //spheres.add(new Sphere(new Vector3D(height/2,width/2,150),100));
    light = new Light(height/2,width/2,0, new Color(200,200,200));
  }
}
