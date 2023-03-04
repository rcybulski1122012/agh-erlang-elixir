%%%-------------------------------------------------------------------
%%% @author radoslaw
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2023 13:10
%%%-------------------------------------------------------------------
-module(onp).
-author("radoslaw").

%% API
-export([onp/1]).

%% 1 + 2 * 3 - 4 / 5 + 6 -> 1 2 3 * + 4 5 / - 6 +
%% 1 + 2 + 3 + 4 + 5 + 6 * 7 -> 1 2 + 3 + 4 + 5 + 6 7 * +
%% ( (4 + 7) / 3 ) * (2 - 19) -> 4 7 + 3 / 2 19 - *
%% 17 * (31 + 4) / ( (26 - 15) * 2 - 22 ) - 1 -> 17 31 4 + * 26 15 - 2 * 22 - / 1


onp(Expr) -> onp(string:tokens(Expr, " "), []).
onp(["+" | Tokens], [Second, First | Tail]) -> onp(Tokens, [First + Second | Tail]);
onp(["-" | Tokens], [Second, First | Tail]) -> onp(Tokens, [First - Second | Tail]);
onp(["*" | Tokens], [Second, First | Tail]) -> onp(Tokens, [First * Second | Tail]);
onp(["/" | _Tokens], [0 | _Tail]) -> io:format("Cannot divide by 0");
onp(["/" | Tokens], [Second, First | Tail]) -> onp(Tokens, [First / Second | Tail]);
onp(["sqrt" | Tokens], [Value | Tail]) -> onp(Tokens, [math:sqrt(Value) | Tail]);
onp(["pow" | Tokens], [Second, First | Tail]) -> onp(Tokens, [math:pow(First, Second) | Tail]);
onp(["sin" | Tokens], [Value | Tail]) -> onp(Tokens, [math:sin(Value) | Tail]);
onp(["cos" | Tokens], [Value, Tail]) -> onp(Tokens, [math:cos(Value) | Tail]);
onp(["tg" | Tokens], [Value, Tail]) -> onp(Tokens, [math:tan(Value) | Tail]);
onp(["ctg" | Tokens], [Value, Tail]) -> onp(Tokens, [1/math:tan(Value) | Tail]);
onp([Number | Tokens], Stack) -> onp(Tokens, [ element(1, string:to_float(Number)) | Stack]);
onp([], [Result]) -> Result.