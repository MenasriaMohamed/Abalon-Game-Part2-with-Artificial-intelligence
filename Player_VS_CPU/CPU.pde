public class CPU{
controle cope ;
public ArrayList<Arbre> ArbreCP ;
int Alpha =-1000 ;
int Beta =1000;
int Score1 ;
int Score2;
Arbre a;

public CPU(){
ArbreCP = new ArrayList<Arbre>() ;
 a = new Arbre() ;
 Alpha =-1000 ;
 Beta =1000;
 cope =copier(jeux) ;
 Score1 = cope.player1.score ;
 Score2 = cope.player2.score ;
 
 int f = 3;
 
 remplireArbre(-1,cope,ArbreCP,f,Score1 ,Score2); 
 
 a.Ar = ArbreCP ; 
  max s= Max2(a) ;
   
  if(s.val<1){ 
   s= Max(a) ;
   if(s.val<1){
   s =Max1(a) ;
 
    }
 }
 
   
     
  go(jeux.player2.pawns.get(ArbreCP.get(s.id).id) , ArbreCP.get(s.id).movement,jeux.player2,jeux);

}
public controle copier(controle cope)
{  
   controle newcope =new controle(0);
   newcope.player1= new player();
   newcope.player2 = new player();
   pawn p;
   
            for(int i =0 ; i<cope.player1.pawns.size() ; i++)
            { p=new pawn(cope.player1.pawns.get(i).x ,cope.player1.pawns.get(i).y) ;
              newcope.player1.pawns.add(p);
              }
             for(int i =0 ; i<cope.player2.pawns.size() ; i++)
             { p=new pawn(cope.player2.pawns.get(i).x ,cope.player2.pawns.get(i).y) ;
               newcope.player2.pawns.add(p);
             }
             newcope.play= jeux.play ;
             newcope.player1.score = cope.player1.score ;
             newcope.player2.score = cope.player2.score ;
             return newcope ;
 }
 
  public player replayer(int i ,controle cope)
  { if(i==1) { return cope.player1 ;}

   return cope.player2;
  }
 
       public void remplireArbre(int r, controle cope ,ArrayList<Arbre> ArbreCP,int f,int Score1 , int Score2)
      {  
        controle avant= copier(cope);
          
          player p = replayer(r, cope) ;
          int size = p.pawns.size();
         
         
         for(int i =0 ;i<size ; i++)
         {   
           for(int j =1 ;j<=18 ;j++)
           { 
             select(p.pawns.get(i) , j ,p,cope,ArbreCP,f,r,i ,Score1 ,Score2);
             cope = copier(avant);
             p = replayer(r, cope);             
             size =p.pawns.size();            
           
           }
        }
     }
 
   public void select(pawn pw ,int movement , player p, controle cope,ArrayList<Arbre> ArbreCP,int f,int r,int i ,int Score1 , int Score2)
   {    
        int x = pw.x ;
        int y = pw.y ;
        int z ,n,d;
        switch ( movement) {
        case 1:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2 ,pw.x ,pw.y);}
        else{
        d=cope.move2(cope,p,(pw.y-4)*50+25 ,pw.x*50+25,z,n);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{
         cope.move3(cope,p,(pw.y-6)*50+25 ,pw.x*50+25,z,n,d);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         }        
    }
        break ;
        
        case 2:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{
        d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x-2)*50+25,z,n);
        if(tester(pw ,x ,y)){ Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{
         cope.move3(cope,p,(pw.y-3)*50+25 ,(pw.x-3)*50+25,z,n,d);
         if(tester(pw ,x ,y)){ Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         }
        
        }
        
        break ;
        case 3:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{
        d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x-2)*50+25,z,n);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{
         cope.move3(cope,p,(pw.y+3)*50+25 ,(pw.x-3)*50+25,z,n,d);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         }
        
        }
        
        break ;
        case 4:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y+2)*50+25 ,pw.x*50+25,z);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{    
        d=cope.move2(cope,p,(pw.y+4)*50+25 ,pw.x*50+25,z,n);
        if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
        else{ 
         cope.move3(cope,p,(pw.y+6)*50+25 ,pw.x*50+25,z,n,d);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         }
        
        }
        
        break ;
          case 5:
          z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z);
          if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
          else{
          d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x+2)*50+25,z,n);
          if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
          else{
          cope.move3(cope,p,(pw.y+3)*50+25 ,(pw.x+3)*50+25,z,n,d);
          if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
          }
        
        }
        
        
        break ;
        case 6:
        
          z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x+1)*50+25,z);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         else{
         d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x+2)*50+25,z,n);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         else{
         cope.move3(cope,p,(pw.y-3)*50+25 ,(pw.x+3)*50+25,z,n,d);
         if(tester(pw ,x ,y)){Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,0,Score1 ,Score2,pw.x ,pw.y);}
         } 
        }
        break ; 
        case 7:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        
        if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x-1)*50+25,z,n);
        if(tester(pw ,x ,y)){ 
        Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
               
        break ;  
        case 8:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z,n);
        if(tester(pw ,x ,y)){
        Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break ;      
        case 9:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x+1)*50+25,z,n);
        if(tester(pw ,x ,y)){
        Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break;    
        case 10:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z,n);
        if(tester(pw ,x ,y)){
        Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break;    
            case 11:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){d=cope.move2(cope,p,(pw.y-1)*50+25 ,(pw.x+1)*50+25,z,n);
         if(tester(pw ,x ,y)){
         Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break;       
         case 12:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x-1)*50+25,z,n);
         if(tester(pw ,x ,y)){
         Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break;       
           case 13:     
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x)*50+25,z,n);
         if(tester(pw ,x ,y)){
         Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
           break;          
           case 14:     
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +15);
         n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){  d=cope.move2(cope,p,(pw.y)*50+25 ,(pw.x+2)*50+25,z,n);
         if(tester(pw ,x ,y)){
         Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
        break; 
         case 15:     
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){  d=cope.move2(cope,p,(pw.y)*50+25 ,(pw.x-2)*50+25,z,n);
         if(tester(pw ,x ,y)){
         Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
          break;   
          case 16:     
          z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
          if(!tester(pw ,x ,y)&& n!=0){  d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x)*50+25,z,n);
          if(tester(pw ,x ,y)){
          Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}}
          break;          
          case 17 :
             z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
          if(!tester(pw ,x ,y)&& n!=0){  d=cope.move2(cope,p,(pw.y+3)*50+25 ,(pw.x-1)*50+25,z,n);
          if(tester(pw ,x ,y)){
          Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}} 
           break;
                   case 18 :
             z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
          if(!tester(pw ,x ,y)&& n!=0){  d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z,n);
          if(tester(pw ,x ,y)){
          Ajarbre( x , y , movement,cope,ArbreCP,f,r,i,4,Score1 ,Score2,pw.x ,pw.y);}} 
           break;
        
                 
     }
  }
  
    public void go(pawn pw ,int movement , player p, controle cope)
   {    int x = pw.x ;
        int y = pw.y ;
        int z ,n,d ;
        switch ( movement) {
        case 1:
         
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        
        n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
        
         if(!tester(pw ,x ,y)){ d=cope.move2(cope,p,(pw.y-4)*50+25 ,pw.x*50+25,z,n);
           
       if(!tester(pw ,x ,y)){ cope.move3(cope,p,(pw.y-6)*50+25 ,pw.x*50+25,z,n,d);}}
        break ;
        case 2:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
       
        n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
       
        if(!tester(pw ,x ,y)){ d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x-2)*50+25,z,n);
      
     if(!tester(pw ,x ,y)){cope.move3(cope,p,(pw.y-3)*50+25 ,(pw.x-3)*50+25,z,n,d);}}
        break ;
        case 3:
        z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
        n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
        if(!tester(pw ,x ,y)){ d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x-2)*50+25,z,n);
         if(!tester(pw ,x ,y)){ cope.move3(cope,p,(pw.y+3)*50+25 ,(pw.x-3)*50+25,z,n,d);} }
        break ;
        case 4:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y+2)*50+25 ,pw.x*50+25,z);
         if(!tester(pw ,x ,y)){  d=cope.move2(cope,p,(pw.y+4)*50+25 ,pw.x*50+25,z,n);
         if(!tester(pw ,x ,y)){cope.move3(cope,p,(pw.y+6)*50+25 ,pw.x*50+25,z,n,d);}}
         break ;
         case 5:
          z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z);
          if(!tester(pw ,x ,y)){ d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x+2)*50+25,z,n);
         if(!tester(pw ,x ,y)){cope.move3(cope,p,(pw.y+3)*50+25 ,(pw.x+3)*50+25,z,n,d);}}
         break ;
         case 6:
          z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x+1)*50+25,z);
         if(!tester(pw ,x ,y)){ d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x+2)*50+25,z,n);
         if(!tester(pw ,x ,y)){cope.move3(cope,p,(pw.y-3)*50+25 ,(pw.x+3)*50+25,z,n,d);} }
         break ; 
                 case 7:
                 z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
                 n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
                 if(!tester(pw ,x ,y)&& n==1){
                  d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x-1)*50+25,z,n);              
                 }
                  
        break ;  
         case 8:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
         if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z,n);
         }
         break ;   
         
         
         case 9:
         z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
         if(!tester(pw ,x ,y)&& n==1){ d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x+1)*50+25,z,n);
         }
         break ;   
           case 10:
           z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
         n=cope.move1(cope,p,(pw.y-2)*50+25 ,pw.x*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z,n);
         }
         break ;     
              case 11:
           z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
          n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
         if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y-1)*50+25 ,(pw.x+1)*50+25,z,n);
         }
         break ;     
              case 12:
              z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y-3)*50+25 ,(pw.x-1)*50+25,z,n);
              }
         break ;     
             case 13:
              z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y+2)*50+25 ,(pw.x)*50+25,z,n);
              }
         break ;  
             case 14:
              z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y-1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y)*50+25 ,(pw.x+2)*50+25,z,n);
              }
         break ;  
                   case 15:
               z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y)*50+25 ,(pw.x-2)*50+25,z,n);
              }
         break ;  
                              case 16:
               z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y-2)*50+25 ,(pw.x)*50+25,z,n);
              }
         break ;            
            case 17:
               z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y+3)*50+25 ,(pw.x-1)*50+25,z,n);
              }
         break ;            
                      case 18:
               z=cope.move0(cope ,p,pw.y*50 +25 , pw.x*50 +25);
              n=cope.move1(cope,p,(pw.y+1)*50+25 ,(pw.x-1)*50+25,z);
              if(!tester(pw ,x ,y)&& n!=0){ d=cope.move2(cope,p,(pw.y+1)*50+25 ,(pw.x+1)*50+25,z,n);
              }
         break ;            
      
   }
  }
 
 
         public boolean tester(pawn pw ,int x ,int y)
         { if(x!=pw.x || y!= pw.y ){ return true ;}
            return false ;
         }  
        public void Ajarbre(int x ,int y , int movement, controle cope,ArrayList<Arbre> ArbreCP,int f,int r,int i,int nb,int s1,int s2,int x1 , int y1)
        {  pawn p = new pawn(x,y);
           Arbre A = new Arbre(movement ,cope.player1.score ,cope.player2.score,p, nb ,s1,s2 , x1 , y1,r);
           A.id= i ;
           ArbreCP.add(A); 
           if(f!=1){
              r=-r ; 
              remplireArbre(r,cope,A.Ar,f-1 ,s1,s2);   
           }     
       }
       
     public max Max(Arbre a)
     { max m = new max() ;       
       if(a.Ar.size()==0) 
      { m.val = a.val1;     
        m.id = 0 ;  
        return  m;}
        
        m.val = -10000 ;
        max t ;
        for(int i =0 ; i<a.Ar.size() ; i++)
        {
        t =Min(a.Ar.get(i)) ;
       
        if(t.val> m.val) {   m .id = i ; m.val = t.val ;}    
        }  
        return m ;
     }
    
     
      public max Min(Arbre a)
      { max m = new max() ;       
        if(a.Ar.size()==0) 
        {m.val = a.val1;     
         m.id = 0 ;
         return  m;}
         m.val = 10000 ;
         max t ;
         for(int i =0 ; i<a.Ar.size() ; i++)
         { t =Max(a.Ar.get(i)) ;
           if(t.val< m.val) {  m .id = i ; m.val = t.val ; }   
         } 
       return m ;
     }
    
    public max Max1(Arbre a)
     { max m = new max() ;       
       if(a.Ar.size()==0) 
      { m.val = a.valeur;     
        m.id = 0 ;  
        return  m;}
        
        m.val = -10000 ;
        max t ;
        for(int i =0 ; i<a.Ar.size() ; i++)
        {
        t =Min1(a.Ar.get(i)) ;
      if(t.val> m.val) {  m .id = i ; m.val = t.val ;}    
        }  
        return m ;
     }
    
     
      public max Min1(Arbre a)
      { max m = new max() ;       
       
        m.val = a.valeur;     
         m.id = 0 ;
         return  m;
      
     }
  
      
      
      
      public max Max2(Arbre a)
     { max m = new max() ;       
       if(a.Ar.size()==0) 
      { m.val = a.val;     
        m.id = 0 ;  
        return  m;}
        
        m.val = -10000 ;
        max t ;
        for(int i =0 ; i<a.Ar.size() ; i++)
        {
        t =Min2(a.Ar.get(i)) ;
      if(t.val> m.val) {  m .id = i ; m.val = t.val ;}    
        }  
        return m ;
     }
    
     
      public max Min2(Arbre a)
      { max m = new max() ;       
        m.val = a.val;     
         m.id = 0 ;
         return  m;}
      
     }
     
   
