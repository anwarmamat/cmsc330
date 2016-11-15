sum(0,0).
sum(A,B):-
	A1 is A-1,
	sum(A1,B1),
	B is A + B1.

loop(0).
loop(N):-write(N),nl,N1 is N-1, loop(N1).


