%%%-------------------------------------------------------------------
%%% @author radoslaw
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Feb 2023 15:58
%%%-------------------------------------------------------------------
-module(my_first_module).

%% API
-export([my_first_function/0, f1/1, factorial/1, power/2]).

my_first_function () -> 23 + my_second_function().

my_second_function () -> 34.

f1 (Z) -> Z ++ Z.

factorial(1) -> 1;
factorial(V) -> V * factorial(V - 1).


power(_, 0) -> 1;
power(A, B) -> A * power(A, B - 1).
