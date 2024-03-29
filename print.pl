printboard(State):-
    show(State, 1,9),
    !,
    nl.

show(_, _, Y):-
    Y = 0.

show(State, X, Y):-
    X > 9,
    Yn is Y - 1,
    write('\n\n'),
    boardIndent(Y),
    show(State, 1, Yn).



show(State, X, Y):-
    isfree(State, X, Y),
    write('   _      '),
    Xn is X + 1,
    show(State, Xn, Y).

show([White, Black], X, Y):-
    member([Piece, X, Y], White),
    write(' w-'), write(Piece), write('  '),
    Xn is X + 1,
    show([White,Black], Xn, Y).

show([White, Black], X, Y):-
    member([Piece, X, Y], Black),
    write(' b-'), write( Piece),write('  '), 
    Xn is X + 1,
    show([White,Black], Xn, Y).


boardIndent(Y):-
    Y is 9,
    write('     ').


boardIndent(Y):-
    write('     '),
    Ytmp is Y + 1,
    boardIndent(Ytmp).

