:- dynamic energia/2.

energia(starlight, 100).

poder(fraco, 30).
poder(medio, 40).
poder(forte, 70).

usar_poder(Poder) :-
    energia(starlight, EnergiaAtual),
    poder(Poder, Custo),

    (EnergiaAtual >= Custo ->
        NovaEnergia is EnergiaAtual - Custo,

        retract(energia(starlight, EnergiaAtual)),
        assert(energia(starlight, NovaEnergia)),

        format("Starlight usou poder ~w de custo ~w e agora tem ~w de energia.~n", [Poder, Custo, NovaEnergia]);
        
        NovaEnergia is EnergiaAtual,
        format("Starlight tentou usar o poder ~w, mas a energia e insuficiente. Energia atual: ~w.~n", [Poder, NovaEnergia])).

exposicao_luz(solar, Ganho) :- Ganho is 20.
exposicao_luz(lampada, Ganho) :- Ganho is 30.
exposicao_luz(holofote, Ganho) :- Ganho is 50.

recarregar_energia(Ganho) :-
    energia(starlight, EnergiaAtual),
    NovaEnergia is min(EnergiaAtual + Ganho, 100),

    retract(energia(starlight, EnergiaAtual)),
    assert(energia(starlight, NovaEnergia)),

    format("Starlight recarregou ~w de energia. Agora tem ~w de energia.~n", [Ganho, NovaEnergia]).

monitorar_batalha() :-
    energia(starlight, EnergiaAtual),
    (EnergiaAtual =< 10 ->
        format("Alerta: Starlight esta com energia critica! (energia restante: ~w)~n", [EnergiaAtual]);
        
        format("Starlight continua na batalha com ~w de energia.~n", [EnergiaAtual])
    ).

batalha :-
    random_member(Poder, [fraco, medio, forte]),
    usar_poder(Poder),

    random_member(Luz, [solar, lampada, holofote]),
    format("Starlight absorveu a energia (da/o) ~w.~n", [Luz]),
    exposicao_luz(Luz, Ganho),
    recarregar_energia(Ganho),

    monitorar_batalha,

    random_member(Poder_2, [fraco, medio, forte]),
    usar_poder(Poder_2),

    monitorar_batalha.
