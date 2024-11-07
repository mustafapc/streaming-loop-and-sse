-module(sse_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
	Req2 = cowboy_req:reply(200, #{<<"content-type">> => <<"text/event-stream">>}, ["event: ok\ndata: <div hx-ext=\"sse\" sse-connect=\"http://localhost:8080/sse\" sse-swap=\"message\">this is sse mate</div>\n\n"], Req),
	{ok, Req2, State}.
