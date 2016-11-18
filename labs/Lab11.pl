% Exercise 1 
% Write 2 functions which sum all the elements of list.
% First, write a function which is not tail recursive.
% Second, write a function which is tail recursive.

list_sum_nontail([],0).
% Write the recursive step here.

list_sum_tail([], Acc, Acc).
% Write the recursive step here.

% Exercise 2
% Write a function which splits a list into two halves by index

% Example:
% ?- split_list([a,b,c,d,e], 3, L1, L2).
% L1 = [a,b,c]
% L2 = [d,e]
 
% Exercise 3
% Write a function which generates a list of all integers between
% an upper and lower bound, inclusive.

% Example:
% ?- gen_slice(4,9,X).
% X = [4,5,6,7,8,9]

% Exercise 4
% Prolog's append function is surprisingly versatile.
% Write an append query which prepends elements to a list.
% 
% Write an append query which generates all prefixes and suffixes of a list.
% 
