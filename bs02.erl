-module(bs02).
-export ([words/1]).

words(BinText) ->
	lists:reverse(words(BinText, [<<>>])).

words(<<>>, Acc) ->
	Acc;

words(<<" ", Rest/binary>>, Acc) ->
	words(Rest, [<<>> | Acc]);

words(<<Symbol, Rest/binary>>, [Word | T]) ->
	words(Rest, [<<Word/binary, Symbol>> | T]).