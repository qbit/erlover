-module(erlover).

-export([send/3, send/1]).

send(M) ->
    %% Thanks to @choptastic for the help with this bit!
    St = [K ++ "=" ++ V || {K, V} <- M],
    post(string:join(St, "&")).

send(Token, User, Parts) ->
    Nl = lists:append([{"token", Token}, {"user", User}], Parts),
    send(Nl).

post(Body) -> httpc:request(post, {"https://api.pushover.net/1/messages.json", [], "application/x-www-form-urlencoded", Body}, [], []).
