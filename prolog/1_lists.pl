% 1. Prolog Lists

% 1.01 (*) Find the last element of a list.
% Example:
%   ?- my_last(X, [a, b, c, d]).
%   X = d
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).

% 1.02 (*) Find the last but one element of a list.
% Example:
%   ?- my_last_but_one(X, [a, b, c, d]).
%   X = c
my_last_but_one(X, [X,_]).
my_last_but_one(X, [_|T]) :- my_last_but_one(X, T).

% 1.03 (*) Find the K'th element of a list.
% The first element in the list is number 1.
% Example:
%   ?- element_at(X, [a, b, c, d, e], 3).
%   X = c
my_element_at(X, [X|_], 1).
my_element_at(X, [_|T], N) :- N > 1, N1 is N-1, my_element_at(X, T, N1).

% 1.04 (*) Find the number of elements of a list.
% % Example:
%   ?- my_length([a, b, c], X).
%   X = 3
my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1+1.

% 1.05 (*): Reverse a list.
% Example:
%  ?- my_reverse([a, b, c], X).
%  X = [c, b, a]
my_reverse(L1, L2) :- my_reverse(L1, [], L2).
my_reverse([], L2, L2) :- !.
my_reverse([X|T], A, L2) :- my_reverse(T, [X|A], L2).

% 1.06 (*) Find out whether a list is a palindrome.
% Example: 
%  is_palindrome([r, a, c, e, c, a, r]).
is_palindrome(L) :- reverse(L, L).
