% Determine the greatest common divisor of two positive integers.

% gcd(X,Y,G) :- G is the greatest common divisor of X and Y
%    (integer, integer, integer) (+,+,?)


gcd(X,0,X) :- X > 0.
gcd(X,Y,G) :- write(X), write(Y), Y > 0, Z is X mod Y, gcd(Y,Z,G).

