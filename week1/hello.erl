-module(hello).

-export([nth/2, respond/1, say/1, sum/1, triple/1]).

say(A) -> io:format("Hello, ~p ~n", [A]).

respond(jake) -> "Hi jake!";
respond(42) -> meaningoflife;
respond({mytuple, _}) ->
    "You gave me a pair but I ignored half "
    "of it".

% broken({1,A}) -> 1+A;
% broken({1,0}) -> 1;
% broken(A) -> { error , " I can ’t handle that !" , A}.

triple({_, _, A}) -> A.

sum([]) -> 0;
sum([A]) -> A;
sum([A | B]) -> A + sum(B).


nth(0, [A | _]) -> A;
nth(A, [_ | B]) -> nth(A - 1, B).
