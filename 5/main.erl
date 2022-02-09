-module main.
-compile([export_all]).
-export([print_hello/0])

print_hello()->
    io:fwrite("Hello!!!!").

%Lr 1 Erlang 
%-module file5.
%-compile([export_all]).
%-export([print_hello/0, print/0]).

%print_hello()->io:fwrite("Ok let`s go!").
%print()->aboba.
%Соединить списки из N и M элементов (за 1-ым следуют элементы второго).
%%Конкатенація списків append
%app([],Sec,Sec).
%app([H|T],Sec,[H|Tres]) :- app(T,Sec,Tres).
%app([],Sec)->Sec;
%app([H|T], Sec)->[H|app(T, Sec)].

%Из двух входных списков а и b получить третий содержащий кортежи из пар { а(i) , b(i) }
%appendListToCortege([],[],[]).
%appendListToCortege([Head|Tail],[Head1|Tail],[])->
%appCortege([],[])->[];
%appCortege([],[H|T])->[{H}|appCortege([],T)];
%appCortege([H|T], [])->[{H}|appCortege(T, [])];
%appCortege([H|T],[H1|T1])->[{H,H1}|appCortege(T,T1)].
