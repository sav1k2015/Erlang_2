split (BinStr,Div) ->
	BinDiv = list_to_binary(Div),
	Size = byte_size(Div),
	split(BinStr,BinDiv,Size,<<>>,[]).
split(BinStr,Div,Size,Word,Acc) ->
	case BinStr of
		<<Div: Size/binary, Rest/binary>> ->
			split(Rest,Div,Size,<<>>,[Word|Acc]);
		<<X,Rest/binary>>->
			split(Rest,Div,Size<<Word/binary,X>>,Acc);
		<<>> ->
			reverse([Word|Acc])
	end