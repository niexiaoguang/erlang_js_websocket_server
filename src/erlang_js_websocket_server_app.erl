-module(erlang_js_websocket_server_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->

    Dispatch = cowboy_router:compile([
        {'_', [
                {"/echo", echo_handler, []},
                {"/ws", ws_handler,[]}
               ]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 9000}],
        #{env => #{dispatch => Dispatch}}
    ),
	erlang_js_websocket_server_sup:start_link().

stop(_State) ->
	ok.
