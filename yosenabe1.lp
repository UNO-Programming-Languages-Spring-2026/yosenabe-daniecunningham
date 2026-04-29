%% Your code here

reachable(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), X=XX.
reachable(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), Y=YY.
% achieved: (XX,YY) is a reachable gray cell for the number at (X,Y) 
%           if they share the same row or column.

1 { target(X,Y,XX,YY) : reachable(X,Y,XX,YY) } 1 :- number(X,Y,_).
% achieved: for each number at (X,Y), exactly one target (XX,YY) is chosen from reachable gray cells.

#show target/4.