getOwnMove(State, Player, Move):-
    other(Player, OP),
    %setof(OpV,  getOppVal(NewState, OP, OpV) ^ makeMove(State, Move, NewState, Player) ^movechk_w(State, Move, Player), Vals),
    setof(OpV, oppMoveEval(State, Player, OpV), Vals),
    lmin(Vals, EnemyMin),
    movechk_w(State, Move, Player),
    getOppVal(State, OP, EnemyMin).

oppMoveEval(State, Player, Val):-
    other(Player, OP),
    movechk_w(State, Move, Player),
    makeMove(State, Move, NewState, Player),
    getOppVal(NewState, OP, Val).


getOppVal(State, OPlayer, Val):-
    %setof(V, evalBoard(NewState, OPlayer, V)^ makeMove(State, M, NewState, OPlayer) ^ movechk(State, M, OPlayer), Vals),
    setof(V, moveEval(State, OPlayer,V), Vals),
    lmax(Vals, Val).

moveEval(State, Player, Val):-
    %can that move be made
    movechk(State, M, Player),
    makeMove(State, M, NewState, Player),
    evalBoard(NewState, Player, Val).
    

lmin([], 100000000).

lmin([H|Lst], Res):-
    lmin(Lst, ResTmp),
    ResTmp < H,
    Res = ResTmp.

lmin([H|Lst], Res):-
    lmin(Lst, ResTmp),
    ResTmp > H,
    Res = H.

lmin([H|Lst], Res):-
    lmin(Lst, ResTmp),
    ResTmp = H,
    Res = H.

lmax([], 0).

lmax([H|Lst], Res):-
    lmax(Lst, ResTmp),
    ResTmp > H,
    Res = ResTmp.

lmax([H|Lst], Res):-
    lmax(Lst, ResTmp),
    ResTmp < H,
    Res = H.

lmax([H|Lst], Res):-
    lmax(Lst, ResTmp),
    ResTmp = H,
    Res = H.

evalBoard([White , Black], white, Val):-
    evalBoardAux(White, WVal),
    evalBoardAux(Black, BVal),
    Val is WVal - BVal.

evalBoard([White , Black], black, Val):-
    evalBoardAux(Black, BVal),
    evalBoardAux(White, WVal),
    Val is BVal - WVal.
    

evalBoardAux([], 0).
evalBoardAux( [[Piece , _, _] | Lst], Ans  ):-
    evalBoardAux(Lst, N),
    value(Piece, Val),
    Ans is N + Val .





value(queen, 200).
value(kking, 100000).

value(rook1, 20).
value(rook2, 20).

value(bish1, 20).
value(bish2, 20).
value(bish3, 20).

value(kngt1, 30).
value(kngt2, 30).

value(pawn1, 10).
value(pawn2, 10).
value(pawn3, 10).
value(pawn4, 10).
value(pawn5, 10).
value(pawn6, 10).
value(pawn7, 10).
value(pawn8, 10).
value(pawn9, 10).
