% fatos
father(flavio, marcelo).
father(flavio, caio).
father(flavio, bruna).
father(di, flavio).
father(honda, patricia).
mother(patricia, bruna).
mother(ba, flavio).
mother(patricia, marcelo).
mother(furusho, patricia).

% regras
show_parents(Parents, X) :-
    setof(P, (father(P, X); mother(P, X)), Parents).

grandfather(X, Y) :- 
    father(X, Z), (father(Z, Y); mother(Z, Y)). % Se X for pai de Z e Z for pai/mae de Y, então X é avô de Y
all_grandfathers(Grandfathers, X) :-
    setof(G, grandfather(G, X), Grandfathers). % Acha todos os G avôs de X e coloca em Grandfathers

grandmother(X, Y) :-
    mother(X, Z), (father(Z, Y); mother(Z, Y)).
all_grandmothers(Gm, X) :-
    setof(G, grandmother(G, X), Gm).

siblings(X, Y) :-
    father(P, X), father(P, Y), X \= Y. % Se o pai de X é o mesmo pai de Y, então X e Y são irmaos
siblings(X, Y) :-
    mother(M, X), mother(M, Y), X \= Y.
all_siblings(Siblings, X) :-
    setof(S, siblings(S, X), Siblings).
