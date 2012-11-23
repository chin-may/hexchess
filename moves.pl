/*
movechk(State, [Piece,X,Y], Player):-
    bounded,
    possible,
    notblocked.
*/

%    Returns true if the move is safe : king is not check-mated
movechk_w(State, Move, Player):-
    movechk(State, Move, Player),
    makeMove(State, Move, TempState, Player),
%    Check if our king is check-mated
    not(ischeck( TempState, Player) ).


movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player), /*To find the current location of the piece*/
    bounded(X,Y),  
    Y is CurrY,
    X > CurrX,
    Xtmp is CurrX + 1, 
    notblocked(State, Xtmp, CurrY, X, Y, fr , Player).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    Y is CurrY,
    X < CurrX,
    Xtmp is CurrX - 1,
    notblocked(State, Xtmp, CurrY, X, Y , fl, Player).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y > CurrY,
    Ytmp is CurrY + 1,
    notblocked(State, CurrX, Ytmp, X, Y , flu, Player).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y < CurrY,
    Ytmp is CurrY - 1,
    notblocked(State, CurrX, Ytmp, X, Y , frd, Player).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fru, Player).

movechk(State, [rook1, X, Y ], Player):-
    getLoc(State, [rook1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fld, Player).
/*------------------------------------------*/

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player), /*To find the current location of the piece*/
    bounded(X,Y),  
    Y is CurrY,
    X > CurrX,
    Xtmp is CurrX + 1, 
    notblocked(State, Xtmp, CurrY, X, Y, fr , Player).

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player),
    bounded(X,Y),
    Y is CurrY,
    X < CurrX,
    Xtmp is CurrX - 1,
    notblocked(State, Xtmp, CurrY, X, Y , fl, Player).

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y > CurrY,
    Ytmp is CurrY + 1,
    notblocked(State, CurrX, Ytmp, X, Y , flu, Player).

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y < CurrY,
    Ytmp is CurrY - 1,
    notblocked(State, CurrX, Ytmp, X, Y , frd, Player).

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fru, Player).

movechk(State, [rook2, X, Y ], Player):-
    getLoc(State, [rook2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fld, Player).

/*---------------------------------*/
/*---------------------------------*/


movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K > 0,
    Xtmp is CurrX + 2,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vru, Player).

movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K < 0,
    Xtmp is CurrX - 2,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vld, Player).

movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vrd, Player).

movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vlu, Player).



movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vu, Player).

movechk(State, [bish1, X, Y ], Player):-
    getLoc(State, [bish1, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vd, Player).

/*---------------------------------*/

movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K > 0,
    Xtmp is CurrX + 2,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vru, Player).

movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K < 0,
    Xtmp is CurrX - 2,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vld, Player).

movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vrd, Player).

movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vlu, Player).



movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vu, Player).

