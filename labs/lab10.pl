% Exercise 1: Simple Terms
% Prolog programs are made up of "terms." Let use explore the most important types of "simple" terms.
% Atoms - 
% An atom is a general purpose construct used to define some constant terms to use in your database
% Variables -
% A variable is simple term which can be substituted with any other simple term
% 
% Identify which of the follow terms are atoms, variables, or syntax errors
% 
%  1) adam
%  2) Will
%  3) damien42
%  4) _Austin
%  5) 'Anwar'
%  6) 'A E S T H E T I C'
%  7) Daniel1971
%  8) @=!;

% Exercise 2: Predicates
% Predicates are made up of simple terms. One of the simplest type of predicate is the 'fact'

dog(rufus).
dog(hambone).
cat(oregano).
cat(popsicle).

% By combining two atoms with paranthesis, I've created 2 classes of facts, dogs and cats, and declared
% some atoms which are the names of various dogs and cats.
% Here is another type of predicate, which defines how dogs and cats feel about each other.

hates(X, Y):- dog(X), cat(Y).
hates(X, Y):- dog(Y), cat(X).

% Given this very simple database, finish this rule which tells us who would win in a fight

wins_fight(X, Y):- hates(X, Y) /*Your choice goes here*/.

% Exercise 3: Recursion and Lists
% Much like OCaml, list processing forms the bulk of the work of Prolog functions
% Prolog uses recursion to process lists, and splits by head and tail just like OCaml
% Below is an example of a function which takes a list and doubles every element of the list

doubler([], []).                                                  % Base case
doubler(L, X) :- L = [H|T], doubler(T, Y), Z is H * 2, X = [Z|Y]. % Recursive step

% Write a function even_ele which returns only the even numbers of a list. I've provided some skeleton
% code for the recursive steps blow.

% Uncomment when ready to work on the function
%even_ele(L, X) :- /* Write pre-processing code here */ mod(H, 2) is 1, X = Y. % Odd case
%even_ele(L, X) :- /* Write pre-processing code here */ mod(H, 2) is 0  /* Post-processing here */.
