list([], []).                                                 

list([Head | Tail], List) :-                                  
    list(Tail, Result),                                        
    inserir(Head, Result, List).                                

inserir(X, [], [X]).                                           
inserir(X, [Y | Tail], [X, Y | Tail]) :-                       
    X =< Y.

inserir(X, [Y | Tail], [Y | ResultTail]) :-                     
    inserir(X, Tail, ResultTail).                              





