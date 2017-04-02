hd([H|_],H).

last([L],L).
last([_|T],L):-last(T,L).

my_length([],0).
my_length([_|T],N):- my_length(T,N2), N is N2+1.

at(1,[H|_],H).
at(N,[_|T],H):- N2 is N-1, at(N2,T,H).


split(L,0,[],L).
split([H|T],N,[H|T2],L2):- N2 is N-1, split(T,N2,T2,L2). 


my_concat([],L2,L2).
my_concat([H|T],L2,[H|T2]):-my_concat(T,L2,T2).

my_takeout(E, [E|T], T).
my_takeout(E, [H|T], [H|T2]) :-
	my_takeout(E, T, T2).
	
my_permutation([], []).
my_permutation(L, [H|T]) :-
	my_takeout(H, L, R),
	my_permutation(R, T).
	
is_sorted([]).
is_sorted([_]).
is_sorted([X1,X2|T]):- X1 =< X2, is_sorted([X2|T]).

my_sort(X,Y):-my_permutation(X,Y),is_sorted(Y).


my_reverse([],[]).
/*my_reverse([X],[X]).*/
my_reverse([H|T], X):- my_reverse(T,L), append(L,[H],X).

my_append([],Y,[Y]).
my_append([H|T],X,[H|Z]):- my_append(T,X,Z).
