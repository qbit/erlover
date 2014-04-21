![Pushover](https://pushover.net/assets/pushover-header-0f47af8e08d8bef658a999a9e6584fcc.png)

Send [pushover.net](http://pushover.net) notifications from Erlang

erlover Usage
=======

```erlang
erlover:send([
	{"token", "AAABBBCCCCDDDEEEFFF"},
	{"user", "AAABBBCCCCDDDEEFFFGGG"},
	{"message", "This is just a message!"},
	{"title", "Test Message"},
	{"sound", "spacealarm"}
]).
```
