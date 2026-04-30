%% Your code here

reachable(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), X=XX.
reachable(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), Y=YY.
% achieved: (XX,YY) is a reachable gray cell for the number at (X,Y) 
%           if they share the same row or column.

1 { target(X,Y,XX,YY) : reachable(X,Y,XX,YY) } 1 :- number(X,Y,_).
% achieved: for each number at (X,Y), exactly one target (XX,YY) is chosen from reachable gray cells.

populated(A) :- area(X,Y,A), target(_,_,X,Y).
% achieved: area A is populated if at least one number has been moved into it.

:- area(_,_,A), not populated(A).
% achieved: every area must have at least one number moved into it.

path(X,Y,CX, CY) :- target(X,Y,_,YY), CX=X, CY=Y..YY.
path(X,Y,CX, CY) :- target(X,Y,_,YY), CX=X, CY=YY..Y.
path(X,Y,CX, CY) :- target(X,Y,XX,_), CX=X..XX, CY=Y.
path(X,Y,CX, CY) :- target(X,Y,XX,_), CX=XX..X, CY=Y.
% achieved: cell (CX,CY) lies on the straight-line path of the number originating at (X,Y).S

:- path(X1,Y1,CX,CY), path(X2,Y2,CX,CY), X1 < X2.
:- path(X1,Y1,CX,CY), path(X2,Y2,CX,CY), X1 = X2, Y1 < Y2.
% achieved: no two different numbers can share a path cell (CX,CY).


#show target/4.