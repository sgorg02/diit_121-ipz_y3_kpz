:- dynamic family/4.
%:- multifile stud/4.

family(mother, father, sister, brother).

add:-
  write("Enter name mother: "), read(FIO),
  write("Enter name father: "), read(B),
  write("Enter name sister: "), read(A),
  write("Enter name brother: "), read(G),
  assert(family(FIO, B, A, G)).


review:-
  family(M, F, S, B),
  writef('%11L|%11L|%11L|%3R\n', [M, F, S, B]), fail, true.

delete:-
  write("Enter name mother: "), read(N), 
  write("Enter name father: "), read(G),
  retract(family(N, G, _, _)).

readfile:-
  consult('data.pl').

writefile:-
  tell('data.pl'), listing(family), told.

%findbygroup:-
  %write("Enter group to find stdudents: "), read(G), 
  %writeln(G), student(FIO,_,_, G),
  %writeln(FIO-G), fail; true.

menu:- 
  repeat, 
  writef('
    1-read db from file,\n
    2-save db to file,\n
    3-review db,\n
    4-add new family to db,\n
    5-delete family from db by mother and father,\n
    '), read(Ch), 
    menuitem(Ch), Ch = 0.

menuitem(1):-readfile.
menuitem(2):-writefile.
menuitem(3):-review.
menuitem(4):-add.
menuitem(5):-delete.
menuitem(0).

:-menu.