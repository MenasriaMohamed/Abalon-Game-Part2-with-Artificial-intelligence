public class controle{
public player player1 , player2;
public int play = 1;
public controle(int k)
{ 

}
public controle()
{ player1 = new player() ;
 int j = 3;
 int k = 16;
 int s ;
 int m ;
 for(int i =3 ; i > 0; i--)
 {s = j;
  m = k;
  if(j== 3){
  j= 7 ;
  k = 12;
  }



 while (j < k)
 {
 player1.pawns.add(new pawn(i+1 ,j+3)) ;
 j =j+2 ;
 }
j= s+1;
k = m-1 ;
}

player2 = new player() ;
j=3 ;
k =16 ;
for(int i =7 ; i < 10; i++)
{   s =j ;
  m = k;
  if(j== 3){
   j= 7 ;
   k = 12;
  }
  while (j < k)
  {
   player2.pawns.add(new pawn(i+1 ,j+3)) ;
    j =j+2 ;
    }
j= s +1 ;
k = k-1 ;
k = m-1 ;
}

}

public void jouer(player p)
{ play = -play ;
 p.nonselectionner() ;
 p.nb =0 ;
}


public player changeplayer(player p)
{
  
  if(p==player1) return player2 ;
 return player1 ;
}

public void changer (pawn p , int x , int y)
{ p.x= x ;
 p . y = y ;
}

public int move0(controle jeux , player p , int mousex ,int mousey){
     boolean b =false ;
     int  z =0;
     while(b== false &&  z<p.pawns.size())
     {if(p.pawns.get(z).x*50 < mousey&&
     p.pawns.get(z).x*50 +50> mousey 
     && p.pawns.get(z).y*50 < mousex &&
     p.pawns.get(z).y*50 +50> mousex )
     {
     p.pawns.get(z).selectionner() ;
     p.pawnse.add(p.pawns.get(z));
     b= true ;
     p.nb++ ;
     
     } else{ z++ ;}
     }
   return z ;
}

public int move1(controle jeux , player p , int mousex ,int mousey ,int z){
int n=0; 
       if( p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
        (p.pawns.get(z).y-2)*50 +50> mousex ) {if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y-2)){p.nb++; n=1 ;}
        else{
         if(obst[p.pawns.get(z).x][p.pawns.get(z).y-2]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-2) )
         { 
            p.pawns.get(z).y = p.pawns.get(z).y-2;
           jeux.jouer(p);
         }
        }
      }
        else{
        if(p.pawns.get(z).x*50 < mousey && (p.pawns.get(z).x)*50 +50> mousey &&
 (p.pawns.get(z).y+2)*50 < mousex && (p.pawns.get(z).y+2)*50 +50> mousex)
      {if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y+2)){p.nb++; n=2 ;}
      else{
         if(obst[p.pawns.get(z).x][p.pawns.get(z).y+2]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+2) )
         { 
           p.pawns.get(z).y = p.pawns.get(z).y+2 ;   
           jeux.jouer(p);
         }
        }
      }
        else{     
        if((p.pawns.get(z).x+1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey &&
        (p.pawns.get(z).y+1)*50 < mousex && (p.pawns.get(z).y+1)*50 +50> mousex ) 
        {if(p.serch(p.pawns.get(z).x+1 ,p.pawns.get(z).y+1)){p.nb++; n=3 ;}  else{
         if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y+1]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y+1) )
         {p.pawns.get(z).x = p.pawns.get(z).x+1 ;
          p.pawns.get(z).y = p.pawns.get(z).y+1 ;
          jeux.jouer(p) ;
           
         }
        }
      } 
        else{
        if( (p.pawns.get(z).x+1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey &&
         (p.pawns.get(z).y-1)*50 < mousex && (p.pawns.get(z).y-1)*50 +50> mousex ) 
         {if(p.serch(p.pawns.get(z).x+1 ,p.pawns.get(z).y-1)){p.nb++; n=4;}
          else{
          if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y-1]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y-1))
          { p.pawns.get(z).x = p.pawns.get(z).x+1 ;
           p.pawns.get(z).y = p.pawns.get(z).y-1 ;
           jeux.jouer(p) ;
          
          
          }
        }
    
  
} 
        else{
        if( (p.pawns.get(z).x -1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey &&
       (p.pawns.get(z).y+1)*50 < mousex && (p.pawns.get(z).y+1)*50 +50> mousex ) 
       {if(p.serch(p.pawns.get(z).x-1 ,p.pawns.get(z).y+1)){p.nb++; n=5;}
           else{
         if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y+1]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y+1))
         { p.pawns.get(z).x = p.pawns.get(z).x-1 ;
           p.pawns.get(z).y = p.pawns.get(z).y+1 ;
        
           jeux.jouer(p);
           
          
          }
        }
      }
        else{
       if( (p.pawns.get(z).x -1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey &&
       (p.pawns.get(z).y-1)*50 < mousex && (p.pawns.get(z).y-1)*50 +50> mousex ) 
       {       
       if(p.serch(p.pawns.get(z).x-1 ,p.pawns.get(z).y-1)){p.nb++; n = 6;}
           else{
             
             
         if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y-1]!=2 && !jeux.changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y-1))
         { p.pawns.get(z).x = p.pawns.get(z).x-1 ;
           p.pawns.get(z).y = p.pawns.get(z).y-1 ;
           jeux.jouer(p) ;
          
           
                }
               }
              }
             }
            }
           }
          }        
         }
         return n ;
         }

