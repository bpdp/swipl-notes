% ex: images will be served by /assets/images/file.jpg
%
% execute with:
% swipl
% ?- consult(static_resources).
% ?- server(8080).
%
% then browse to http://localhost:8080/assets/images/logo3.png

:- use_module(library(http/http_server_files)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_path)).
:- multifile user:file_search_path/2.

http:location(assets, root(assets), []).

user:file_search_path(assets_root, 'assets').
user:file_search_path(assets, assets_root(.)).

:- http_handler(assets(.), serve_files_in_directory(assets), [prefix]).

server(Port) :- 
	http_server(http_dispatch, [port(Port)]).
