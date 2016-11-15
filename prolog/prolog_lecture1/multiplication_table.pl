row():-row(1).
row(10):-nl.
row(X):-col(X),X2 is X+1, row(X2).

col(Y):-col(1,Y).
col(10,_):-nl.
col(X,Y):- T is X*Y,write(T), write('  '),X2 is X+1, col(X2,Y).