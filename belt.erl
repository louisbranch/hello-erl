-module(belt).
-export([say/0,add_one/1,fib/1,fac/1,sum/1, len/1, avg/1, even/1]).

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

% Average of a list
avg([]) -> 0;
avg(L) -> sum(L) div len(L).

% Sum of elements on a list
sum([]) -> 0;
sum([H|T]) -> H + sum(T).

% Slow implementation of BIF length
len([]) -> 0;
len([_|T]) -> 1 + len(T).

% Select even numbers
even([]) -> [];
even([H|T]) when H rem 2 == 0 -> [H|even(T)];
even([_|T]) -> even(T).
