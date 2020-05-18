#!/usr/bin/env escript

main(_) ->

    %% Basic funs.
    Double = fun(X) -> 2 * X end,
    print(Double(2)),

    Hypot = fun(X, Y) -> math:sqrt(X * X + Y * Y) end,
    print(Hypot(3, 4)),

    TempConvert = fun({c, C}) -> {f, 32 + C * 9 / 5};
                     ({f, F}) -> {c, (F - 32) * 5 / 9}
                  end,
    print(TempConvert({c, 100})),
    print(TempConvert({f, 90})),

    %% Functions with funs as argument.
    List = [1, 2, 3, 4, 5],
    print(lists:map(fun(X) -> X * 2 end, List)),

    Even = fun(X) -> (X rem 2) =:= 0 end,
    Even(8),
    Even(9),
    print(lists:filter(Even, List)),

    %% Functions that return funs.
    Fruit = [apple, pear, orange],
    MakeTest = fun(L) -> (fun(X) -> lists:member(X, L) end) end,
    IsFruit = MakeTest(Fruit),
    print(IsFruit(pear)),
    print(IsFruit(dog)),
    print(lists:filter(IsFruit, [dog, orange, cat, apple])),

    Mult = fun(X) -> (fun(Y) -> X * Y end) end,
    Triple = Mult(3),
    print(Triple(5)),

    print(for(15, 25, fun(I) -> I end)).

%% Control abstractions.
for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].


print(S) ->
    io:format("~p~n", [S]).

