aiPlay(State, white):-
    getOwnMove(State,white,Move),
    movechk_w(State,Move, white),
    makeMove(State, Move, NewState, white),
    printboard(NewState),
%    delay(10000000),
    aiPlay(NewState, black).


aiPlay(State, black):-
    getOwnMove(State,black,Move),
    movechk_w(State,Move, black),
    makeMove(State, Move, NewState, black),
    printboard(NewState),
%    delay(10000000),
    aiPlay(NewState, white).

aiPlay(State, Player):-
    gameOver(State, Player),
    !,
    other(Player, OP),
    write(OP), write(' wins\n').


delay(0).
delay(N):-
    N1 is N-1,
    delay(N1).


getOwnMove(State, Player, Move):-
    alpha_beta(Player,3,State,-100000,100000,Move,_Value).
    
    
alpha_beta(Player,0,State,_Alpha,_Beta,_NoMove,Value) :- 
   evalBoard(State,Player,Value).

alpha_beta(Player,D,State,Alpha,Beta,Move,Value) :- 
%    write('alphaB'),
   D > 0, 
   findall(M, movechk(State, M, Player),Moves), 
   Alpha1 is -Beta, 
   Beta1 is -Alpha,
   D1 is D-1, 
   evaluate_and_choose(Player,Moves,State,D1,Alpha1,Beta1,nil,(Move,Value)).
    
    
evaluate_and_choose(Player,[Move|Moves],State,D,Alpha,Beta,Record,BestMove) :-
%    write('choose'),
   makeMove(State, Move, NewState, Player),
   other(Player,OtherPlayer),
   alpha_beta(OtherPlayer,D,NewState,Alpha,Beta,_OtherMove,Value),
   Value1 is -Value,
   cutoff(Player,Move,Value1,D,Alpha,Beta,Moves,State,Record,BestMove).
   
evaluate_and_choose(_Player,[],_State,_D,Alpha,_Beta,Move,(Move,Alpha)).

cutoff(_Player,Move,Value,_D,_Alpha,Beta,_Moves,_State,_Record,(Move,Value)) :- 
   Value >= Beta, !.
   
cutoff(Player,Move,Value,D,Alpha,Beta,Moves,State,_Record,BestMove) :- 
   Alpha < Value, Value < Beta, !, 
   evaluate_and_choose(Player,Moves,State,D,Value,Beta,Move,BestMove).
   
cutoff(Player,_Move,Value,D,Alpha,Beta,Moves,State,Record,BestMove) :- 
   Value =< Alpha, !, 
   evaluate_and_choose(Player,Moves,State,D,Alpha,Beta,Record,BestMove).

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

