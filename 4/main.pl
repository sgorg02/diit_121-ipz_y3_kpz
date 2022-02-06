%  Списки
% Рекурсивна структура
% Список - [Голова | Хвіст] Хвіст- список , Голова- перший елемент
%          [] - пустий список
% [1,2,3]
% [a,b,1,2,[1,2],1+2]

% Список - структурований терм із спрощеним записом
% Список - дерево
% [1,2,3]
%    |
%   1  |
%     2  |
%       3 []
%
% 5.Распечатать положительные элементы списка, если они больше заданного числа
printPositiveVal([], X).
printPositiveVal([Head|Tail], X) :- Head>X, X1 is Head, writeln(X1), printPositiveVal(Tail, X).
printPositiveVal([Head|Tail], X) :- Head=<X, printPositiveVal(Tail, X).

%  Автомати
%Детерміновані - кожен перехід передбачено умовами
%Недетерміновані - наступний перехід неоднозначний

%Недетермінований Кінцевий автомат для синтаксичного аналізу
%вхід це рядок символів, вихів- відповідність заданому синтаксису

%   Приклад
% L={(a|d)m1(2-b)n ; (b+cp)m}. m>0,  n>0,  p>0 .
% a-z, 0-9, +, - ,*  - термінали
% ;, | - або
% a^n - повтори сиволів, дужки для групування

% Представити синтакис графом, на дугах термінали

:- discontiguous edge/3, edge/2.

%3. L={(a|d)m1(2- 21b)n; (a-1)n+(b-c)m}. m>0,  n>0.
%5.	L={(d-w)m(4p+ 3b)n; (b+c+d)m}. m>0,  n>0,  p>0 .

edge(q0, q1, a).
edge(q1, q1, a).
edge(q0, q1, d).
edge(q1, q1, d).
edge(q1, q3, '1').
edge(q3, q4, '2').
edge(q4, q5, -).
edge(q5, q6, '2').
edge(q6, q7, '1').
edge(q7, q3, b).
edge(q7, q15, b).

edge(q0, q8).
edge(q8, q9, a).
edge(q9, q10, -).
edge(q10, q8, '1').
edge(q10, q11, '1').
edge(q11, q12, +).
edge(q12, q13, b).
edge(q13, q14, -).
edge(q14, q12, c).
edge(q14, q15, c).

finish(q15).
%перевірка рядка символів
%list, state
accept([],State) :- finish(State).
accept([Char|Tail], State) :-
             edge(State, NewState, Char),
             accept(Tail, NewState).
accept(List, State) :-
             edge(State, NewState),
             accept(List, NewState).
             
%accept дозволяє перевірити або знайти рядки які задовільняють синтаксису
% ?- length(X, 10), accept(X, s0), writeln(X), fail.
% [d,d,d,1,2,-,b,2,-,b]
% [d,d,d,d,d,d,1,2,-,b]
% [d,d,d,d,d,a,1,2,-,b]
% [d,d,d,d,a,d,1,2,-,b]
%        .....
% 

%запуск синтаксичного розбору
start:-
     write('enter string:'), get_string(Str),
     atom_chars(Str, Chars),
     accept(Chars, q0), writeln(accepted),!;
     writeln(not-accepted).
     
%%вести рядок до Enter
get_string(S):- get_char(Ch), Ch\='\n', get_string(S1),
                atom_concat(Ch, S1, S),!.
get_string('').

%удвоить все вхождения элементов первого типа в список;
%%doubleFirstType([1,2,3,a,b], X).
doubleFirstType([Head|Tail], Result) :- doubleFirstTypeList(Head, [Head|Tail], Result).

doubleFirstTypeList(_, [], []).
doubleFirstTypeList(First, [Head|Tail], [Head,Head|Tail2]) :- equalType(First, Head), doubleFirstTypeList(First, Tail, Tail2).
doubleFirstTypeList(First, [Head|Tail], [Head|Tail2]) :- not(equalType(First, Head)), doubleFirstTypeList(First, Tail, Tail2).

equalType(A, B) :- number(A), number(B).
equalType(A, B) :- atom(A), atom(B).
equalType(A, B) :- compound(A), compound(B).
