docs:
	erl -noshell -run edoc_run application "'$(APP_NAME)'" \
		'"."' '[{def,{vsn,"$(VSN)"}}]'
