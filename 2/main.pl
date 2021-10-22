:- ensure_loaded("facts.pl").

/*min(Name, b) :-
    book(Name, b), not((book(Name, b1), b1 < b)).*/

/*goal:-
    write('Book in biblioteck'), nl,
    book(a, b), nl.
:-goal.*/

cond(n):- writeln('Вывод закончен').
cond(X):- X = n.

goal:-
  write('Вывод элементов массива   a   '),  nl,
  repeat,
  mas(a,_,Elem),        			 /*1- readln(Name),     */
  write('Elem='), writeln(Elem),     /*2- write('Пpивет '),write(Name),*/
  writeln('Пpодолжим(y/n)'),
  get_char(Simv),get_char(_),
  cond(Simv).
:-goal.
