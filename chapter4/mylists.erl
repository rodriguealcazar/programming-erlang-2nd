-module(mylists).
-export([sum/1, map/2]).

sum([]) -> 0.
sum([H|T]) -> H + sum(T);

map([], _) -> [].
map([H|T], F) -> [F(H) | map(T, F)];
