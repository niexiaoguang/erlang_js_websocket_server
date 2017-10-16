-module(ws_handler).
-behavior(cowboy_handler).

-export([init/2]).
-export([websocket_init/1]).
-export([websocket_handle/2]).
-export([websocket_info/2]).

init(Req, State) ->
	io:format("~p : req \n",[Req]),

	{cowboy_websocket,Req,State}.

	% handle Websocket subprotocols ============================
	% case cowboy_req:parse_header(<<"sec-websocket-protocol">>, Req) of
 %        undefined ->
 %            {cowboy_websocket, Req, State,#{idle_timeout => 300000}};
 %        Subprotocols ->
 %            case lists:keymember(<<"mqtt">>, 1, Subprotocols) of
 %                true ->
 %                    Req1 = cowboy_req:set_resp_header(<<"sec-websocket-protocol">>,
 %                        <<"mqtt">>, Req),
 %                    {cowboy_websocket, Req1, State,#{idle_timeout => 300000}};
 %                false ->
 %                    {stop, Req, State}
 %            end
 %    end.


websocket_init(State) ->
	io:format("ws state is ~p \n",[State]),
	% erlang:start_timer(3000,self(),<<"Hello!">>),
	% {reply,{text,<<"Hello again!">>},State},
	% {reply, [
 %        {text, "Hello text"},
 %        {text, <<"world binary text">>},
 %        {binary, <<0:8000>>}
 %    ], State,hibernate}.
 	{ok,State,hibernate}.

websocket_handle({text,Text},State) ->
	io:format("frame is ~p \n",[Text]),
	{reply,{text,<<"hi there">>},State,hibernate};
websocket_handle(_Frame,State) ->
	{ok,State,hibernate}.


% for websocket_info/2
websocket_info({log,Text},State) ->
	{reply,{text,Text},State};
websocket_info(_Info,State) ->
	{ok,State}.











 %    Req = cowboy_req:reply(200,
 %        #{<<"content-type">> => <<"text/plain">>},
 %        <<"Hello Erlang!">>,
 %        Req0),
	% {ok, Req, State}.
