public class player {
int nb= 0 ;
public ArrayList<pawn> pawns = new ArrayList<pawn>();
public  int score =0;
public ArrayList <pawn> pawnse = new ArrayList<pawn>(); 
public void inc()
{nb =nb +1;
}

public boolean serch(int x , int y)
{
  for(pawn p : pawns)
  { if(p.x == x && p.y == y) {p.selectionner(); pawnse.add(p) ; return true ;}
  }
  
return false;
   }
 public boolean exist(int x , int y)
{
  for(pawn p : pawns)
  { if(p.x == x && p.y == y) {return true ;}
 }
  
return false;
   }

   
   
   
  public void nonselectionner()   
  {  for(pawn p : pawns)
     {p.nonselectionner() ;     
     pawnse = new ArrayList<pawn>() ;
}

  
  
  } 
   
public boolean changer(int x,int y,int x0 ,int y0)
 {  
    for(pawn p : pawns)
   {if(p.x == x && p.y == y) { p.x = x0 ; p.y =y0 ;
    return true ;}
     }
    return false;
 }
 
public void score()
{score ++;}
 
public boolean suprimer(int x , int y)
{ for(pawn p : pawns)
  { if(p.x == x && p.y == y) {pawns.remove(p) ;
   return true ;}
}
  
return false;
}


 
}
