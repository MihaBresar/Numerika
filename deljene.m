function d = deljene (X, Y, Z)
  d = Y;
  n = length(X) - 1;
  for j=1:n
    for i=n:-1:j
        if (X(i+1)-X(i-j+1)) > 0
            d(i+1)=(d(i+1)-d(i))/(X(i+1)-X(i-j+1));
        else 
            d(i+1) = Z(i);
      end;
   
    end
  end