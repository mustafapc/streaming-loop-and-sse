-module(cowboy2_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/stream", stream_handler, []}, {"/html", html_handler, []}, {"/sse", sse_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    cowboy2_sup:start_link().

stop(_State) ->
	ok.
