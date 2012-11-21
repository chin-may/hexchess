begin:-
    initializeBoard(State),
    printboard(State),
    aiPlay(State, white).
    


play(State, Player):-
    gameOver(State, Player),
    !,
    other(Player, OP),
    write(OP), write(' wins\n').

play(State, white):-
    input(Move, State, white),
    movechk_w(State,Move, white),
    makeMove(State, Move, NewState, white),
    printboard(NewState),
    play(NewState, black).
    
play(State, black):-
    input(Move,State,black),
    printboard(State), write(Move),nl,
    movechk_w(State,Move, black),
    makeMove(State, Move, NewState, black),
    printboard(NewState),
    play(NewState, white).


ischeck(State, Player):-
    getLoc(State, [kking, Xk, Yk], Player),
    other(Player, OP),
%    can the opponent reach this cell using any piece
    movechk(State, [_, Xk, Yk], OP).

cansave(State, Player):-
    movechk_w(State, _, Player).


gameOver(State, Player):-
    ischeck(State, Player),
    not(cansave(State, Player)).
    



makeMove([White,Black], [Piece, X, Y], [ [ [Piece, X, Y] | TempWhite] , NewBlack], white):-
    select([_, X, Y], Black, NewBlack),
    select([Piece,_,_], White, TempWhite).

makeMove([White,Black], [Piece, X, Y], [NewWhite, [ [Piece,X,Y] | TempBlack ]], black):-
    select([_, X, Y], White, NewWhite),
    select([Piece,_,_], Black, TempBlack).



makeMove([White,Black], [Piece, X, Y], [ [ [Piece, X, Y] | TempWhite] , Black], white):-
    select([Piece,_,_], White, TempWhite).

makeMove([White,Black], [Piece, X, Y], [White, [ [Piece,X,Y] | TempBlack ]], black):-
    select([Piece,_,_], Black, TempBlack).

other(white, black).
other(black, white).


