eview:-student(FIO, B, A, G),
writef('%32L|%11L|%11L|%3R\n', [FIO,B,A,G]), fail, true.

delete:-write("Enter group: "),
read(G), 
write("Enter FIO: "),
read(N),
retract(student(N, _, _, G)).

readfile:-consult('data.txt').

writefile:-tell('data.txt'),listing(student), told.

findbygroup:-write("Enter group to find stdudents: "),
read(G), writeln(G),
student(FIO,_,_, G),
writeln(FIO-G), fail; true.

menu:- repeat, 
writef('
  1-read db from file,\n
  2-save db to file,\n
  3-review db,\n
  4-add new student to db,\n
  5-delete student from db by name and group,\n
  6-check students by class\n
  '), read(Ch), 
  menuitem(Ch), Ch = 0.
menuitem(1):-readfile.
menuitem(2):-writefile.
menuitem(3):-review.
menuitem(4):-add.
menuitem(5):-delete.
menuitem(6):-findbygroup.
menuitem(0).

:-menu.