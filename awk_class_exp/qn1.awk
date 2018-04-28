#!/usr/bin/gawk
BEGIN{   
         cnt=0
         scnt=0
          s=0
          x=0
          y=0
          z=0
      
}
{
         if($0 ~ /\/\*/ && $0 ~ /"/)
           {
             for(i=1;$i;i++)
             {
                 if($i ~ /\/\*/)
                   break;
                 if($i ~ /"/)
                   {n=i;
                   s1++;}
             }
              if(s1%2!=0)
               cnt--;
              
            for(i=1;$i;i++)
           {
              if($i ~ /\/\*/)
                 s2++;
              if($i ~ /\*\//)
                 s3++;
              if($i ~ /"/)
                  break;
             
           }  
               if(s1!=s2)
                 scnt--; 
           }
        if(x == 0){
          flag=0;
          for(i=1;$i;i++){
            if($i ~ /\/\//)
              { flag=1;
                break;}
    
                
            if($i ~ /"/)
              {
                s++;}
        
      }
         if((s % 2)==0 && flag==1)
          cnt++; 
           scnt+=int((s+1)/2);
     
    
       s=0;
}

        

        if($0 ~ /\/\*/){
            x++;
            y=NR;  }
        if($0 ~ /\*\//)
         { x--;
           z=NR;
           cnt+=((z-y)+1);}
  

  
}
END {
      print cnt "," scnt;
}
