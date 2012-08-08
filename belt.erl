-module(belt).
-export([say/0,add_one/1,fib/1,fac/1]).

% Message receiver
say() ->
  receive
    {place, Name} ->
      io:format("Saying ~s~n", [Name]),
      say()
  end.

% Add one to each element on a list
add_one([]) -> [];
add_one([H|T]) -> [H+1|add_one(T)].

% Fibonacci sequence
fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-2) + fib(N-1).

% Factorial
fac(1) -> 1;
fac(N) -> N * fac(N-1).
