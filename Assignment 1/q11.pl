lucas(1, [2]) :- !.
lucas(2, [2,1]) :- !.
lucas(N, L) :-
    N > 2,
    N1 is N-1,
    N2 is N-2,
    lucas(N1, L1),
    lucas(N2, L2),
    last(L1, X1),
    last(L2, X2),
    X is X1+X2,
    append_to_end(L1, X, L).

append_to_end([], N, [N]).
append_to_end([H|T], N, [H|R]) :- append_to_end(T, N, R).