public int move2(controle jeux , player p , int mousex ,int mousey,int z ,int n){
 int d = 0;    
  switch (n) {
   case 1:  
   if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-4)*50 < mousex &&
    (p.pawns.get(z).y-4)*50 +50> mousex ){
     if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y-4)){p.nb++; d =1 ; }
     else{ 
     if(obst[p.pawns.get(z).x][p.pawns.get(z).y-4]!=2 ) 
           {if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4) )
           {  
            p.changer(p.pawns.get(z).x , p.pawns.get(z).y -2 ,p.pawns.get(z).x , p.pawns.get(z).y-4) ;
            p.pawns.get(z).x = p.pawns.get(z).x ;
            p.pawns.get(z).y = p.pawns.get(z).y-2;
                
            jeux.jouer(p) ;
                
                
                 }else{
                  if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-6) && !p.exist(p.pawns.get(z).x,p.pawns.get(z).y-6)){
                    jeux.changeplayer(p).changer(p.pawns.get(z).x , p.pawns.get(z).y -4 ,p.pawns.get(z).x , p.pawns.get(z).y-6) ;
                    p.changer(p.pawns.get(z).x , p.pawns.get(z).y -2 ,p.pawns.get(z).x , p.pawns.get(z).y-4) ;
                    p.pawns.get(z).x = p.pawns.get(z).x ;
                    p.pawns.get(z).y = p.pawns.get(z).y-2;
                  
                    jeux.jouer(p) ;
                   
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y-4]==2)
                     { jeux.changeplayer(p).suprimer(p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
                         p.score() ;  
                           }
                         }
                       }
                     }
                   }
                }
             else{ 
          
             if( p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex && 
               (p.pawns.get(z).y+2)*50 +50> mousex ){if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y+2)){p.nb++; d=2; }
              else{  if(obst[p.pawns.get(z).x][p.pawns.get(z).y+2]!=2) 
              {  if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+2) ){  
                    p.changer(p.pawns.get(z).x , p.pawns.get(z).y -2 ,p.pawns.get(z).x ,  p.pawns.get(z).y) ;
                    p.pawns.get(z).x = p.pawns.get(z).x ;
                    p.pawns.get(z).y = p.pawns.get(z).y+2 ;         
                    jeux.jouer(p) ;
                   }else{
                    if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+4) && !p.exist(p.pawns.get(z).x,p.pawns.get(z).y+4)){
                    jeux.changeplayer(p).changer(p.pawns.get(z).x , p.pawns.get(z).y +2 ,p.pawns.get(z).x , p.pawns.get(z).y+4) ;
                    p.changer(p.pawns.get(z).x , p.pawns.get(z).y -2 ,p.pawns.get(z).x ,  p.pawns.get(z).y) ;
                    p.pawns.get(z).x = p.pawns.get(z).x ;
                    p.pawns.get(z).y = p.pawns.get(z).y+2 ;
                    jeux.jouer(p) ;
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y+2]==2)
                     { jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+2) ;
                       p.score() ;
                       }          
                     }
                   }   
                 }
               } 
            }else{
               if((p.pawnse.get(0).x-1)*50 < mousey && (p.pawnse.get(0).x-1)*50 +50> mousey && ( p.pawnse.get(0).y+1)*50 < mousex &&
               (p.pawnse.get(0).y+1)*50 +50> mousex   &&
               
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) && 
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
} else{


if((p.pawnse.get(1).x-1)*50 < mousey && (p.pawnse.get(1).x-1)*50 +50> mousey && ( p.pawnse.get(1).y-1)*50 < mousex &&
               (p.pawnse.get(1).y-1)*50 +50> mousex   &&
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1) && 
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y+1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
}else{

if((p.pawnse.get(0).x+1)*50 < mousey && (p.pawnse.get(0).x+1)*50 +50> mousey && ( p.pawnse.get(0).y+1)*50 < mousex &&
               (p.pawnse.get(0).y+1)*50 +50> mousex   &&
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) && 
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
       }else{
       
    if((p.pawnse.get(1).x+1)*50 < mousey && (p.pawnse.get(1).x+1)*50 +50> mousey && ( p.pawnse.get(1).y-1)*50 < mousex &&
               (p.pawnse.get(1).y-1)*50 +50> mousex   &&
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) && 
               !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
          }   
       }
   }
} 
            
            } 
          }
             break;
             
             
             case 2: 
              if(p.pawns.get(z).x*50 < mousey && (p.pawns.get(z).x)*50 +50> mousey &&
              (p.pawns.get(z).y+4)*50 < mousex && (p.pawns.get(z).y+4)*50 +50> mousex) 
              { 
              if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y+4)){ p.nb++; d=3;}
              else{if(obst[p.pawns.get(z).x][p.pawns.get(z).y+4]!=2 )
              {if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+4) )
              {  
                    p.changer(p.pawns.get(z).x , p.pawns.get(z).y +2 ,p.pawns.get(z).x ,  p.pawns.get(z).y+4);
                    p.pawns.get(z).x = p.pawns.get(z).x ;
                    p.pawns.get(z).y = p.pawns.get(z).y+2 ;  
                    jeux.jouer(p);
                   
                   }
                   else{
                    if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+6) && !p.exist(p.pawns.get(z).x,p.pawns.get(z).y+6)){   
                       jeux.changeplayer(p).changer(p.pawns.get(z).x , p.pawns.get(z).y +4 ,p.pawns.get(z).x , p.pawns.get(z).y+6) ; 
                       p.changer(p.pawns.get(z).x , p.pawns.get(z).y +2 ,p.pawns.get(z).x ,  p.pawns.get(z).y+4);
                       p.pawns.get(z).x = p.pawns.get(z).x ;
                       p.pawns.get(z).y = p.pawns.get(z).y+2 ;
                      
                       jeux.jouer(p) ;

                     if(obst[p.pawns.get(z).x][p.pawns.get(z).y+4]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                       p.score() ;
                        }          
                      }
                    }  
                  }  
                } 
              }
              else{if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey &&
              (p.pawns.get(z).y-2)*50 < mousex && (p.pawns.get(z).y-2)*50 +50> mousex) 
              {if(p.serch(p.pawns.get(z).x ,p.pawns.get(z).y-2)){p.nb++; d= 4;}
                else{if(obst[p.pawns.get(z).x][p.pawns.get(z).y-2]!=2) 
                {if( !jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-2) )
                 {  
                    p.changer(p.pawns.get(z).x , p.pawns.get(z).y+2 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                    p.pawns.get(z).x = p.pawns.get(z).x ;
                    p.pawns.get(z).y = p.pawns.get(z).y-2 ;
                    
                    jeux.jouer(p) ;
                    
                    }  else{
                      if(!jeux.changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4) && !p.exist(p.pawns.get(z).x,p.pawns.get(z).y-4)){   
                       jeux.changeplayer(p).changer(p.pawns.get(z).x , p.pawns.get(z).y -2 ,p.pawns.get(z).x , p.pawns.get(z).y-4) ; 
                       p.changer(p.pawns.get(z).x , p.pawns.get(z).y+2 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                       p.pawns.get(z).x = p.pawns.get(z).x ;
                       p.pawns.get(z).y = p.pawns.get(z).y-2 ;
                       
                       jeux.jouer(p) ;
                       
                    
                   
                     if(obst[p.pawns.get(z).x][p.pawns.get(z).y-2]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x ,p.pawns.get(z).y-2) ;
                       p.score() ;

                      }          
                   }
                 }  
                }
              }
             }else{
              if((p.pawnse.get(1).x-1)*50 < mousey && (p.pawnse.get(1).x-1)*50 +50> mousey && ( p.pawnse.get(1).y+1)*50 < mousex &&
               (p.pawnse.get(1).y+1)*50 +50> mousex   &&
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) && 
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(0).y+1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}
else{

        if((p.pawnse.get(0).x-1)*50 < mousey && (p.pawnse.get(1).x-1)*50 +50> mousey && ( p.pawnse.get(0).y-1)*50 < mousex &&
               (p.pawnse.get(0).y-1)*50 +50> mousex   &&
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) && 
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
}else{

       if((p.pawnse.get(1).x+1)*50 < mousey && (p.pawnse.get(1).x+1)*50 +50> mousey && ( p.pawnse.get(1).y+1)*50 < mousex &&
          (p.pawnse.get(1).y+1)*50 +50> mousex   &&
           !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) && 
           !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}else{

 if((p.pawnse.get(0).x+1)*50 < mousey && (p.pawnse.get(0).x+1)*50 +50> mousey && ( p.pawnse.get(0).y-1)*50 < mousex &&
          (p.pawnse.get(0).y-1)*50 +50> mousex   &&
           !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) && 
           !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
                  }
                }
              }
            }
          }   
        } 
    
    
    
    break;
           
           
              case 3: 
             if( (p.pawns.get(z).x +2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey &&
             (p.pawns.get(z).y+2)*50 < mousex && (p.pawns.get(z).y+2)*50 +50> mousex ) 
             { 
             
              if(p.serch(p.pawns.get(z).x+2 ,p.pawns.get(z).y+2)){p.nb++; d=5 ;}
                else{
                     if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y+2]!=2 ) 
                      {if(!jeux.changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2) )
                   {  
                     p.changer(p.pawns.get(z).x+1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x +2,  p.pawns.get(z).y+2);
                     p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                     p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                   
                     jeux.jouer(p);
                    

                     } 
                else{
                      if(!jeux.changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3) && !p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3)){   
                          
                        
                      jeux.changeplayer(p).changer(p.pawns.get(z).x+2 , p.pawns.get(z).y +2 ,p.pawns.get(z).x+3 , p.pawns.get(z).y+3) ; 
                      p.changer(p.pawns.get(z).x+1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x +2,  p.pawns.get(z).y+2);
                      p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                      p.pawns.get(z).y = p.pawns.get(z).y+1 ;                
                      jeux.jouer(p);  
                      if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y+2]==2)
                      {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+2,p.pawns.get(z).y+2) ;
                      p.score() ;
                      }          
                   }
                 }  
              }
            }
         }
             else{
              if((p.pawns.get(z).x -1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey &&
                (p.pawns.get(z).y-1)*50 < mousex && (p.pawns.get(z).y-1)*50 +50> mousex ) 
                {if(p.serch(p.pawns.get(z).x-1 ,p.pawns.get(z).y-1)){p.nb++; d=6 ;}
                  else{
                  if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y-1]!=2 )
                     {if( !jeux.changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y-1) )
                     {  
                     p.changer(p.pawns.get(z).x+1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                     p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                     p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                     
                     jeux.jouer(p) ;
                     
                     } 
                     else {
                      if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-2, p.pawns.get(z).y-2) && !p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2)){   
                     
                       jeux.changeplayer(p).changer(p.pawns.get(z).x-1,p.pawns.get(z).y-1 ,p.pawns.get(z).x-2 , p.pawns.get(z).y-2) ; 
                       
                       p.changer(p.pawns.get(z).x+1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                       p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                       p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                       
                       jeux.jouer(p);
                       
                     if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y-1]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x-1,p.pawns.get(z).y-1) ;
                       p.score() ;

                      }          
                   }
                 } 
                }
               }      
              }else{
                     if((p.pawnse.get(0).x-1)*50 < mousey && (p.pawnse.get(0).x-1)*50 +50> mousey && ( p.pawnse.get(0).y+1)*50 < mousex &&
               (p.pawnse.get(0).y+1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}else{
       if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y+2)*50 < mousex &&
               (p.pawnse.get(0).y+2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y+2)*50 < mousex &&
               (p.pawnse.get(1).y+2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y+2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y+2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y+2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y+2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y+2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y+2) ;
               this.jouer(p) ;
}else{
       if((p.pawnse.get(1).x+1)*50 < mousey && (p.pawnse.get(1).x+1)*50 +50> mousey && ( p.pawnse.get(1).y-1)*50 < mousex &&
               (p.pawnse.get(1).y-1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(0).y-1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p);
}else{

 if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y-2)*50 < mousex &&
               (p.pawnse.get(0).y-2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y-2)*50 < mousex &&
               (p.pawnse.get(1).y-2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y-2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y-2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y-2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y-2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y-2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y-2) ;
               this.jouer(p) ;
        }
       }
     }
   }
              
              
              } 
            }
            break;
          
            case 4:  
               
             if( (p.pawns.get(z).x +2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey &&
             (p.pawns.get(z).y-2)*50 < mousex && (p.pawns.get(z).y-2)*50 +50> mousex ) 
             {if(p.serch(p.pawns.get(z).x+2 ,p.pawns.get(z).y-2)){p.nb++; d=7 ;}
               else{
                 if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y-2]!=2 ) 
                 {if( !jeux.changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2) )
                  {  
                  p.changer(p.pawns.get(z).x +1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x+2 ,  p.pawns.get(z).y-2);
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                  
                  jeux.jouer(p) ;
                  
                } else{
                   if(!jeux.changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3) && !p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3)){   
                          
                        
                      jeux.changeplayer(p).changer(p.pawns.get(z).x+2 , p.pawns.get(z).y -2 ,p.pawns.get(z).x+3 , p.pawns.get(z).y-3) ; 
                     p.changer(p.pawns.get(z).x +1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x+2 ,  p.pawns.get(z).y-2);
                     p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                     p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                    
                     jeux.jouer(p) ;
                     
                     if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y-2]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x+2,p.pawns.get(z).y-2) ;
                       p.score() ;

                      }          
                   }
                 }
               }
              }
              }else{
              if( (p.pawns.get(z).x -1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey &&
             (p.pawns.get(z).y+1)*50 < mousex && (p.pawns.get(z).y+1)*50 +50> mousex ) 
             {if(p.serch(p.pawns.get(z).x-1 ,p.pawns.get(z).y+1)){p.nb++; d=8 ;}
               else{
                 if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y+1]!=2) 
                 {if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y+1) )
                 {  
                  p.changer(p.pawns.get(z).x +1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x,  p.pawns.get(z).y);
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 
                  jeux.jouer(p) ;
                 
                        } else{
                   if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2) && !p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2)){   
                     jeux.changeplayer(p).changer(p.pawns.get(z).x-1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x-2 , p.pawns.get(z).y+2) ; 
                     p.changer(p.pawns.get(z).x +1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x,  p.pawns.get(z).y);
                     p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                     p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                     
                     jeux.jouer(p) ;
                    
                     if(obst[p.pawns.get(z).x-1][p.pawns.get(z).y+1]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x-1,p.pawns.get(z).y+1) ;
                       p.score() ;

                      }          
                   }
                 }     
               }   
              }
            }else{
             if((p.pawnse.get(1).x+1)*50 < mousey && (p.pawnse.get(1).x+1)*50 +50> mousey && ( p.pawnse.get(1).y+1)*50 < mousex &&
               (p.pawnse.get(1).y+1)*50 +50> mousex   &&                          
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) &&       
               !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}else{
  if(((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y+2)*50 < mousex &&
               (p.pawnse.get(0).y+2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y+2)*50 < mousex &&
               (p.pawnse.get(1).y+2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y+2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y+2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y+2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y+2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y+2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y+2) ;
               this.jouer(p) ;
}else{ if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y-2)*50 < mousex &&
               (p.pawnse.get(0).y-2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y-2)*50 < mousex &&
               (p.pawnse.get(1).y-2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y-2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y-2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y-2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y-2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y-2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y-2) ;
               this.jouer(p) ;
        }else{
       if((p.pawnse.get(0).x-1)*50 < mousey && (p.pawnse.get(0).x-1)*50 +50> mousey && ( p.pawnse.get(0).y-1)*50 < mousex &&
               (p.pawnse.get(0).y-1)*50 +50> mousex   &&              
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(0).y-1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p);
           }  
       }
  }
}
            
            
            }
          } 
             break;
            case 5:  
                if( (p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey &&
                (p.pawns.get(z).y+2)*50 < mousex && (p.pawns.get(z).y+2)*50 +50> mousex ) 
                 {if(p.serch(p.pawns.get(z).x-2 ,p.pawns.get(z).y+2)){p.nb++; d= 9;}
                    else{if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y+2]!=2 )
                    {if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2) )
                {  
                  p.changer(p.pawns.get(z).x -1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x-2 ,  p.pawns.get(z).y+2);
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 
                  jeux.jouer(p) ;
                 
                   }else{
                   if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3) && !p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3)){   
                     jeux.changeplayer(p).changer(p.pawns.get(z).x-2 , p.pawns.get(z).y +2 ,p.pawns.get(z).x-3 , p.pawns.get(z).y+3) ; 
                    p.changer(p.pawns.get(z).x -1 , p.pawns.get(z).y +1 ,p.pawns.get(z).x-2 ,  p.pawns.get(z).y+2);
                     p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                    p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                    
                   jeux.jouer(p) ;
                   
                     if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y+2]==2)
                     { jeux.changeplayer(p).suprimer(p.pawns.get(z).x-2,p.pawns.get(z).y+2) ;
                       p.score() ;

                      }          
                   }
                 }
               }   
             }
          }
                else{
                  if( (p.pawns.get(z).x +1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey &&
                  (p.pawns.get(z).y-1)*50 < mousex && (p.pawns.get(z).y-1)*50 +50> mousex ) 
              {if(p.serch(p.pawns.get(z).x+1 ,p.pawns.get(z).y-1)){p.nb++; d=10;}
                  else{
                    if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y-1]!=2) 
                    {if( !jeux.changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y-1) )
                    {  
                  p.changer(p.pawns.get(z).x -1, p.pawns.get(z).y +1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1;
                 
                  jeux.jouer(p) ;
                  
                  }else{
                   if(!jeux.changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2) && !p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2)){   
                     jeux.changeplayer(p).changer(p.pawns.get(z).x+1 , p.pawns.get(z).y-1 ,p.pawns.get(z).x+2, p.pawns.get(z).y-2) ; 
                     p.changer(p.pawns.get(z).x -1, p.pawns.get(z).y +1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                     p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                     p.pawns.get(z).y = p.pawns.get(z).y-1;
                    
                     jeux.jouer(p) ;
                     
                     if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y-1]==2)
                     { jeux.changeplayer(p).suprimer(p.pawns.get(z).x+1,p.pawns.get(z).y-1) ;
                      p.score() ;

                       }          
                     }
                   }
                 }
               }
             }else{
             if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y+2)*50 < mousex &&
               (p.pawnse.get(0).y+2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y+2)*50 < mousex &&
               (p.pawnse.get(1).y+2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y+2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y+2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y+2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y+2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y+2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y+2) ;
               this.jouer(p) ;
}else{
 
  if((p.pawnse.get(0).x+1)*50 < mousey && (p.pawnse.get(0).x+1)*50 +50> mousey && ( p.pawnse.get(0).y+1)*50 < mousex &&
               (p.pawnse.get(0).y+1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}else{


  if((p.pawnse.get(1).x-1)*50 < mousey && (p.pawnse.get(1).x-1)*50 +50> mousey && ( p.pawnse.get(1).y-1)*50 < mousex &&
               (p.pawnse.get(1).y-1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y-1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
}else{


 if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y-2)*50 < mousex &&
               (p.pawnse.get(0).y-2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y-2)*50 < mousex &&
               (p.pawnse.get(1).y-2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y-2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y-2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y-2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y-2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y-2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y-2) ;
               this.jouer(p) ;
        }
     }
  }

}
             
             }  
           }
              
             break;
            case 6:  
             if( (p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey &&
                 (p.pawns.get(z).y-2)*50 < mousex && (p.pawns.get(z).y-2)*50 +50> mousex ) 
                 {if(p.serch(p.pawns.get(z).x-2 ,p.pawns.get(z).y-2)){p.nb++; d= 11 ;}
                   else{
                  if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y-2]!=2) 
                  {if( !jeux.changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2))
                 {  
                  p.changer(p.pawns.get(z).x -1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x-2, p.pawns.get(z).y-2);
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                                    
                  jeux.jouer(p) ;
                 

                  }else{
                   if(!jeux.changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3) && !p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3)){   
                     jeux.changeplayer(p).changer(p.pawns.get(z).x-2 , p.pawns.get(z).y-2 ,p.pawns.get(z).x-3, p.pawns.get(z).y-3) ; 
                      p.changer(p.pawns.get(z).x -1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x-2, p.pawns.get(z).y-2);
                      p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                      p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                     
                      jeux.jouer(p) ;
                     
                      if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y-2]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x-2,p.pawns.get(z).y-2) ;
                       p.score() ;

                       }          
                     }
                   }
                }  
             }
                 }
                 else{
                 if((p.pawns.get(z).x +1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey &&
                 (p.pawns.get(z).y+1)*50 < mousex && (p.pawns.get(z).y+1)*50 +50> mousex ) 
                 {if(p.serch(p.pawns.get(z).x+1 ,p.pawns.get(z).y+1)){p.nb++; d=12 ; }
                   else{
                     if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y+1]!=2)
                {
                  if( !jeux.changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y+1) )
                  {p.changer(p.pawns.get(z).x-1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                  
                  jeux.jouer(p) ;
                 
                  }else{
                      if(!jeux.changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2) && !p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2)){   
                      jeux.changeplayer(p).changer(p.pawns.get(z).x+1 , p.pawns.get(z).y+1 ,p.pawns.get(z).x+2, p.pawns.get(z).y+2) ; 
                      p.changer(p.pawns.get(z).x-1 , p.pawns.get(z).y -1 ,p.pawns.get(z).x ,  p.pawns.get(z).y);
                      p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                      p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                      p.nonselectionner() ;
                      jeux.jouer(p) ;
                      
                      if(obst[p.pawns.get(z).x+1][p.pawns.get(z).y+1]==2)
                      { jeux.changeplayer(p).suprimer(p.pawns.get(z).x+1,p.pawns.get(z).y+1) ;
                       p.score() ;

                       }          
                     }
                   }          
                }  
              }
            }else{
            if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y-2)*50 < mousex &&
               (p.pawnse.get(0).y-2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y-2)*50 < mousex &&
               (p.pawnse.get(1).y-2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y-2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y-2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y-2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y-2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y-2]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y-2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y-2) ;
               this.jouer(p) ;
        }else{
        
    if( ((p.pawnse.get(0).x)*50< mousey &&(p.pawnse.get(0).x)*50 +50> mousey && (( p.pawnse.get(0).y+2)*50 < mousex &&
               (p.pawnse.get(0).y+2)*50 +50> mousex)|| ((p.pawnse.get(1).x)*50< mousey 
               &&(p.pawnse.get(1).x)*50 +50> mousey && (( p.pawnse.get(1).y+2)*50 < mousex &&
               (p.pawnse.get(1).y+2)*50 +50> mousex) ))  &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&  
               !this.changeplayer(p).exist(p.pawnse.get(1).x, p.pawnse.get(1).y+2)&&
               !p.exist(p.pawnse.get(0).x , p.pawnse.get(0).y+2) &&
               !p.exist(p.pawnse.get(1).x , p.pawnse.get(1).y+2) &&
                obst[p.pawnse.get(0).x][p.pawnse.get(0).y+2]!= 2 &&
                obst[p.pawnse.get(1).x][p.pawnse.get(1).y+2]!= 2 
               )
              { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x ,p.pawnse.get(0).y+2) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x ,p.pawnse.get(1).y+2) ;
               this.jouer(p) ;
               }else{
               if((p.pawnse.get(1).x-1)*50 < mousey && (p.pawnse.get(1).x-1)*50 +50> mousey && ( p.pawnse.get(1).y+1)*50 < mousex &&
               (p.pawnse.get(1).y+1)*50 +50> mousex   &&              
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) && 
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y+1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y+1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y+1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y+1]!= 2 
               )
             { 
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y+1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y+1) ;
               this.jouer(p) ;
}else{

  if((p.pawnse.get(0).x-1)*50 < mousey && (p.pawnse.get(0).x-1)*50 +50> mousey && ( p.pawnse.get(0).y-1)*50 < mousex &&
               (p.pawnse.get(0).y-1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x-1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x-1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x-1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x-1][p.pawnse.get(1).y-1]!= 2)
             {  
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x-1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x-1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
                     }else{
             
  if((p.pawnse.get(0).x+1)*50 < mousey && (p.pawnse.get(0).x+1)*50 +50> mousey && ( p.pawnse.get(0).y-1)*50 < mousex &&
               (p.pawnse.get(0).y-1)*50 +50> mousex   &&              
             
               !this.changeplayer(p).exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) && 
               
               !this.changeplayer(p).exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
               !p.exist(p.pawnse.get(0).x+1 , p.pawnse.get(0).y-1) &&
               !p.exist(p.pawnse.get(1).x+1 , p.pawnse.get(1).y-1)&&
                obst[p.pawnse.get(0).x+1][p.pawnse.get(0).y-1]!= 2 &&
                obst[p.pawnse.get(1).x+1][p.pawnse.get(1).y-1]!= 2)
             {  
               this .changer(p.pawnse.get(0),p.pawnse.get(0).x+1 ,p.pawnse.get(0).y-1) ;
               this .changer(p.pawnse.get(1),p.pawnse.get(1).x+1 ,p.pawnse.get(1).y-1) ;
               this.jouer(p) ;
                      }
                  
                    }
                  }     
               }    
            }
          } 
        }    
                break;
            
   }
 return d ;

}
public void move3(controle jeux , player p , int mousex ,int mousey ,int z ,int n , int d){
   
  
  switch (n) {
     case 1:  
     switch (d) {  
         case 1:   
         
         if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex &&
          (p.pawns.get(z).y+2)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y+2] != 2 ) 
         {if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+2))
           {
           if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+2)){    
            p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
            p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-2) ;                  
            p.pawns.get(z).y = p.pawns.get(z).y+2 ;
            jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+4))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-2) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+4) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+6)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+6)){
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-2) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ; 
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ; 
                
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+6]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+6) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;
                          }
                        }   
                      }
                    }
                  }
                }
                else{
             if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-6)*50 < mousex &&
             (p.pawns.get(z).y-6)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y-6] != 2 ) 
              {   
                if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-6))
              {  
              if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-6)){    
              p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
              p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ;                  
              p.pawns.get(z).y = p.pawns.get(z).y-2 ;
              jeux.jouer(p);
               }
               else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-8))
                   {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-8))
                   {p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ;                  
                    changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-6,p.pawns.get(z).x ,p.pawns.get(z).y-8) ;        
                    jeux.jouer(p);
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y-8]==2)
                    {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-8) ;
                    p.score();
                    }
                    p.pawns.get(z).y = p.pawns.get(z).y-2;   
                    }else{
                      

             
                    if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-10)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-10)){
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ;                  
                     changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-8,p.pawns.get(z).x ,p.pawns.get(z).y-10) ; 
                     changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-6,p.pawns.get(z).x ,p.pawns.get(z).y-8) ; 
                
                    jeux.jouer(p); 
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y-10]==2)
                    {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-10) ;
                    
                    p.score();
                    }
                    p.pawns.get(z).y = p.pawns.get(z).y-2 ;
                      }
                    }   
                  }
                }
              }
            }   
          } 
         break ;
         case 2: 
          if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y+4)*50 < mousex &&
           (p.pawns.get(z).y+4)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y+4]!=2) 
            { 
             if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+4))
            { 
             if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+4)){    
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;                  
             p.pawns.get(z).y = p.pawns.get(z).y+2 ;
             jeux.jouer(p); 
            
            }
            else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+6))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+6))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6);        
                 jeux.jouer(p);
                 
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+6]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+6) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+8)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+8)){
                
                   p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                   p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;                  
                   changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+6,p.pawns.get(z).x ,p.pawns.get(z).y+8) ; 
                   changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ; 
                   
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+8]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+8) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;
                          }
                        }   
                      }
                    }
                  }
                }
              else{
             if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-4)*50 < mousex &&
             (p.pawns.get(z).y-4)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y-4] != 2 ) 
              {if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-4))
              { 
              if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4)){    
              p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
              p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
              p.pawns.get(z).y = p.pawns.get(z).y-2 ;
              jeux.jouer(p);
               }
               else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-6))
                   {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-6))
                   {p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
                    changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ;        
                    jeux.jouer(p);
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y-6]==2)
                    {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-6) ;
                    p.score();
                    }
                    p.pawns.get(z).y = p.pawns.get(z).y-2;   
                    }else{
                    if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-8)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-8)){
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;
                    p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
                    changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-6,p.pawns.get(z).x ,p.pawns.get(z).y-8) ; 
                    changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ; 
                    jeux.jouer(p); 
                    if(obst[p.pawns.get(z).x][p.pawns.get(z).y-8]==2)
                    {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-86) ;
                    p.score();
                    }
                    p.pawns.get(z).y = p.pawns.get(z).y-2 ;
                      }
                    }   
                  }
                }
              }
            }   
          }          
      break ;
     }
     break;
     case 2:
      switch (d) {  
      case 3: 
        if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
        (p.pawns.get(z).y-2)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y-2] != 2 ) 
        {  
        if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-2)){    
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+2) ;                  
             p.pawns.get(z).y = p.pawns.get(z).y-2 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+2) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y-4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-4) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y-2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-6)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4)){
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+2) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6); 
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y-6]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-6) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y-2;
                          }
                        }   
                      }
                    }
                  }
                }else{
                if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y+6)*50 < mousex &&
                  (p.pawns.get(z).y+6)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y+6] != 2 ) 
                  {  
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+6))
                 { 
                if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+6)){    
                p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ;                  
                p.pawns.get(z).y = p.pawns.get(z).y+2 ;
                jeux.jouer(p);                 
                }
                else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+8))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+8))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+6,p.pawns.get(z).x ,p.pawns.get(z).y+8) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+8]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+8) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+10)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+10)){
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+6,p.pawns.get(z).x ,p.pawns.get(z).y+8); 
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+8,p.pawns.get(z).x ,p.pawns.get(z).y+10); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+10]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+10) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2;
                          }
                        }   
                      }
                    }
                  }
                }   
              }
      break ;
      case 4 :
       if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y+4)*50 < mousex &&
        (p.pawns.get(z).y+4)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y+4] != 2 ) 
        {  
        if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+4))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+4)){    
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
             p.pawns.get(z).y = p.pawns.get(z).y+2 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+6))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+6))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+6]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+6) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y+8)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y+8)){
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y+4) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+6,p.pawns.get(z).x ,p.pawns.get(z).y+8); 
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y+4,p.pawns.get(z).x ,p.pawns.get(z).y+6); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y+8]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y+8) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y+2;
                          }
                        }   
                      }
                    }
                  }
                }else{
                
                 if(p.pawns.get(z).x*50 < mousey && p.pawns.get(z).x*50 +50> mousey && ( p.pawns.get(z).y-4)*50 < mousex &&
        (p.pawns.get(z).y-4)*50 +50> mousex && obst[p.pawns.get(z).x][p.pawns.get(z).y-4] != 2 ) 
        {  
        if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-4))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-4)){    
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
             p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;                  
             p.pawns.get(z).y = p.pawns.get(z).y-2 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-6))
                {if(!changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-6))
                {p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y-6]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-6) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y-2 ;   
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x,p.pawns.get(z).y-8)  && !changeplayer(p).exist(p.pawns.get(z).x,p.pawns.get(z).y-8)){
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y+2,p.pawns.get(z).x ,p.pawns.get(z).y) ;
                 p.changer(p.pawns.get(z).x,p.pawns.get(z).y-2,p.pawns.get(z).x ,p.pawns.get(z).y-4) ;                  
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-6,p.pawns.get(z).x ,p.pawns.get(z).y-8); 
                 changeplayer(p).changer(p.pawns.get(z).x,p.pawns.get(z).y-4,p.pawns.get(z).x ,p.pawns.get(z).y-6); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x][p.pawns.get(z).y-8]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x,p.pawns.get(z).y-8) ;
                 p.score();
                 }
                 p.pawns.get(z).y = p.pawns.get(z).y-2;
                          }
                        }   
                      }
                    }
                  }
                }              
            }
      break ;         
     }   
     break ;
   case 3:
   switch (d) { 
    case 5: 
    if((p.pawns.get(z).x+3)*50 < mousey && (p.pawns.get(z).x+3)*50 +50> mousey && ( p.pawns.get(z).y+3)*50 < mousex &&
        (p.pawns.get(z).y+3)*50 +50> mousex && obst[p.pawns.get(z).x+3][p.pawns.get(z).y+3] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3)){    
             p.pawnse.get(2).x =p.pawnse.get(0).x+3 ;
             p.pawnse.get(2).y =p.pawnse.get(0).y+3 ;
             p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
             p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4))
                { p.pawnse.get(2).x =p.pawnse.get(0).x+3 ;
                  p.pawnse.get(2).y =p.pawnse.get(0).y+3 ;
                  p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
                  p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;                    
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y+3,p.pawns.get(z).x+4 ,p.pawns.get(z).y+4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y+4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y+4) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+5,p.pawns.get(z).y+5)  && !changeplayer(p).exist(p.pawns.get(z).x+5,p.pawns.get(z).y+5)){
                  p.pawnse.get(2).x =p.pawnse.get(0).x+3 ;
                  p.pawnse.get(2).y =p.pawnse.get(0).y+3 ;
                  p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
                  p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;                    
                 changeplayer(p).changer(p.pawns.get(z).x+4,p.pawns.get(z).y+4,p.pawns.get(z).x+5 ,p.pawns.get(z).y+5); 
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y+3,p.pawns.get(z).x+4 ,p.pawns.get(z).y+4); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x+5][p.pawns.get(z).y+5]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+5,p.pawns.get(z).y+5) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
        if((p.pawns.get(z).x-1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey && ( p.pawns.get(z).y-1)*50 < mousex &&
        (p.pawns.get(z).y-1)*50 +50> mousex && obst[p.pawns.get(z).x-1][p.pawns.get(z).y-1] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x-1,p.pawns.get(z).y-1))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y-1)){    
             p.pawnse.get(2).x =p.pawnse.get(1).x ;
             p.pawnse.get(2).y =p.pawnse.get(1).y ;
             p.pawnse.get(1).x =p.pawnse.get(0).x ;
             p.pawnse.get(1).y =p.pawnse.get(0).y ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2))
                { p.pawnse.get(2).x =p.pawnse.get(1).x ;
                  p.pawnse.get(2).y =p.pawnse.get(1).y ;
                  p.pawnse.get(1).x =p.pawnse.get(0).x ;
                  p.pawnse.get(1).y =p.pawnse.get(0).y ;                    
                 changeplayer(p).changer(p.pawns.get(z).x-1,p.pawns.get(z).y-1,p.pawns.get(z).x-2 ,p.pawns.get(z).y-2) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y-2]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-2,p.pawns.get(z).y-2) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3)  && !changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3)){
                  p.pawnse.get(2).x =p.pawnse.get(1).x ;
                  p.pawnse.get(2).y =p.pawnse.get(1).y ;
                  p.pawnse.get(1).x =p.pawnse.get(0).x ;
                  p.pawnse.get(1).y =p.pawnse.get(0).y ;                    
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y-2,p.pawns.get(z).x-3 ,p.pawns.get(z).y-3); 
                 changeplayer(p).changer(p.pawns.get(z).x-1,p.pawns.get(z).y-1,p.pawns.get(z).x-2 ,p.pawns.get(z).y-2); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y-3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y-3) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }      
      }     
   break ;
   case 6:
    if((p.pawns.get(z).x+2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex &&
        (p.pawns.get(z).y+2)*50 +50> mousex && obst[p.pawns.get(z).x+2][p.pawns.get(z).y+2] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2)){    
             p.pawnse.get(2).x =p.pawnse.get(0).x ;
             p.pawnse.get(2).y =p.pawnse.get(0).y ;
             p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
             p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3))
                {  
                  p.pawnse.get(2).x =p.pawnse.get(0).x ;             
                 p.pawnse.get(2).y =p.pawnse.get(0).y ;
                 p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
                p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;   
                                  
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y+2,p.pawns.get(z).x+3 ,p.pawns.get(z).y+3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y+3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y+3) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4)  && !changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4)){
                  p.pawnse.get(2).x =p.pawnse.get(0).x ;             
                 p.pawnse.get(2).y =p.pawnse.get(0).y ;
                 p.pawnse.get(1).x =p.pawnse.get(0).x+2 ;
                p.pawnse.get(1).y =p.pawnse.get(0).y+2 ;                      
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y+3,p.pawns.get(z).x+4 ,p.pawns.get(z).y+4); 
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y+2,p.pawns.get(z).x+3 ,p.pawns.get(z).y+3); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y+4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y+4) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
     if((p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
        (p.pawns.get(z).y-2)*50 +50> mousex && obst[p.pawns.get(z).x-2][p.pawns.get(z).y-2] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(0).x ;
             p.pawnse.get(1).y =p.pawnse.get(0).y ;               
             
             p.pawns.get(z).x = p.pawns.get(z).x-1;
             p.pawns.get(z).y = p.pawns.get(z).y-1;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3))
                {  
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(0).x ;
             p.pawnse.get(1).y =p.pawnse.get(0).y ;     
                                  
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y-2,p.pawns.get(z).x-3 ,p.pawns.get(z).y-3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y-3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y-3) ;
                 p.score();
                 }
                p.pawns.get(z).x = p.pawns.get(z).x-1;
             p.pawns.get(z).y = p.pawns.get(z).y-1;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4)  && !changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(0).x ;
             p.pawnse.get(1).y =p.pawnse.get(0).y ;                          
                 changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y-3,p.pawns.get(z).x-4 ,p.pawns.get(z).y-4); 
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y-2,p.pawns.get(z).x-3 ,p.pawns.get(z).y-3); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y-4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y-4) ;
                 p.score();
                 }
                 p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }             
                
                
                
                
                
                
                
                
                }
   
   
   break;
   }
 break ;
  case 4 :
  switch (d) {
  case 7 :
     if((p.pawns.get(z).x+3)*50 < mousey && (p.pawns.get(z).x+3)*50 +50> mousey && ( p.pawns.get(z).y-3)*50 < mousex &&
        (p.pawns.get(z).y-3)*50 +50> mousex && obst[p.pawns.get(z).x+3][p.pawns.get(z).y-3] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;  
                 
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y-3,p.pawns.get(z).x+4 ,p.pawns.get(z).y-4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y-4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y-4) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+5,p.pawns.get(z).y-5)  && !changeplayer(p).exist(p.pawns.get(z).x+5,p.pawns.get(z).y-5)){
                    p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                   
                 changeplayer(p).changer(p.pawns.get(z).x+4,p.pawns.get(z).y-4,p.pawns.get(z).x+5 ,p.pawns.get(z).y-5); 
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y-3,p.pawns.get(z).x+4 ,p.pawns.get(z).y-4); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x+5][p.pawns.get(z).y-5]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+5,p.pawns.get(z).y-5) ;
                 p.score();
                 }
                p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
         if((p.pawns.get(z).x-1)*50 < mousey && (p.pawns.get(z).x-1)*50 +50> mousey && ( p.pawns.get(z).y+1)*50 < mousex &&
        (p.pawns.get(z).y+1)*50 +50> mousex && obst[p.pawns.get(z).x-1][p.pawns.get(z).y+1] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x-1,p.pawns.get(z).y+1))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-1,p.pawns.get(z).y+1)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2))
                {  
                  p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;    
                 
                 changeplayer(p).changer(p.pawns.get(z).x-1,p.pawns.get(z).y+1,p.pawns.get(z).x-2 ,p.pawns.get(z).y+2) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-2][p.pawns.get(z).y+2]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-2,p.pawns.get(z).y+2) ;
                 p.score();
                 }
                   p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3)  && !changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3)){
                    p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                    p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y+2,p.pawns.get(z).x-3 ,p.pawns.get(z).y+3); 
                 changeplayer(p).changer(p.pawns.get(z).x-1,p.pawns.get(z).y+1,p.pawns.get(z).x-2 ,p.pawns.get(z).y+2); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y+3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y+3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }           
             }
  break ;
  case 8 :
  if((p.pawns.get(z).x+2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
        (p.pawns.get(z).y-2)*50 +50> mousex && obst[p.pawns.get(z).x+2][p.pawns.get(z).y-2] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y-2,p.pawns.get(z).x+3 ,p.pawns.get(z).y-3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y-3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y-3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4)  && !changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                  p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                  
                 changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y-3,p.pawns.get(z).x+4 ,p.pawns.get(z).y-4); 
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y-2,p.pawns.get(z).x+3 ,p.pawns.get(z).y-3); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y-4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y-4) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
                
  if((p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex &&
        (p.pawns.get(z).y+2)*50 +50> mousex && obst[p.pawns.get(z).x-2][p.pawns.get(z).y+2] != 2 ) 
        { 
        if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y+2,p.pawns.get(z).x-3 ,p.pawns.get(z).y+3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y+3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y+3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4)  && !changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                  p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                 changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y+3,p.pawns.get(z).x-4 ,p.pawns.get(z).y+4); 
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y+2,p.pawns.get(z).x-3 ,p.pawns.get(z).y+3); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y+4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y+4) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }              
                
                
                
                
                
                
                
                
                
                
                
                
                
                } 
  
  
  break ;
  }
  
  break ;
 case 5 :
  switch (d) {
  case 9:

     if((p.pawns.get(z).x-3)*50 < mousey && (p.pawns.get(z).x-3)*50 +50> mousey && ( p.pawns.get(z).y+3)*50 < mousex &&
        (p.pawns.get(z).y+3)*50 +50> mousex && obst[p.pawns.get(z).x-3][p.pawns.get(z).y+3] != 2 ) 
        {   
        if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y+3,p.pawns.get(z).x-4 ,p.pawns.get(z).y+4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y+4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y+4) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-5,p.pawns.get(z).y+5)  && !changeplayer(p).exist(p.pawns.get(z).x-5,p.pawns.get(z).y+5)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                  p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                 changeplayer(p).changer(p.pawns.get(z).x-4,p.pawns.get(z).y+4,p.pawns.get(z).x-5 ,p.pawns.get(z).y+5); 
                 changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y+3,p.pawns.get(z).x-4 ,p.pawns.get(z).y+4); 
                 jeux.jouer(p);   
                 if(obst[p.pawns.get(z).x-5][p.pawns.get(z).y+5]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-5,p.pawns.get(z).y+5) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
      if((p.pawns.get(z).x+1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey && ( p.pawns.get(z).y-1)*50 < mousex &&
        (p.pawns.get(z).y-1)*50 +50> mousex && obst[p.pawns.get(z).x+1][p.pawns.get(z).y-1] != 2 ) 
        {   
        if(!p.exist(p.pawns.get(z).x+1,p.pawns.get(z).y-1))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y-1)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);                 
           }
            else{if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x+1,p.pawns.get(z).y-1,p.pawns.get(z).x+2 ,p.pawns.get(z).y-2) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y-2]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+2,p.pawns.get(z).y-2) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3)  && !changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3)){
                  p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                  p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                  p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                  p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                  
                  changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y-2,p.pawns.get(z).x+3 ,p.pawns.get(z).y-3); 
                  changeplayer(p).changer(p.pawns.get(z).x+1,p.pawns.get(z).y-1,p.pawns.get(z).x+2 ,p.pawns.get(z).y-2); 
                  jeux.jouer(p);   
                  if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y-3]==2)
                  {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y-3) ;
                  p.score();
                  }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                  p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
               }                 
           } 
  break;
  case 10 :
   if((p.pawns.get(z).x+2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
      (p.pawns.get(z).y-2)*50 +50> mousex && obst[p.pawns.get(z).x+2][p.pawns.get(z).y-2] != 2 ) 
        {   
        if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y-2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);  
            
           }
            else{if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y-3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y-2,p.pawns.get(z).x+3 ,p.pawns.get(z).y-3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y-3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y-3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4)  && !changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y-4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y-3,p.pawns.get(z).x+4 ,p.pawns.get(z).y-4); 
                   changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y-2,p.pawns.get(z).x+3 ,p.pawns.get(z).y-3); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y-4]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y-4) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                } else{
   if((p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex &&
      (p.pawns.get(z).y+2)*50 +50> mousex && obst[p.pawns.get(z).x-2][p.pawns.get(z).y+2] != 2 ) 
        {   
        if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y+2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);  
            
           }
            else{if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y+3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y+2,p.pawns.get(z).x-3 ,p.pawns.get(z).y+3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y+3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y+3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4)  && !changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y+4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y+3,p.pawns.get(z).x-4 ,p.pawns.get(z).y+4); 
                   changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y+2,p.pawns.get(z).x-3 ,p.pawns.get(z).y+3); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y+4]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y+4) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }             
              }
  break ;
  }
   
 break ;
 case 6 :
  switch (d) {
  case 11 :
   if((p.pawns.get(z).x+1)*50 < mousey && (p.pawns.get(z).x+1)*50 +50> mousey && ( p.pawns.get(z).y+1)*50 < mousex &&
      (p.pawns.get(z).y+1)*50 +50> mousex && obst[p.pawns.get(z).x+1][p.pawns.get(z).y+1] != 2 ) 
        {   
        if(!p.exist(p.pawns.get(z).x+1,p.pawns.get(z).y+1))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+1,p.pawns.get(z).y+1)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);  
            
           }
            else{if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x+1,p.pawns.get(z).y+1,p.pawns.get(z).x+2 ,p.pawns.get(z).y+2) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+2][p.pawns.get(z).y+2]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+2,p.pawns.get(z).y+2) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3)  && !changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y+2,p.pawns.get(z).x+3 ,p.pawns.get(z).y+3); 
                   changeplayer(p).changer(p.pawns.get(z).x+1,p.pawns.get(z).y+1,p.pawns.get(z).x+2 ,p.pawns.get(z).y+2); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y+3]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y+3) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                }else{
                
   if((p.pawns.get(z).x-3)*50 < mousey && (p.pawns.get(z).x-3)*50 +50> mousey && ( p.pawns.get(z).y-3)*50 < mousex &&
      (p.pawns.get(z).y-3)*50 +50> mousex && obst[p.pawns.get(z).x-3][p.pawns.get(z).y-3] != 2 ) 
       {   
        if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);              
           }
            else{if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y-3,p.pawns.get(z).x-4 ,p.pawns.get(z).y-4) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y-4]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y-4) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-5,p.pawns.get(z).y-5)  && !changeplayer(p).exist(p.pawns.get(z).x-5,p.pawns.get(z).y-5)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x-4,p.pawns.get(z).y-4,p.pawns.get(z).x-5 ,p.pawns.get(z).y-5); 
                   changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y-3,p.pawns.get(z).x-4 ,p.pawns.get(z).y-4); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x-5][p.pawns.get(z).y-5]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-5,p.pawns.get(z).y-5) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }              
              
           }   
  break ;
  case 12 :
  if((p.pawns.get(z).x+2)*50 < mousey && (p.pawns.get(z).x+2)*50 +50> mousey && ( p.pawns.get(z).y+2)*50 < mousex &&
      (p.pawns.get(z).y+2)*50 +50> mousex && obst[p.pawns.get(z).x+2][p.pawns.get(z).y+2] != 2 ) 
       {   
        if(!p.exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x+2,p.pawns.get(z).y+2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x+1 ;
             p.pawns.get(z).y = p.pawns.get(z).y+1 ;
             jeux.jouer(p);              
           }
            else{if(!p.exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x+3,p.pawns.get(z).y+3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y+2,p.pawns.get(z).x+3 ,p.pawns.get(z).y+3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x+3][p.pawns.get(z).y+3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+3,p.pawns.get(z).y+3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4)  && !changeplayer(p).exist(p.pawns.get(z).x+4,p.pawns.get(z).y+4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x+1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y+1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x+1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y+1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x+3,p.pawns.get(z).y+3,p.pawns.get(z).x+4 ,p.pawns.get(z).y+4); 
                   changeplayer(p).changer(p.pawns.get(z).x+2,p.pawns.get(z).y+2,p.pawns.get(z).x+3 ,p.pawns.get(z).y+3); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x+4][p.pawns.get(z).y+4]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x+4,p.pawns.get(z).y+4) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x+1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y+1 ;
                          }
                        }   
                      }
                    }
                  }
                } else{
  if((p.pawns.get(z).x-2)*50 < mousey && (p.pawns.get(z).x-2)*50 +50> mousey && ( p.pawns.get(z).y-2)*50 < mousex &&
      (p.pawns.get(z).y-2)*50 +50> mousex && obst[p.pawns.get(z).x-2][p.pawns.get(z).y-2] != 2 ) 
       {   
        if(!p.exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2))
        { 
         if(!changeplayer(p).exist(p.pawns.get(z).x-2,p.pawns.get(z).y-2)){    
             p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
             p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
             p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
             p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;               
             p.pawns.get(z).x = p.pawns.get(z).x-1 ;
             p.pawns.get(z).y = p.pawns.get(z).y-1 ;
             jeux.jouer(p);              
           }
            else{if(!p.exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3))
                {if(!changeplayer(p).exist(p.pawns.get(z).x-3,p.pawns.get(z).y-3))
                {  
                 p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                 p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                 p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                 p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;   
                 
                 changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y-2,p.pawns.get(z).x-3 ,p.pawns.get(z).y-3) ;        
                 jeux.jouer(p);
                 if(obst[p.pawns.get(z).x-3][p.pawns.get(z).y-3]==2)
                 {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-3,p.pawns.get(z).y-3) ;
                 p.score();
                 }
                  p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                 p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                 }
                 else{
                 if(!p.exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4)  && !changeplayer(p).exist(p.pawns.get(z).x-4,p.pawns.get(z).y-4)){
                   p.pawnse.get(2).x =p.pawnse.get(2).x-1 ;
                   p.pawnse.get(2).y =p.pawnse.get(2).y-1 ;
                   p.pawnse.get(1).x =p.pawnse.get(1).x-1 ;
                   p.pawnse.get(1).y =p.pawnse.get(1).y-1 ;                  
                   changeplayer(p).changer(p.pawns.get(z).x-3,p.pawns.get(z).y-3,p.pawns.get(z).x-4 ,p.pawns.get(z).y-4); 
                   changeplayer(p).changer(p.pawns.get(z).x-2,p.pawns.get(z).y-2,p.pawns.get(z).x-3 ,p.pawns.get(z).y-3); 
                   jeux.jouer(p);   
                   if(obst[p.pawns.get(z).x-4][p.pawns.get(z).y-4]==2)
                   {jeux.changeplayer(p).suprimer(p.pawns.get(z).x-4,p.pawns.get(z).y-4) ;
                   p.score();
                   }
                   p.pawns.get(z).x = p.pawns.get(z).x-1 ;
                   p.pawns.get(z).y = p.pawns.get(z).y-1 ;
                          }
                        }   
                      }
                    }
                  }
                }                   
              }    
   
  break ;
  }
 break ;
  
 }
}


