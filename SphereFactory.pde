class SphereFactory{
  
  int amountOfSpheres;
  ArrayList <Sphere> sphereList;
  
  SphereFactory(int _amountOfSpheres){
    amountOfSpheres = _amountOfSpheres;
    sphereList = new ArrayList<Sphere>();
    buildSpheres();
  }
  
  SphereFactory(ArrayList<Sphere> sphereList){
    this.sphereList = sphereList;
  }
  
  
  void buildSpheres(){
    for(int i=0; i<amountOfSpheres; i++){
      Sphere s = new Sphere(); // puts random Spheres in sphereList
      sphereList.add(s); 
    }
  }
  
  int getSize(){
    return sphereList.size();
  }
  
  Sphere getSphere(int i){
    return sphereList.get(i);
  }
}
