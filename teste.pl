:- dynamic energia/2.

energia(starlight, 100).

poder(fraco, 30).
poder(medio, 40).
poder(forte, 70).

usar_poder(Heroi, Poder) :-
    energia(Heroi, EnergiaAtual),
    poder(Poder, Custo),

    (EnergiaAtual >= Custo ->
        NovaEnergia is EnergiaAtual - Custo,

        retract(energia(Heroi, EnergiaAtual)),
        assert(energia(Heroi, NovaEnergia)),

        format("~w usou poder ~w de custo ~w e agora tem ~w de energia.~n", [Heroi, Poder, Custo, NovaEnergia]);
        
        NovaEnergia is EnergiaAtual,
        format("~w tentou usar o poder ~w, mas a energia e insuficiente. Energia atual: ~w.~n", [Heroi, Poder, NovaEnergia])).

exposicao_luz(solar, Ganho) :- Ganho is 20.
exposicao_luz(lampada, Ganho) :- Ganho is 30.
exposicao_luz(holofote, Ganho) :- Ganho is 50.

recarregar_energia(Heroi, Ganho) :-
    energia(Heroi, EnergiaAtual),
    NovaEnergia is min(EnergiaAtual + Ganho, 100),

    retract(energia(Heroi, EnergiaAtual)),
    assert(energia(Heroi, NovaEnergia)),

    format("~w recarregou ~w de energia. Agora tem ~w de energia.~n", [Heroi, Ganho, NovaEnergia]).

monitorar_batalha(Heroi) :-
    energia(Heroi, EnergiaAtual),
    (EnergiaAtual =< 10 ->
        format("Alerta: ~w esta com energia critica! (energia restante: ~w)~n", [Heroi, EnergiaAtual]);
        
        format("~w continua na batalha com ~w de energia.~n", [Heroi, EnergiaAtual])
    ).

batalha :-
    random_member(Poder, [fraco, medio, forte]),
    usar_poder(starlight, Poder),

    random_member(Luz, [solar, lampada, holofote]),
    format("~w absorveu a energia (da/o) ~w.~n", [starlight, Luz]),
    exposicao_luz(Luz, Ganho),
    recarregar_energia(starlight, Ganho),

    monitorar_batalha(starlight),

    random_member(Poder_2, [fraco, medio, forte]),
    usar_poder(starlight, Poder_2),

    monitorar_batalha(starlight).
