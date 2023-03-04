%%%-------------------------------------------------------------------
%%% @author radoslaw
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Feb 2023 16:20
%%%-------------------------------------------------------------------
-module(my_lists).
-author("radoslaw").

%% API
-export([contains/2, duplicate_elements/1, sum_floats/1]).

contains([], _) -> false;
contains([Value | _], Value) -> true;
contains([_Head | Tail], Value) -> contains(Tail, Value).

duplicate_elements([]) -> [];
duplicate_elements([Head | Tail]) -> [Head, Head] ++ duplicate_elements(Tail).


%%sum_floats([]) -> 0;
%%sum_floats([Head | Tail]) -> Head + sum_floats(Tail).

sum_floats(List) -> sum_floats(List, 0).
sum_floats([Head | Tail], Sum) -> sum_floats(Tail, Head + Sum);
sum_floats([], Sum) -> Sum.
