/*
movechk(State, [Piece,X,Y], Player):-
    bounded,
    possible,
    notblocked.
*/


movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player), /*To find the current location of the piece*/
    bounded(X,Y),  
    Y is CurrY,
    X > CurrX,
    Xtmp is CurrX + 1, 
    notblocked(State, Xtmp, CurrY, X, Y, fr ).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    Y is CurrY,
    X < CurrX,
    Xtmp is CurrX - 1,
    notblocked(State, Xtmp, CurrY, X, Y , fl).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y > CurrY,
    Ytmp is CurrY + 1,
    notblocked(State, CurrX, Ytmp, X, Y , flu).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y < CurrY,
    Ytmp is CurrY - 1,
    notblocked(State, CurrX, Ytmp, X, Y , frd).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fru).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, frd).



/*---------------------------------*/
/** X1, X2, Y1, Y2 must all be instantiated*/

notblocked(_, X1, Y1, X2, Y2, _):-
    X1 is X2,
    Y1 is Y2,
    !.

/*For faces*/
notblocked(State, X1, Y1, X2, Y2, fr):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    notblocked(State, Xn, Y1, X2, Y2, fr).


notblocked(State, X1, Y1, X2, Y2, fl):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    notblocked(State, Xn, Y1, X2, Y2, fl).


notblocked(State, X1, Y1, X2, Y2, flu):-
    isfree(State, X1, Y1),
    Yn is Y1 + 1,
    notblocked(State, X1, Yn, X2, Y2, flu).


notblocked(State, X1, Y1, X2, Y2, frd):-
    isfree(State, X1, Y1),
    Yn is Y1 - 1,
    notblocked(State, X1, Yn, X2, Y2, frd).


notblocked(State, X1, Y1, X2, Y2, fru):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    Yn is Y1 + 1,
    notblocked(State, Xn, Yn, X2, Y2, fru).

notblocked(State, X1, Y1, X2, Y2, fld):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    Yn is Y1 - 1,
    notblocked(State, Xn, Yn, X2, Y2, fld).


/*For vertices*/

notblocked(State, X1, Y1, X2, Y2, vu):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    Yn is Y1 + 2,
    notblocked(State, Xn, Yn, X2, Y2, vu).

notblocked(State, X1, Y1, X2, Y2, vd):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    Yn is Y1 - 2,
    notblocked(State, Xn, Yn, X2, Y2, vd).


notblocked(State, X1, Y1, X2, Y2, vru):-
    isfree(State, X1, Y1),
    Xn is X1 + 2,
    Yn is Y1 + 1,
    notblocked(State, Xn, Yn, X2, Y2, vru).


/*For checking if the location X, Y is unoccupied*/

isfree([White, Black], X, Y):-
    not(member([_, X, Y] ,White)),
    not(member([_, X, Y] ,Black)).

/*isfree([White,Black|[]], X, Y):-
    freeAux(White, X, Y),
    freeAux(Black, X, Y).

freeAux([],_,_).

freeAux([[_,Xloc, Yloc|[]]|_], X, Y):-
    Xloc is X,
    Yloc is Y,
    !,
    fail.

freeAux([_|PosLst], X, Y):-
    freeAux(PosLst, X, Y).
*/

getLoc([White, _], Posn ,white):-
    member(Posn, White).
    
getLoc([_, Black], Posn ,white):-
    member(Posn, Black).

/*Checks if a location is inside the board*/

/*
bounded(X, Y):-
    X > 0,
    Y > 0,
    X < 10,
    Y < 10.
*/
/*Written this way so that it also instantiates*/
bounded(X, Y):-
    onetonine(X),
    onetonine(Y).

onetonine(X):-
    X = 1.
onetonine(X):-
    X = 2.
onetonine(X):-
    X = 3.
onetonine(X):-
    X = 4.
onetonine(X):-
    X = 5.
onetonine(X):-
    X = 6.
onetonine(X):-
    X = 7.
onetonine(X):-
    X = 8.
onetonine(X):-
    X = 9.
