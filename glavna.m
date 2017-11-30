naloga(30000)
t1 = 0.014;
dohodek(t1)
t2 = 0.0011592468;
dohodek(t2)
f = inline('x + log(x)');
regulaFalsi(f,0.1,100)
g = inline('0.4*(x^3 - x^2 - x + 0.21)')
naloga4(g,1,5)
roots([0.4,-0.4,-1.4,0.084])