function y=dohodek(t)
x = 0
k = 0
s = 0 
z = 100;
s = 100;
while x < 1
    k = k + 1;
    z = round((z * (1 + t))*100)/100;
    s = floor((s * (1 + t))*100)/100;
    x = z - s
end;
y = [k,x]
   