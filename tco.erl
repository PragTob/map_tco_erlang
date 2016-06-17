-module(tco).
-compile(export_all).

map_body([], _Func) -> [];
map_body([Head | Tail], Func) ->
  [Func(Head) | map_body(Tail, Func)].

map_reversed([], Acc, _Func) -> Acc;
map_reversed([Head | Tail], Acc, Func) ->
  map_reversed(Tail, [Func(Head) | Acc], Func).

map_tco(List, Func) -> lists:reverse(map_reversed(List, [], Func)).

benchmark() ->
  Succ = fun(X) -> X + 1 end,
  Data = lists:seq(1,1000000),
  io:fwrite("map_tco\n"),
  {Seconds1, _} = timer:tc(tco, map_reversed, [Data, [], Succ]),
  io:write(Seconds1),
  io:fwrite("\n"),
  {Seconds2, _} = timer:tc(tco, map_reversed, [Data, [], Succ]),
  io:write(Seconds2),
  io:fwrite("\n"),
  {Seconds3, _} = timer:tc(tco, map_reversed, [Data, [], Succ]),
  io:write(Seconds3),
  io:fwrite("\n"),
  {Seconds4, _} = timer:tc(tco, map_reversed, [Data, [], Succ]),
  io:write(Seconds4),
  io:fwrite("\n"),
  {Seconds5, _} = timer:tc(tco, map_reversed, [Data, [], Succ]),
  io:write(Seconds5),
  io:fwrite("\n"),
  io:fwrite("map_body\n"),
  {Secondsa1, _} = timer:tc(tco, map_body, [Data, Succ]),
  io:write(Secondsa1),
  io:fwrite("\n"),
  {Secondsa2, _} = timer:tc(tco, map_body, [Data, Succ]),
  io:write(Secondsa2),
  io:fwrite("\n"),
  {Secondsa3, _} = timer:tc(tco, map_body, [Data, Succ]),
  io:write(Secondsa3),
  io:fwrite("\n"),
  {Secondsa4, _} = timer:tc(tco, map_body, [Data, Succ]),
  io:write(Secondsa4),
  io:fwrite("\n"),
  {Secondsa5, _} = timer:tc(tco, map_body, [Data, Succ]),
  io:write(Secondsa5),
  io:fwrite("\n").
