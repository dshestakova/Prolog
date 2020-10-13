/*Sublist of the list starting with R*/

/*N is supposed to be equal to 0*/
sub([],_,_,[]).          %Случай с пустым списком
sub([H|T],N,R,L):-       %Проходим по списку, пока не найдем нужный индекс
    N<R,
    N1 is N+1,
    sub(T, N1, R, L).
sub([H|T],N,R,[H|L]):-  %Копируем в новый лист
    N>=R,
    N1 is (N+1),
    sub(T,R,N,L).
