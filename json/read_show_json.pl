/*
* from swipl shell:
* ?- use_module(library(http/json)).
* true.
*
* ?- open('example.json',read,X),json_read_dict(X,Result),write(Result.key1.subkey1),close(X).
* 123
* X = <stream>(0x858b4e8),
* Result = _G197{key1:_G124{subkey1:123}, key2:[_G160{'subkey2-1':"value of subkey21-1", 'subkey2-2':"value of subkey22-1", 'subkey2-3':"value of subkey23-1"}, _G189{'subkey2-1':"value of subkey21-2", 'subkey2-2':"value of subkey22-2", 'subkey2-3':"value of subkey23-2"}]}.
*
*/ 

:- use_module(library(http/json)).

get_array_value(Array,Start) :-
	proper_length(Array,Jumlah),
	Start is 0,
	(Start < Jumlah -> (nth0(Start,Array,ArrayKey), write(ArrayKey.subkey21),nl,write(ArrayKey.subkey22),nl,write(ArrayKey.subkey23),nl, Newstart is Start + 1, get_array_value(Array,Newstart));!).

read_show_json :- 
	open('example.json',read,X),
	json_read_dict(X, Result),
	close(X),
	write(Result.key1.subkey1),
	get_array_value(Result.key2,0).

:- read_show_json.
:- halt.
