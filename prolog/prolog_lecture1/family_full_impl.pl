
parent(alex,julia).
parent(alex,rosa).
parent(lina,julia).
parent(lina,rosa).
parent(romeo,peter).
parent(julia,peter).
parent(rosa,silvia).
parent(oscar,ida).
parent(eva,ida).
parent(eva,bruno).
parent(peter,bruno).
parent(peter,georg).
parent(peter,irma).
parent(ruth,georg).
parent(ruth,irma).
parent(silvia,otto).
parent(silvia,pascal).
parent(irma,olga).
parent(irma,jean).
parent(otto,olga).
parent(otto,jean).
parent(jean,tina).
parent(marie,tina).

male(alex).
male(romeo).
male(oscar).
male(peter).
male(bruno).
male(georg).
male(otto).
male(pascal).
male(jean).

husband(alex,lina).
husband(romeo,julia).
husband(oscar,eva).
husband(peter,ruth).
husband(otto,irma).
husband(jean,marie).

% father(X,Y) :- X is the father of Y.

father(X,Y) :- parent(X,Y), male(X).

% grandfather(X,Y) :- X is the grandfather of Y.

grandfather(X,Y) :- father(X,P), parent(P,Y).

% brother(X,Y) :- X is the brother of Y.

brother(X,Y) :- parent(P,X), parent(P,Y), male(X), X \= Y.

% uncle(X,Y) :- X is the uncle of Y.

uncle(X,Y) :- brother(X,P), parent(P,Y).

% female(X) :- X is a female person.

female(X) :- \+ male(X).

% sister(X,Y) :- X is the sister of Y.

sister(X,Y) :- parent(P,X), parent(P,Y), female(X), X \= Y.

% has_son(X) :- the person X has a son.

has_son(X) :- parent(X,Y), male(Y).

% married(X,Y) :- X and Y are married to each other.

married(X,Y) :- husband(X,Y).
married(X,Y) :- husband(Y,X).

% brother_in_law(X,Y) :- X is the brother-in-law of Y.

brother_in_law(X,Y) :- brother(X,P), married(P,Y).
brother_in_law(X,Y) :- husband(X,W), sister(W,Y).

% ancestor(X,Y) :- X is an ancestor of Y.

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,P), ancestor(P,Y).

% relatives(X,Y) :- X and Y are relatives (related by blood to each other). 

relatives(X,X).
relatives(X,Y) :- ancestor(X,Y).
relatives(X,Y) :- ancestor(Y,X).
relatives(X,Y) :- ancestor(A,X), ancestor(A,Y).

% ancestors(As,X) :- As is the set of all (known) ancestors of X.

ancestors(As,X) :- setof(A,ancestor(A,X),As).

% descendants(Ds,X) :- Ds is the set of all (known) descendants of X.

descendants(Ds,X) :-setof(D,ancestor(X,D),Ds).

% This is not discussed in the course:

% ancestor(X,Y,L) :- X is an ancestor of Y, and L is the list of names
% leading from X to Y.

ancestor(X,Y,[X,Y]) :- write("111"),parent(X,Y).
ancestor(X,Y,[X|L]) :- write(X), write(","),parent(X,P), ancestor(P,Y,L).
