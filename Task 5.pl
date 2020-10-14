/*Doubling list items*/

double([],[]).  %Случай с пустым списком
double([A|Tail],[B|Tail_]):- B is 2*A, double(Tail,Tail_).  %Берем элемент из головы, удваиваем и записываем во второй список
