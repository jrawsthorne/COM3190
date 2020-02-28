-module(ccs).
-export([do/1, nil/0, p1/0, p2/0, p3/0, p4/0, p5/0, q5/0]).

do([]) -> ok;
do("a") -> do({input,a});
do("b") -> do({input,b});
do("~a") -> do({output,a});
do("~b") -> do({output,b});
do("0") -> nil();
do({output, E}) -> io:format("~~~p~n", [E]);
do({input, E}) -> io:format("~p~n",[E]);
do([E|MoreEs]) ->
    do(E),
    do(MoreEs).

p1() -> do(["a", "b", "~a", "~b", "0"]).

p2() -> do(["a","~b"]), p2().

p3() ->
    case rand:uniform(2) of
        1 -> do(["a"]);
        2 -> do(["b"])
    end.

p4() ->
    case rand:uniform(2) of
        1 -> do(["a"]), p4();
        2 -> do(["b"])
    end.

p5() ->
    case rand:uniform(2) of
        1 -> do(["a"]), q5();
        2 -> do(["~b"])
    end.

q5() -> do(["~b"]), p5().

nil() -> ok.