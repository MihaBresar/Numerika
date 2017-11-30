 function y=prastevila(x)   
 p = primes(x);
 z = 0;
 a = x;
 b = 0
 for v = p
     if ismember(x - v,p) == 1
         if  (abs(x - v - v) < a) 
            a = abs(x - 2*v);
            b = v;
         end;
         z = z + 1;
     end;
     
 end;
 
 if ismember(x/2,p) == 1
     z = (z + 1)/2
     y = [z,b]
 end;
  y = [z/2,b]
 
  
  