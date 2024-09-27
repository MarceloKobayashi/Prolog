list([], []).

list([Head | Tail], List) :-
    list(Tail, Result),     % Recursiva para pegar todos os elementos.
    inserir(Head, Result, List).    % Chama a função de inserir Head na posição correta de Result

inserir(X, [], [X]).    % Se a lista estiver vazia, lista é Head
inserir(X, [Y | Tail], [X, Y | Tail]) :-    % Coloca X antes de Y se X for menor ou igual a Y
    X =< Y.

inserir(X, [Y | Tail], [Y | ResultTail]) :- % Quando X é maior que Y, Y é mantido na lista resultado
    inserir(X, Tail, ResultTail).       % Mantem o Y e chama inserir(X, [Tail], ResultTail)
                                        % Depois retorna Result = [Y | [x | Tail]]

% Primeiro é chamado inserir e verifica se X é menor ou igual a Y.
% Se a proposição acima for falsa, utiliza a última inserir para chamar recursivamente inserir, mas sem o Y (apenas Tail).
% Quando for satisfeita a afirmação que X é maior ou igual a Y, ou que Tail é vazia, X é acrescentado na lista.
% Depois são feitos vários inserir com (Yanteriores, ResultTail, List) até todos os Y acabarem.




