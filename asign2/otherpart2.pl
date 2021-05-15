% given predicate

:- op(300, xfx, <-).

/* ------------ question 2.1 ---------------- */
intra_construction(X1 <- L1, X2 <- L2, X1 <- First, Var <- New1 , Var <- New2) :-
    X1 = X2,
    intersection(L1, L2, L),
    gensym(z, Var),
    subtract(L1, L, New1),
    subtract(L2, L, New2),
    append(L, [Var], First).


/* ------------ question 2.2 ---------------- */
absorption(X <- L1, Y <- L2, X <- NewList, Y <- L2) :-
    X \= Y,
    subset(L2, L1),
    subtract(L1, L2, New),
    append([Y], New, NewList).


/* ------------ question 2.3 ---------------- */
identification(X1 <- L1, X2 <- L2, X1 <- L2, Var <- New1) :-
    X1 = X2,
    intersection(L1, L2, L),
    subtract(L1, L, New1),
    subtract(L2, L, New2),
    [Var] = New2.


/* ------------ question 2.4 ---------------- */
dichotomisation(X1 <- L1, not(X2) <- L2, X1 <- New1, not(X1) <- New2, Var <- New3, not(Var) <- New4) :-
    X1 = X2,
    gensym(z, Var),
    intersection(L1, L2, L),
    append(L, [Var], New1),
    append(L, [not(Var)], New2),
    subtract(L1, L, New3),
    subtract(L2, L, New4).

/* ------------ question 2.5 ---------------- */
truncation(X1 <- L1, X2 <- L2, X1 <- L) :-
    X1 = X2,
    intersection(L1, L2, L).
