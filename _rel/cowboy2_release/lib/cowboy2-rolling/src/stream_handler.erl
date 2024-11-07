-module(stream_handler).
-behavior(cowboy_handler).

-export([init/2, info/3, recurse/3]).

init(Req, State) ->
    Req2 = cowboy_req:stream_reply(200,#{<<"content-type">> => <<"text/event-stream">>}, Req),
	recurse("100", Req2, State),
    {cowboy_loop, Req2, State}.

info({event, Data, eof}, Req, State) ->
	cowboy_req:stream_body(Data, fin, Req),
    {stop, Req, State};
info({event, Data}, Req, State) ->
    cowboy_req:stream_body(Data, nofin, Req),
    {ok, Req, State};
info(_Msg, Req, State) ->
    {ok, Req, State}.
recurse(X, Req, State) ->
	{B, _Rest} = string:to_integer(X),
	if
	B > 1 ->info({event, ["event: ok\ndata: <div hx-ext=\"sse\" sse-connect=\"http://localhost:8080/stream\" sse-swap=\"ok\">", integer_to_list(B), "</div>\n\n"]}, Req, State),
	A = B - 1,
	timer:sleep(1000),
	recurse(integer_to_list(A), Req, State);
	true -> info({event, ["event: ok\ndata: <div hx-ext=\"sse\" sse-connect=\"http://localhost:8080/stream\" sse-swap=\"ok\">finally this is the end of the stream</div>\n\n"], eof}, Req, State)
	end.