public void desine(int temps)
{ updatePixels();
      int vd ;
      for(int i =0 ; i< 25 ; i++)
      { for(int j =0;j<14 ; j++)
        {  
           vd = obst[j][i];    
          if(vd ==1){
           fill(color(155, 155, 155));
          ellipse(i*50 +25, j*50 +25, 70, 70);}}
        }
      
      
      
      
      
      for(pawn p : this.player1.pawns){
      if(p.b){fill(color(0, 255, 0));}
      else{fill(color(10, 70, 70));
      }
      ellipse(p.y*50 +25, p.x*50 +25, 55, 55);
      } 
      for(pawn p : this.player2.pawns){
      if(p.b){fill(color(0, 255, 0));}
      else{fill(color(120, 70, 80));
      }  
      ellipse(p.y*50 +25 , p.x*50 +25, 50, 50);
      }    
       if(jeux.play==1)
       {  
       fill(0, 255, 0);
       textSize(32);
       text("player 1 turn !!", 500, 30); 
       
       }else{
              fill(0, 255, 0);
       textSize(32);
       text("  CPU  turn !!", 500, 30); 
       
       
       }
      
      
       fill(30, 70, 90);
       textSize(32);
       text("Player 1 !!", 10, 30); 
       
       text("Score : "+ this.player1.score, 10, 70); 
       fill(120, 70, 80);
       text("CPU !!", 1080, 30); 
       text("Score : "+ this.player2.score,  1080, 70); 
        if(this.player1.score==6)
        { updatePixels(); 
        fill(255, 0, 100);
        textSize(75);
        text("Game Over !!", 390, 250);  
        text("player  One Win!", 340, 350); 
        }else{
           if(this.player2.score==6)
        { updatePixels(); 
        fill(255, 0, 100);
        textSize(75);
        text("Game Over !!", 390, 250);  
        text("player : CPU Win !", 340, 350); 
        } 
     }
      
 delay(temps);
}

}
