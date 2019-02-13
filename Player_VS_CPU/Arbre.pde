public class Arbre{  
int val=0 ;
int movement ;
int id ;
int val1=0;
pawn pwse ;
int valeur ;
int nb ;
int  centrexanc , centreyanc ;
public ArrayList<Arbre> Ar;

    public Arbre(int movement,int Score1,int Score2 ,pawn paw ,int nb, int s1 ,int s2 ,int x , int y,int r )     
   {   Ar =new ArrayList<Arbre>() ;
                val = (Score2 - s2)-(Score1-s1);
                val1 =(Score2-s2);
                heuristique(nb,paw.x, paw.y, x ,y) ;                  
                pwse = paw ;
                this.movement = movement ;
                this.nb =nb;
              }
   public Arbre(){}   
  public void heuristique(int nb,int xanc,int yanc, int xn ,int yn ) 
  {  valeur =0 ;
    int centrexanc ;
    int centreyanc ;
    int centrexn ;
    int centreyn ;
  
    centrexanc =abs(6-xanc);
    centrexn =abs(6-xn);
    centreyanc =abs(12-yanc);
    centreyn =abs(12-yn);
    if(centrexanc> centrexn && centreyanc> centreyn ) {valeur= valeur+5;  valeur =valeur + centrexanc*5 + centreyanc*5 ;}

    else{
    if(centrexanc> centrexn){valeur= valeur+3 ; valeur =valeur + centrexanc*5 ;}
    if(centreyanc> centreyn){valeur= valeur+3 ; valeur =valeur + centreyanc*5 ;}
      }
    
     valeur = valeur +nb;

   
  }


     
   
   
   
}
