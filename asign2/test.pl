/* Test file for COMP3411 assignment 2 */

:- consult(part2).
:- begin_tests(part2).

/* ------------ question 2.1 ---------------- */
test('intra_construction, given') :- once(intra_construction(x <- [b, c, d, e], x <- [a, b, d, f], x<-[b, d, Var], Var<-[c, e], Var<-[a, f])).
test('intra_construction, test2') :- reset_gensym,once(intra_construction(x <- [b], x <- [d, f], x<-[z1], z1 <-[b], z1 <-[d, f])).
test('intra_construction, test3') :- reset_gensym,once(intra_construction(x <- [b, c, d, e], x <- [], x<-[z1], z1<-[b, c, d, e], z1<-[])).
test('intra_construction, test4') :- reset_gensym,once(intra_construction(x <- [b ,d], x <- [a ,b ,d ,f], x <- [b ,d ,z1], z1 <-[] , z1 <- [a ,f])).

/* ------------ question 2.2 ---------------- */
test('absorption, given') :- once(absorption(x <- [a, b, c, d, e], y <- [a, b, c], x<-[y, d, e], y<-[a, b, c])).
test('absorption, given reversed', fail) :- once(absorption(x <- [a, b, c], y <- [a, b, c, d, e], _ , _)).
test('absorption, test3') :- once(absorption(x <- [a, b, c, d, e], y <- [a, b, c], x<-[y, d, e], y<-[a, b, c])) .
test('absorption, test4') :- once(absorption(x <- [a, b, c, d, e], y <- [], x<-[y, a, b, c, d, e],  y<-[])) .
test('absorption, test5') :- once(absorption(x <- [a,b,c,d,e,f], y <- [a,f], x<-[y,b,c,d,e], y <- [a,f])).
test('absorption, test6') :- once(absorption(x <- [], y <- [], x <- [y], y <- [])).
test('absorption test7') :- once(absorption(x <- [d, a, b, c, e], y <- [a, b, c], x<-[y, d, e], y<-[a, b, c])).
test('absorption, fail 1', fail) :- once(absorption(x <- [a, b, c, d, e], y <- [f,g], _, _)).
test('absorption, fail 2', fail) :- once(absorption(x <- [a, b, c, d, e], y <- [e,d,f,g], _, _)).

/* ------------ question 2.3 ---------------- */
test('identification, given') :- once(identification(x <- [a, b, c, d, e], x <- [a, b, y], x<-[a, b, y], y<-[c, d, e])).
test('identification, given, different order') :- once(identification(x <- [e, a, c, b, d], x <- [y, b, a], x<-[y, b, a], y<-[e, c, d])).
test('identification, given in forum') :- once(identification(c <- [a], c <- [g], c<-[g], g<-[a])).
test('identification, fail 1', fail) :- once(identification(c <- [a, b, c, d, e], c <- [a, b, c, k, g], _, _)).
test('identification, test1') :- once(identification(x <- [a, b, c, d, e], x <- [a, y], x<-[a, y], y<-[b, c, d, e])).
test('identification, test2') :- once(identification(c <- [a, b, c, d, e], c <- [g], c<-[g], g<-[a, b, c, d, e])).
test('identification, test3') :- once(identification(c <- [a], c <- [g], c<-[g], g<-[a])).
test('identification, test4') :- once(identification(c <- [], c <- [g], c<-[g], g<-[])).
test('identification, test5') :- once(identification(x <- [a ,b], x <- [a ,b ,y], x <- [a ,b ,y] , y <- [])).


/* ------------ question 2.4 ---------------- */
test('dichotomisation, given') :- reset_gensym,once(dichotomisation(x <- [a,b,c,d], not(x) <- [a,c,j,k],
                                                    x<-[a, c, z1], not(x)<-[a, c, not(z1)], z1<-[b, d], not(z1)<-[j, k])).
test('dichotomisation, test1') :- reset_gensym,once(dichotomisation(x <- [a ,c], not(x) <- [a ,c ,j ,k],
                                                    x <- [a ,c ,z1], not(x) <- [a ,c ,not(z1)], z1 <- [], not(z1) <- [j ,k])).
test('dichotomisation, fail 1', fail) :- reset_gensym,once(dichotomisation(x <- [a ,c], not(y) <- [a ,c ,j ,k], _, _, _, _)).

test('dichotomisation, test2') :- reset_gensym,once(dichotomisation(x <- [a ,c], not(x) <- [b ,g ,j ,k],
                                                    x <- [z1], not(x) <- [not(z1)], z1 <- [a, c], not(z1) <- [b ,g ,j ,k])).

/* ------------ question 2.5 ---------------- */
test('truncation, given') :- once(truncation(x <- [a, b, c, d], x <- [a, c, j, k], x<-[a, c])).
test('truncation, test1') :- once(truncation(x <- [b ,d], x <- [a ,c ,j ,k], x <- [])) .
test('truncation, fail1', fail) :- once(truncation(x <- [b ,d], xu <- [a ,c ,j ,k], x <- [])).

:- end_tests(part2).
:-    run_tests.
