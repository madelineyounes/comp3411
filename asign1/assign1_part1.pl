% assignment 1 - Prolog and Search 
% Part 1 - Prolog
% Written By Madeline Younes (z5208494)
% 10/03/2021

:- set_prolog_flag(answer_write_options,[max_depth(0)]).

% Question 1.1: List Processing 
% Predicate that sums the squares of only the 
% even numbers in a list of integers.

% Determines if a number is even 
is_even(Number):- 
    mod(Number,2) =:= 0. 

% base case
sumsq_even([], 0).
% main case 
sumsq_even([Head|Tail], Sum):- 
    is_even(Head) ->            % if this condition is fulfilled
    sumsq_even(Tail, NewSum),
    Sum is NewSum + Head*Head;  % calculate sum 
    sumsq_even(Tail, Sum).      % else move on to next element 


% Question 1.2: List Processing
% Take in a sentence in the form of a list, complete simple 
% transformations on the words. With you -> i, me -> you, my -> your
% add prefix of [what, makes, you, say].

swap_you(Word, Out) :- 
    Word == you -> Out = i; Out = Word.  

swap_me(Word, Out) :- 
    Word == me -> Out = you; Out = Word.  

swap_my(Word, Out) :- 
    Word == my -> Out = your; Out = Word.   


swap_words([], []).
swap_words([Head|Tail], Output) :- 
    swap_you(Head, YouSwap),
    swap_me(YouSwap, MeSwap),
    swap_my(MeSwap, Word),
    append([Word], NewOutput, Output), 
    swap_words(Tail, NewOutput).
    
eliza1([], []).
eliza1([Head|Tail], Output) :- 
    swap_words([Head|Tail], NoPrefix),
    append([what,makes,you,say], NoPrefix, Output).

% Question 1.3: List Processing
% Take in a sentence in the form of a list and creates a new list, 
% which skips the words before you, after me 
% prefix being 'i' and sufix being 'you'

eliza2([], []).
eliza2(Input, Output):- 
    append(_, [you|NoPrefix], Input),
    append(NoSuffix, [me|_], NoPrefix),
    append([what,makes,you,think,i], NoSuffix, NewPrefix),
    append(NewPrefix, [you], Output).

% Question 1.4: Prolog Terms
% Write a program that will evaluate addition, subtraction, multiplication 
% and division from operation stubs.

eval(add(X,Y), Ans) :- 
    eval(X, Ans1), 
    eval(Y, Ans2), 
    Ans is Ans1+Ans2.

eval(sub(X,Y), Ans) :- 
    eval(X, Ans1), 
    eval(Y, Ans2), 
    Ans is Ans1-Ans2.

eval(mul(X,Y), Ans) :- 
    eval(X, Ans1), 
    eval(Y, Ans2), 
    Ans is Ans1*Ans2.


eval(div(X,Y), Ans) :- 
    eval(X, Ans1), 
    eval(Y, Ans2), 
    Ans2 \= 0,
    Ans is Ans1/Ans2.

eval(X, X):-
    number(X).