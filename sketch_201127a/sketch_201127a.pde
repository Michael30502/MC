//Marius og Anders kører ræs!!!!

//1.) Tegn klassediagram for programmet
//2.) Hvor i programmet anvendes "polymorfi"
//3.) Hvor i programmet anvendes "komposition" OVER DET HELE i klasserne
//4.) Mariuses to superhjul mangler den rigtige kode for at få "speedBonus", ret koden!
//5.) Lav en "supermotorcykel" der også får bonus fra "tanken", hvem skal have den??

MotorCykel andersesMC;
MotorCykel mariusesMC;

void setup(){
  size(500,500);
  //Her bygges Anderses mc
  andersesMC = new MotorCykel();
  andersesMC.y = 100;
  //Her bygges Mariuses mc
  mariusesMC = new MotorCykel();
  mariusesMC.y = 300;
  mariusesMC.forHjul = new SuperHjul();//DER er polymorfi
  mariusesMC.bagHjul = new SuperHjul();//DER er polymorfi
  andersesMC.tank = new SuperTank();
}

void draw(){
  clear();
  andersesMC.display();
  andersesMC.move();
  mariusesMC.display();
  mariusesMC.move();
      println(mariusesMC.forHjul.speedBonus);

}

class MotorCykel{
  float x=100,y=100;
  Styr styr     = new Styr();
  Hjul forHjul  = new Hjul();
  Hjul bagHjul  = new Hjul();
  Tank tank     = new Tank();
  
  void move(){
    x = x+.25 + forHjul.speedBonus + bagHjul.speedBonus+tank.speedBonus;  
  }
  
  void display(){
    styr.display(x+50,y);
    tank.display(x,y);
    forHjul.display(x,y+50);
    bagHjul.display(x+100,y+50);
  }
    
}

class Styr{
  void display(float x,float y){
    rect(x,y-30,60,10);//styr
    rect(x+50,y-20,10,50);
  }
}

class Tank{
  float speedBonus = 0;
  
   void display(float x,float y){
    rect(x,y,100,50);//tank
  }
}

class SuperTank extends Tank{

SuperTank(){
speedBonus = 2;
}

}

class Hjul{
  float radius = 50;
  float speedBonus =0;
  
  void display(float x,float y){
    circle(x,y,radius);//baghjul
  }
}

class SuperHjul extends Hjul{
  //Hvordan øges speedBonus ??

  SuperHjul(){
  speedBonus = 2;
  }
}
