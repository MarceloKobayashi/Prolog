inverte_lista([], []).
inverte_lista([Head | Tail], ListaFinal) :-
    inverte_lista(Tail, Resultado), append(Resultado, [Head], ListaFinal).

palindromo(Lista) :-
    inverte_lista(Lista, Invertida), 
    Lista = Invertida.
