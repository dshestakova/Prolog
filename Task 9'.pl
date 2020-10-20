/removing duplicates*/

member(H,[H|_]). 		%Случай для первого элемента
member(H,[_|T]):-		%Проверяем, лежит ли элемент в хвосте
	member(H,T).

repeated([],[]).		%Случай для пустого списка
repeated([H|T],A):-		
    member(H,T),		%Проверяем, лежит ли элемент в хвосте; если да, то пропускаем его
    repeated(T,A).
repeated([H|T],[H|A]):-	%Если элемент не лежит в хвосте, то копируем его
    not(member(H,T)),
    repeated(T,A).
