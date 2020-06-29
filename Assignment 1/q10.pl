% Part A (This is the implementation of the circuit shown in the assignment question 10.)
% The circuit used two and gates, one or gate, and one inverter.
% Their possible inputs and outputs are defined here as well as the rule for the circuit 
inv(0,1).
inv(1,0).

and(1,1,1).
and(0,1,0).
and(1,0,0).
and(0,0,0).


or(0,0,0).
or(1,0,1).
or(0,1,1).
or(1,1,1).

circuit(A, B, S, C) :- or(A, B, Cor), and(A, B, C), inv(C, Cinv), and(Cor, Cinv, S).


% Part B (This is the query that we need to ask for the output)
% This takes one input and 0 and the other one we don't care, to give us the value of the sum and carry

circuit(0, _, S, C).