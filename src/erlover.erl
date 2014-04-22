%%%-----------------------
%%% @author Aaron Bieber <deftly@gmail.com>
%%% @copyright 2014
%%% @doc Basic library to send pushover.net notifications 
%%%   from erlang.
%%% @end
%%%-----------------------

-module(erlover).

%% API
-export([send/3, send/1]).

%% @doc Sends a notification that is passed in as a proplist that contains
%%    at least: token, user and message properties.
%% @spec send(M::proplist()) -> {ok, Result}
%% @end
send(M) ->
    %% Thanks to @choptastic for the help with this bit!
    St = [K ++ "=" ++ V || {K, V} <- M],
    post(string:join(St, "&")).

%% @doc Sends a notification to Token for User. Parts must contain
%%    at least: the message property.
%% @spec send(Token::string(), User::string(), Parts::proplist()) -> {ok, Result}
%% @end
send(Token, User, Parts) ->
    Nl = lists:append([{"token", Token}, {"user", User}], Parts),
    send(Nl).

%% @TODO make multi users work.

post(Body) -> httpc:request(post, {"https://api.pushover.net/1/messages.json", [], "application/x-www-form-urlencoded", Body}, [], []).
