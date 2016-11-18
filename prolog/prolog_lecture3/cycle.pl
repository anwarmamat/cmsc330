edge(start,a).
edge(a,start).
edge(a,b).
edge(a,c).
edge(a,end).
edge(b,end).

% This predicate could lead to infinite recursion
path(X,X).
path(X,Y) :-
	edge(X,Z),
	path(Z,Y).




% This predicate avoids nontermination by tracking seen nodes
ncpath(X,_Seen,X).
ncpath(X,Seen,Z) :-
	edge(X,Y),
	\+ member(Y,Seen),
	write(Y),write(->),
	ncpath(Y,[X|Seen],Z).

% This predicate builds up the (non-cyclic) path to 
%the destination
%pathto(start,[],C,end).

pathto(X,_Seen,[X],X).
pathto(X,Seen,[X|Path],Z) :-
	edge(X,Y),
	\+ member(Y,Seen),
	pathto(Y,[X|Seen],Path,Z).



% This predicate gathers all (non-cyclic) paths from X to Y
allpaths(X,Y,Paths) :-
	findall(C,pathto(X,[],C,Y),Paths).
	
	