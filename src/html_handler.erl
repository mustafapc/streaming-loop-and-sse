-module(html_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
	Req2 = cowboy_req:reply(200, #{<<"content-type">> => <<"text/html">>}, ["<html>
    <head>
    <title> website </title>
    <script src=\"https://unpkg.com/htmx.org@2.0.3\" integrity=\"sha384-0895/pl2MU10Hqc6jd4RvrthNlDiE9U1tWmX7WRESftEDRosgxNsQG/Ze9YMRzHq\" crossorigin=\"anonymous\"></script>
    <script src=\"https://unpkg.com/htmx-ext-sse@2.2.2/sse.js\"></script>
    </head>
<body>
    <div hx-ext=\"sse\" sse-connect=\"http://localhost:8080/sse\" sse-swap=\"ok\">hi</div>
</body>
</html>"], Req),
	{ok, Req2, State}.
