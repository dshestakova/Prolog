/*Сдвиг массива*/

/* таблица переворотов
1 2 3 | 4 5 6 7 8 9
9 8 7 | 6 5 4 3 2 1 
7 8 9 | 1 2 3 4 5 6*/



llength([],0). 		%Случай для нулевого списка
llength([_|T],L):- 	%Считаем длину списка
    llength(T,L_),
    L is L_ +1. 	%works

reverse(Xs,Ys) :-           	%Реверс массива; используем аккумулятор как пустой список
  reverse_worker(Xs,[],Ys) . 

reverse_worker([],R,R).   		%Случай с пустым списком
reverse_worker([X|Xs],T,R) :- 	%Перебираем список, находим нужный элемент, добавляем к обратному списку, т.о создаем обратный по мере движения по исходному 
  reverse_worker(Xs,[X|T],R). 	%works

separate_before([], _,_ ,[]).			%Случай с пустым списком
separate_before([_|T], J, I, A):-		%Если индекс J меньше или равен I, то идем дальше по списку
    J > I, !,
    J1 is J + 1,
    separate_before(T, J1, I, A).
separate_before([X|T], J, I, [X|T2]):-	%Если J больше,то сохраняем элемент в новый список и идем дальше
    J =< I, !,
    J1 is J + 1,
    separate_before(T, J1, I, T2).


separate_after([], _,_ ,[]).  			%Случай с пустым списком
separate_after([_|T], J, I, A):- 		%Если индекс J меньше или равен I, то идем дальше по списку
    J =< I, !,
    J1 is J + 1,
    separate_after(T, J1, I, A).
separate_after([X|T], J ,I, [X|T2]):- 	%Если J больше,то сохраняем элемент в новый список и идем дальше
    J > I, !,
    J1 is J + 1,
    separate_after(T, J1, I, T2).

right([],_,[]).							%Случай с пустым списком
right([H|T], I, Answer):-				
    reverse([H|T],Ar),					%Переворачиваем весь список
    separate_before(Ar,1,I,Before),		
     separate_after(Ar,1,I,After),
    reverse(Before,Before_),			%Переворачиваем правую часть списка
    reverse(After,After_),				%Переворачиваем левую часть списка
    append(Before_,After_,Answer).		%Склеиваем

/*left([],_,[]).
left([H|T], I, Answer):-
    reverse([H|T],Ar),
    separate_before(Ar,1,I,Before),
     separate_after(Ar,1,I,After),
    reverse(Before,Before_),
    reverse(After,After_),
    conc(Before_,After_,Answer).*/

conc([ ], L, L). 			%Склеиваем списки в один
conc([H|T], L, [H|T1]):-
	conc(T,L,T1).

start([],_,[]).				%Запуск для пустого списка
start(Q,0,Q).				%Запуск, если сдвиг на 0
start(Q,N,A):-				
    N>0,					%Для положительного сдвига (вправо) выполняем развороты
    llength(Q,L),
    I is N mod L,
    I =\= 0, !,
    right(Q,I,A). 
start(Q,N,A):-
    N<0,					%Для отрицательного сдвига (влево): приводим его к положительному и выполняем развороты
    llength(Q,L),
    I_ is abs(L+N) mod L,
    I_ =\= 0, !,
    right(Q,I_,A).
    
/*start(Q,N,A):-
    N<0,
    llength(Q,L),
    I is abs(N) mod L,
    I =\= 0, !,
    right(Q,I,A).
*/


