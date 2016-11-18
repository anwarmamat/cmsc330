merge([X|Xs], [Y|Ys], [X|Zs]) :-
    X < Y,!,merge(Xs, [Y|Ys], Zs).

merge([X|Xs], [Y|Ys], [X,Y|Zs]) :-
    X =:= Y, !, merge(Xs,Ys,Zs),!.

merge([X|Xs], [Y|Ys], [Y|Zs]) :-
    X > Y, !, merge([X|Xs],Ys,Zs),!.

merge(Xs, [], Xs):-!.

merge([], Ys, Ys):-!.
