lista_invertida([], []).
lista_invertida([Head | Tail], List) :-
    lista_invertida(Tail, Result),
    append(Result, [Head], List).

palindromo(List) :-
    lista_invertida(List, Invertida),
    List = Invertida.