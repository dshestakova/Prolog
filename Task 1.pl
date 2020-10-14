/*Adding odd digits of N*/

sum_odd(0,S):-  S is 0,!.       
sum_odd(-1,S):- S is 0, !.
sum_odd(N,S):- N mod 2 =:= 0,   %Проверка на четность, если число четное, то берем предыдущее от него (нечетное) и рекурсивно суммируем цифры
    N1 is N-1, 
    sum_odd(N1,S).
sum_odd(N,S):- N mod 2 =:= 1,   %Проверяем на нечетность, если нечетное, то рекурсивно считаем сумму цифр
    N1 is N-2,
    sum_odd(N1,S1),
    S is S1+N.