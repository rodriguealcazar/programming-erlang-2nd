-module(street).
-export([main/0]).

main() ->
    NumberNine = {house, 9},
    NumberTen = {house, 10},
    NumberEleven = {house, 11},
    NumberTwelve = {house, 12},

    CalleDeGranada = {
      street,
      'Calle de Granada',
      [NumberNine, NumberTen, NumberEleven, NumberTwelve]
    },

    CalleDeGranada.
