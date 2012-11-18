%Modify the names accordingly
piece('pawn1').
piece('pawn2').
piece('pawn3').
piece('pawn4').
piece('pawn5').
piece('pawn6').
piece('pawn7').
piece('pawn8').
piece('pawn9').
piece('rook1').
piece('rook2').
piece('bish1').
piece('bish2').
piece('bish3').
piece('kngt1').
piece('kngt2').
piece('kking').
piece('queen').

%so that we can enumerate 
validNum(1).
validNum(2).
validNum(3).
validNum(4).
validNum(5).
validNum(6).
validNum(7).
validNum(8).
validNum(9).

input :-
    write('Enter the position details of move: '), read([A,X,Y]),
    ((piece(A), validNum(X), validNum(Y)) ->
    (write('The position of '), write(A),write(' is at '),write(X),write(', '),write(Y),nl);
    write('invalid move') ).

initializeBoard([White,Black]) :-
    White = [[pawn1,1,3],[pawn2,2,3],[pawn3,3,3],[pawn4,4,3],[pawn5,5,3],[pawn6,6,3],[pawn7,7,3],[pawn8,8,3],[pawn9,9,3],
              [rook1,1,1],[rook2,9,1],[kngt1,2,1],[kngt2,8,1],[bish1,3,1],[bish2,5,1],[bish3,7,1],[queen,4,1],[kking,6,1] ],

    Black = [[pawn1,1,7],[pawn2,2,7],[pawn3,3,7],[pawn4,4,7],[pawn5,5,7],[pawn6,6,7],[pawn7,7,7],[pawn8,8,7],[pawn9,9,7],
              [rook1,1,9],[rook2,9,9],[kngt1,2,9],[kngt2,8,9],[bish1,3,9],[bish2,5,9],[bish3,7,9],[queen,4,9],[kking,6,9] ].

