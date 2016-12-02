% Exercise 1 
% Write 2 functions which sum all the elements of list.
% First, write a function which is not tail recursive.
% Second, write a function which is tail recursive.

list_sum_nontail([],0).
% Write the recursive step here.
list_sum_nontail([H|T], N) :- list_sum_nontail(T,X), N is X + H.  


list_sum_tail([], Acc, Acc).
% Write the recursive step here.
list_sum_tail([H|T], Acc, X) :- NewAcc is H + Acc, list_sum_tail(T, NewAcc, X).

% Exercise 2
% Write a function which splits a list into two halves by index

% Example:
% ?- split_list([a,b,c,d,e], 3, L1, L2).
% L1 = [a,b,c]
% L2 = [d,e]
split(L,0,[],L).
split([H1|T1],N,[H1|T2],L3) :- N > 0, N1 is N - 1, split(T1,N1,T2,L3).
 
% Exercise 3
% Write a function which generates a list of all integers between
% an upper and lower bound, inclusive.

% Example:
% ?- gen_slice(4,9,X).
% X = [4,5,6,7,8,9]
gen_slice(X, X, [X]) :- !.
gen_slice(X, Y, L2) :- X < Y, X1 is X + 1, gen_slice(X1, Y, L), append([X], L, L2).

% Exercise 4
% Prolog's append function is surprisingly versatile.
% Write an append query which prepends elements to a list.
% Any query can do:
% ?- append([a,b,c], [1,2,3], X).
% X = [a,b,c,1,2,3]

% Write an append query which generates all prefixes and suffixes of a list.
% ?- append(Prefix, Suffix, [1,2,3]).
% Prefix = [],
% Suffix = [1, 2, 3]
% Prefix = [1],
% Suffix = [2, 3]
% Prefix = [1, 2],
% Suffix = [3]
% Prefix = [1, 2, 3],
% Suffix = []