movechk(State, [bish2, X, Y ], Player):-
    getLoc(State, [bish2, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vd, Player).

/*---------------------------------*/
    
movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player), /*To find the current location of the piece*/
    bounded(X,Y),  
    Y is CurrY,
    X > CurrX,
    Xtmp is CurrX + 1, 
    notblocked(State, Xtmp, CurrY, X, Y, fr , Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    Y is CurrY,
    X < CurrX,
    Xtmp is CurrX - 1,
    notblocked(State, Xtmp, CurrY, X, Y , fl, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y > CurrY,
    Ytmp is CurrY + 1,
    notblocked(State, CurrX, Ytmp, X, Y , flu, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    Y < CurrY,
    Ytmp is CurrY - 1,
    notblocked(State, CurrX, Ytmp, X, Y , frd, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, fru, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is Y - CurrY,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, frd, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K > 0,
    Xtmp is CurrX + 2,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vru, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * 2,
    K < 0,
    Xtmp is CurrX - 2,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vld, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY - 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vrd, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is X - CurrX,
    K is (Y - CurrY) * -1,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY + 1,
    notblocked(State, Xtmp, Ytmp, X, Y, vlu, Player).



movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K > 0,
    Xtmp is CurrX + 1,
    Ytmp is CurrY + 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vu, Player).

movechk(State, [queen, X, Y ], Player):-
    getLoc(State, [queen, CurrX, CurrY], Player),
    bounded(X,Y),
    K is (X - CurrX) * 2,
    K is Y - CurrY ,
    K < 0,
    Xtmp is CurrX - 1,
    Ytmp is CurrY - 2,
    notblocked(State, Xtmp, Ytmp, X, Y, vd, Player).

/*---------------------------------*/

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    1 is Y - CurrY.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is X - CurrX,
    Y is CurrY.
    
movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    X is CurrX,
    1 is  CurrY - Y.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is CurrX - X,
    Y is CurrY.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is X - CurrX,
    1 is Y - CurrY.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is CurrX - X,
    1 is CurrY - Y.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    2 is X - CurrX,
    1 is Y - CurrY.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    2 is CurrX - X,
    1 is CurrY - Y.


movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is X - CurrX,
    2 is Y - CurrY.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is CurrX - X,
    2 is CurrY - Y.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is X - CurrX,
    1 is CurrY - Y.

movechk(State, [kking, X, Y], Player):-
    getLoc(State, [kking, CurrX, CurrY], Player),
    bounded(X,Y),
    1 is CurrX - X,
    1 is Y - CurrY.

/* checking knight begins*/
%x+3.y+1
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 3,
    K2 = 1,
    isfreeofplayer(State, X, Y, Player).
%x+3.y+2    
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 3,
    K2 = 2,
    isfreeofplayer(State, X, Y, Player).
%x+1.y+3    
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 1,
    K2 = 3,
    isfreeofplayer(State, X, Y, Player).
%x+2.y+3    
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 2,
    K2 = 3,
    isfreeofplayer(State, X, Y, Player).
%x-1.y+2    
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -1,
    K2 = 2,
    isfreeofplayer(State, X, Y, Player).
%x-2.y+1    
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -1,
    K2 = 1,
    isfreeofplayer(State, X, Y, Player).
%x+1.y-2
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 1,
    K2 = -2,
    isfreeofplayer(State, X, Y, Player).
%x+2.y-1
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = 2,
    K2 = -1,
    isfreeofplayer(State, X, Y, Player).
%x-1.y-3
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -1,
    K2 = -3,
    isfreeofplayer(State, X, Y, Player).
%x-2.y-3
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -2,
    K2 = -3,
    isfreeofplayer(State, X, Y, Player).
%x-3.y-1
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -3,
    K2 = -1,
    isfreeofplayer(State, X, Y, Player).
%x-3.y-2
movechk(State, [kngt1, X, Y ], Player):-
    getLoc(State, [kngt1, CurrX, CurrY], Player),
    bounded(X,Y),
    K1 is X - CurrX,
    K2 is Y - CurrY,
    K1 = -3,
    K2 = -2,
    isfreeofplayer(State, X, Y, Player).
/* checking knight ends */

/*Checking pawns*/
movechk(State, [pawn1, X, Y], Player):-
    movechk_aux(State, [pawn1, X, Y ], Player).


movechk(State, [pawn2, X, Y], Player):-
    movechk_aux(State, [pawn2, X, Y ], Player).

movechk(State, [pawn3, X, Y], Player):-
    movechk_aux(State, [pawn3, X, Y ], Player).

movechk(State, [pawn4, X, Y], Player):-
    movechk_aux(State, [pawn4, X, Y ], Player).

movechk(State, [pawn5, X, Y], Player):-
    movechk_aux(State, [pawn5, X, Y ], Player).

movechk(State, [pawn6, X, Y], Player):-
    movechk_aux(State, [pawn6, X, Y ], Player).

movechk(State, [pawn7, X, Y], Player):-
    movechk_aux(State, [pawn7, X, Y ], Player).

movechk(State, [pawn8, X, Y], Player):-
    movechk_aux(State, [pawn8, X, Y ], Player).

movechk(State, [pawn9, X, Y], Player):-
    movechk_aux(State, [pawn9, X, Y ], Player).

movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    CurrY is 3,
    2 is Y - CurrY,
    X is CurrX,
    Ytmp is CurrY + 1,
    isfree(State,CurrX, Ytmp),
    isfree(State, X,Y).

movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    CurrY is 3,
    2 is Y - CurrY,
    2 is X - CurrX,
    Ytmp is CurrY + 1,
    Xtmp is CurrX + 1,
    isfree(State, Xtmp, Ytmp),
    isfree(State, X,Y).

movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    X is CurrX,
    Y is CurrY + 1,
    isfree(State, X, Y).

movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    X is CurrX + 1,
    Y is CurrY + 1,
    isfree(State, X, Y).


movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    X is CurrX + 2,
    Y is CurrY + 1,
    not(isfree(State, X, Y)),
    isfreeofplayer(State, X, Y, white).

movechk_aux(State, [Pawn, X, Y ], white):-
    getLoc(State, [Pawn, CurrX, CurrY], white),
    bounded(X,Y),
    X is CurrX + 1,
    Y is CurrY - 1,
    not(isfree(State, X, Y)),
    isfreeofplayer(State, X, Y, white).

movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    CurrY is 7,
    2 is CurrY - Y,
    X is CurrX,
    Ytmp is CurrY - 1,
    isfree(State,CurrX, Ytmp),
    isfree(State,X,Y).

movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    CurrY is 7,
    2 is CurrY - Y,
    2 is CurrX - X,
    Ytmp is CurrY - 1,
    Xtmp is CurrX - 1,
    isfree(State, Xtmp, Ytmp),
    isfree(State,X,Y).

movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    X is CurrX,
    Y is CurrY - 1,
    isfree(State, X, Y).


movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    X is CurrX - 1,
    Y is CurrY - 1,
    isfree(State, X, Y).

movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    X is CurrX + 1,
    Y is CurrY - 1,
    not(isfree(State, X, Y)),
    isfreeofplayer(State, X, Y, black).

movechk_aux(State, [Pawn, X, Y ], black):-
    getLoc(State, [Pawn, CurrX, CurrY], black),
    bounded(X,Y),
    X is CurrX - 2,
    Y is CurrY - 1,
    not(isfree(State, X, Y)),
    isfreeofplayer(State, X, Y, black).

/*---------------------------------*/
/*---------------------------------*/
/** X1, X2, Y1, Y2 must all be instantiated*/

notblocked(State, X1, Y1, X2, Y2, _, Player):-
    X1 is X2,
    Y1 is Y2,
    !,
    isfreeofplayer(State, X1, Y1, Player).


/*For faces*/
notblocked(State, X1, Y1, X2, Y2, fr, Player):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    notblocked(State, Xn, Y1, X2, Y2, fr, Player).


notblocked(State, X1, Y1, X2, Y2, fl, Player):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    notblocked(State, Xn, Y1, X2, Y2, fl, Player).


notblocked(State, X1, Y1, X2, Y2, flu, Player):-
    isfree(State, X1, Y1),
    Yn is Y1 + 1,
    notblocked(State, X1, Yn, X2, Y2, flu, Player).


notblocked(State, X1, Y1, X2, Y2, frd, Player):-
    isfree(State, X1, Y1),
    Yn is Y1 - 1,
    notblocked(State, X1, Yn, X2, Y2, frd, Player).


notblocked(State, X1, Y1, X2, Y2, fru, Player):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    Yn is Y1 + 1,
    notblocked(State, Xn, Yn, X2, Y2, fru, Player).

notblocked(State, X1, Y1, X2, Y2, fld, Player):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    Yn is Y1 - 1,
    notblocked(State, Xn, Yn, X2, Y2, fld, Player).


/*For vertices*/

notblocked(State, X1, Y1, X2, Y2, vu, Player):-
    isfree(State, X1, Y1),
    Xn is X1 + 1,
    Yn is Y1 + 2,
    notblocked(State, Xn, Yn, X2, Y2, vu, Player).

notblocked(State, X1, Y1, X2, Y2, vd, Player):-
    isfree(State, X1, Y1),
    Xn is X1 - 1,
    Yn is Y1 - 2,
    notblocked(State, Xn, Yn, X2, Y2, vd, Player).


notblocked(State, X1, Y1, X2, Y2, vru, Player):-
    isfree(State, X1, Y1),
    Xn is X1 + 2,
    Yn is Y1 + 1,
    notblocked(State, Xn, Yn, X2, Y2, vru, Player).


/*For checking if the location X, Y is unoccupied*/

isfree([White, Black], X, Y):-
    not(member([_, X, Y] ,White)),
    not(member([_, X, Y] ,Black)).

/*For checking if the location X, Y is not occupied by given player*/
isfreeofplayer([White, _], X, Y,white):-
    not(member([_, X, Y] ,White)).
    
isfreeofplayer([_, Black], X, Y,black):-
    not(member([_, X, Y] ,Black)).


getLoc([White, _], Posn ,white):-
    member(Posn, White).
    
getLoc([_, Black], Posn ,black):-
    member(Posn, Black).

/*Checks if a location is inside the board*/
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
