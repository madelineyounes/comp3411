/* Test file for COMP3411 assignment 1 */

:- consult(assign1_part1).
:- begin_tests(assign1_part1).

/* tests for question sumsq_even */
test('sumsq_even, given') :- once(sumsq_even([1,3,5,2,-4,6,8,-7], 120)).
test('sumsq_even, empty') :- once(sumsq_even([], 0)).
test('sumsq_even, all odd') :- once(sumsq_even([1,3,5], 0)).
test('sumsq_even, all even') :- once(sumsq_even([2,-4,6,8], 120)).
test('sumsq_even, all negative') :- once(sumsq_even([-1,-3,-5,-2,-4,-6,-8,-7], 120)).
test('sumsq_even, all positive') :- once(sumsq_even([1,3,5,2,4,6,8,7], 120)).
test('sumsq_even, large') :- once(sumsq_even([1,3,5,2,-4,6,8,-7,1,3,5,2,-4,6,8,-7,1,3,5,2,-4,6,8,-7], 360)).
test('sumsq_even, big numbers') :- once(sumsq_even([56, 120, 11111], 17536)).
test('sumsq_even, one odd') :- once(sumsq_even([1], 0)).
test('sumsq_even, one even') :- once(sumsq_even([2], 4)).

/* tests for question eliza1 */
test('eliza1, given') :- once(eliza1([you,do,not,like,me], [what,makes,you,say,i,do,not,like,you])).
test('eliza1, empty') :- once(eliza1([], [])).
test('eliza1, just you') :- once(eliza1([you], [what,makes,you,say,i])).
test('eliza1, uses me->your') :- once(eliza1([you,like,my,dress], [what,makes,you,say,i,like,your,dress])).
test('eliza1, one of each change') :- once(eliza1([you,me,my], [what,makes,you,say,i,you,your])).
test('eliza1, nonsensical given') :-  once(eliza1([i,wonder,if,you,would,help,me,learn,prolog],[what,makes,you,say,i,wonder,if,i,would,help,you,learn,prolog])).
test('eliza1, multpul you') :- once(eliza1([you,you,you,you],[what,makes,you,say,i,i,i,i])).
/* tests for question eliza2 */
test('eliza2, given') :- once(eliza2([i,wonder,if,you,would,help,me,learn,prolog], [what,makes,you,think,i,would,help,you])).
test('eliza2, empty') :- once(eliza2([], [])).
test('eliza2, no words between') :- once(eliza2([you,me], [what,makes,you,think,i,you])).
test('eliza2, interlaping you and me') :- once(eliza2([hello,you,wonder,if,you,me,help,me,learn,prolog], [what,makes,you,think,i,wonder,if,you,you])).
test('eliza2, double') :- once(eliza2([potato,you,you,if,you,would,me,me], [what,makes,you,think,i,you,if,you,would,you])).
test('eliza2, random') :- once(eliza2([could,you,understand,what,you,were,saying,to,me,or,not], [what,makes,you,think,i,understand,what,you,were,saying,to,you])).
test('eliza2, false1', fail) :- once(eliza2([i,wonder,if], _)).
test('eliza2, false2', fail) :- once(eliza2([i,wonder,if,you,are], _)).
test(fail,'eliza2, false3', fail) :- once(eliza2([i,wonder,if,me],_)).

/* tests for question eliza2 */
test('eval, given1') :- once(eval(add(1, mul(2, 3)), 7)).
test('eval, given2') :- once(eval(div(add(1, mul(2, 3)), 2), 3.5)).
test('eval, all division') :- once(eval(div(div(1, div(2, 3)), div(1, 6)), 9.0)).
test('eval, all add') :- once(eval(add(add(1, add(2, 3)), 2), 8)). % ((1+2+3)+2)
test('eval, all mul') :- once(eval(mul(mul(1, mul(2, 3)), 2), 12)). % ((1*2*3)*2)
test('eval, all sub') :- once(eval(sub(sub(3, sub(sub(sub(6,12), 8),sub(-4, -3))), 2), 14)).
test('eval, one layer') :- once(eval(sub(6, 2), 4)).
test('eval, mul by 0') :- once(eval(mul(mul(1, mul(2, 3)), 0), 0)).
test('eval, div by 0, 1', fail) :- once(eval(div(div(1, div(1, 3)), 0), _)).
test('eval, div by 0, 2') :- once(eval(div(0, 3), 0)).

:- end_tests(assign1_part1).
:-    run_tests.
