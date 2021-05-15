% assignment 2 - Inductive Logic Programming
% Part 2 - Prolog
% Written By Madeline Younes (z5208494)
% 14/04/2021

:-op(300, xfx, <-).

% Question 2.1 
intra_construction(C1 <- B1, C2 <- B2, C1 <- Z1B, C <- Z2B, C <- B) :- 
    C1 = C2, 
    gensym(z, C),
    intersection(B1, B2, B3),
    subtract(B1, B3, Z2B), 
    subtract(B2, B3, B),
    append(B3, [C], Z1B).

% Question 2.2 
absorption(A1 <- B1, A2 <- B2, C1, C2) :-
    A1 \= A2,
    subset(B2, B1),
    intersection(B1, B2, B3),
    subtract(B1, B3, D1),
    append([A2], D1, O1),
    C1 = A1 <- O1,
    C2 = A2 <- B2.
    
% Question 2.3 
identification(A1 <- B1, A2<- B2, C1, C2) :-
    A1 = A2,
    intersection(B1, B2, B3),
    subtract(B1, B3, D1),
    subtract(B2, B3, [D2]),
    C1 = A1 <- B2,
    C2 = D2 <- D1.

% Question 2.4
dichotomisation(A1 <- B1, not(A2) <- B2, C1, C2, C3, C4) :- 
    A1 = A2, 
    gensym(z, C),
    intersection(B1, B2, I1),
    append(I1, [C], O1),
    append(I1, [not(C)], O2),
    subtract(B1, I1, D1),
    subtract(B2, I1, D2),
    C1 = A1 <- O1, 
    C2 = not(A2) <- O2,
    C3 = C <- D1,
    C4 = not(C) <- D2.

% Question 2.5 
truncation(A1 <- B1, A2 <- B2, C1) :-
    A1 = A2,
    intersection(B1, B2, T1),
    C1 = A1<-T1.
