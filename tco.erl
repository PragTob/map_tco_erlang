-module(tco).
-compile(export_all).

map_body([], _Func) -> [];
map_body([Head | Tail], Func) ->
  [Func(Head) | map_body(Tail, Func)].

map_reversed([], Acc, _Func) -> Acc;
map_reversed([Head | Tail], Acc, Func) ->
  map_reversed(Tail, [Func(Head) | Acc], Func).

map_tco(List, Func) -> lists:reverse(map_reversed(List, [], Func)).
