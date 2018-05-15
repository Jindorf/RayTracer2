class TestVector3D{
  
  Vector3D a;
  Vector3D b;
  float x;
  float y;
  float z;
  
  TestVector3D(){
    x=50;
    y=150;
    z=200;
    initTest();
    println("add: " + testAdd());
    println("sub: " + testSub());
    println("mult: "+ testMult());
    println("div: " + testDiv());
    println("normalize: " + testNormalize());
    println("getAbsolute: " + testGetAbsolute());
    println("copy: " + testCopy());
    println("dotproduct: " + testDotProduct());
  }
  
  void initTest(){
    println("constructXYZ: " + testConstructorXYZ(x,y,z));
    println("constructV3D: " + testConstructorV3D(new Vector3D(x,y,z)));
  }
  boolean testConstructorXYZ(float x, float y, float z){
    a = new Vector3D(x,y,z);
    if(a.x == x && a.y == y && a.z == z)
      return true;
    return false;
  }
  boolean testConstructorV3D(Vector3D c){
    b = c;
    if(b.x == x && b.y == y && b.z == z)
      return true;
    return false;
  }
  boolean testAdd(){
    Vector3D c = a.add(b);
    if(c.x == x+x && c.y == y+y && c.z == z+z)
      return true;
    return false;
  }
  boolean testSub(){
   Vector3D c = a.sub(b);
    if(c.x == x-x && c.y == y-y && c.z == z-z)
      return true;
    return false;
  }
  boolean testMult(){
    Vector3D c = a.mult(5);
    if(c.x == 5*x && c.y== 5*y && c.z== 5*z)
      return true;
    return false;
  }
  boolean testDiv(){
    Vector3D c = a.div(5);
    if(c.x == x/5 && c.y== y/5 && c.z== z/5)
      return true;
    return false;
  }
  boolean testNormalize(){
    Vector3D c = a.normalize();
    if(sqrt(c.x*c.x+c.y*c.y+c.z*c.z)==1)
      return true;
    println("testNormalize, normalVector is: " + sqrt(c.x*c.x+c.y*c.y+c.z*c.z));  
    return false;
  }
  boolean testGetAbsolute(){
    float c = a.getAbsolute();
    if (c == sqrt(x*x+y*y+z*z))
      return true;
    return false;
  }
 boolean testCopy(){
   Vector3D c = a.copy();
   if(c.x == a.x && c.y == a.y && c.z == a.z && !c.equals(a))
     return true;
   return false;
 }
  boolean testDotProduct(){
    float c = a.dotProduct(b);
    if(c == a.x*b.x + a.y*b.y + a.z*b.z)
      return true;
    return false;
  }
  
}
