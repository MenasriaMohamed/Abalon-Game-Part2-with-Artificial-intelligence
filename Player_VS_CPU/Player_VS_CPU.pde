      public controle jeux ;
      PImage img; 
      player p ;
      int tour;
      int n =0 ,m= 0 ;
      int i,j, w, h,z,f ;
      CPU CP ;
      float r,g,b;
      int d = 0;
      boolean q;
      int e= 0;
      int [][]obst={
      {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},   
      {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}, 
      {2,2,2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2},
      {2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2},
      {2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2},
      {2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2},
      {2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,2,1,0,1,0,1,0,1,0,1,2,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
      {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
      };
      void setup() {
      size(1250, 650);
      img = loadImage("jeux.png");
      w=1250;
      h=650;
      tour=0;
      loadPixels();
      img.loadPixels();
      jeux= new controle() ;
  
      }
       
      void draw() {
           jeux.desine(0);
 
           if(jeux.play != 1) {
           e++ ;  
           if(e==2){ 
          
            CP= new CPU();
         
            
           e=0 ;
         } 
         }
      if(tour==-1)exit();
      }
      void mousePressed() {
       if (mouseButton == LEFT && jeux.player1.score!=6 && jeux.player2.score!=6) {
        if(jeux.play ==1)
      {p = jeux.player1;}
      else{
      p= jeux.player2 ;
      }
    
     if(p.nb ==0){
      z= jeux.move0(jeux , p ,mouseX,mouseY) ;
     }
     else{ 
     if(p.nb==1)
     { n=jeux.move1(jeux ,p ,mouseX,mouseY,z) ;     
       
       }
    else{
     if(p.nb==2)
     { 
       d= jeux.move2(jeux,p,mouseX,mouseY,z,n) ;         
       }
        else{jeux.move3(jeux, p,mouseX ,mouseY,z,n,d) ;}
         }
       } 
}else{
  if (mouseButton == RIGHT &&jeux.player1.score!=6 && jeux. player2.score!=6) { 
     if(p != null && p.nb> 0)
      {  
         p.nonselectionner() ;
         p.nb =0 ;
       }
       
     }
    }
 }
      
