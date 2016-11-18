age(alice,20).
age(bob,18).
age(cat,19).
age(david,20).
%findall(X,age(X,Y),R).

findall(X,age(X,Y),R).
R = [alice, bob, cat, david].


findall(Y,age(X,Y),R).
R = [20, 18, 19, 20].

bagof(Y,Y^age(X,Y),R).
X = alice,
R = [20] .

?- bagof(Y,X^age(X,Y),R).
R = [20, 18, 19, 20].


%setof(Y,X^age(X,Y),R).
%R = [18, 19, 20].