/*least common multiple*/

gcd(0,N). %Если одно из чисел 0, то наименьшего общего кратного не существует
gcd(N,0).
gcd(M,N,M):- M mod N = 0, !.
gcd(M,N,GCD):- X is N mod M , gcd(X,M,GCD), !.  %Считаем НОД по остаткам от деления N на M, если N больше
gcd(M,N,GCD):- X is M mod N , gcd(X,N,GCD).     %Считаем НОД по остаткам от деления M на N, если M больше
lcm(X,Y,GCD):- gcd(X,Y,A), GCD is (X*Y)/A.      %По формуле НОК(А,В)=(А*В)/НОД 

?-lcm(2,6,Z) => 6
?-lcm(3,2,5) => false
