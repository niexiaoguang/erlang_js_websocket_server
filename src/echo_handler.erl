-module(echo_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	io:format("~p : req \n",[Req0]),
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Echo!">>,
        Req0),
	{ok, Req, State}.
