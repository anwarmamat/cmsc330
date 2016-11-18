
/*

S->a S b|a|b|e

s([]).
s([a|L]):- append(L1, [b],L), s(L1),!.
*/


/* palindrome
%pal -> a pal a | b pal b |a | b|e
*/

pal([]):-!.
pal([a]):-!.
pal([b]):-!.
pal([a|L]):- append(L1,[a],L), pal(L1),!.
pal([b|L]):- append(L1,[b],L), pal(L1),!.



