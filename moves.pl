
movechk(State, [Piece,X,Y|[]], Player):-
    bounded,
    possible,
    notblocked.



movechk(State, [rook1, X, Y |[]], Player):-
    getLoc(State, rook1, [rook1, CurrX, CurrY]), /*To find the current location of the piece*/
    X is CurrX + 1,
    Y is CurrY,
    bounded(X,Y).                               /*This is here because if passed a variable, bounded cannot be called as X and Y not instantiated.*/

movechk(State, [rook1, X, Y |[]], Player):-
    getLoc(State, rook1, [rook1, CurrX, CurrY]),
    X is CurrX - 1,
    Y is CurrY,
    bounded(X,Y).

movechk(State, [rook1, X, Y |[]], Player):-
    getLoc(State, rook1, [rook1, CurrX, CurrY]),
    X is CurrX,
    Y is CurrY + 1,
    bounded(X,Y).

movechk(State, [rook1, X, Y |[]], Player):-
    getLoc(State, rook1, [rook1, CurrX, CurrY]),
    X is CurrX,
    Y is CurrY - 1,
    bounded(X,Y).

notblocked(State, X1, Y1, X2, Y2):-
    


bounded(X, Y):-
    X > 0,
    Y > 0,
    X < 10,
    Y < 10.

