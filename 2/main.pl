%book name, year
book('Java 8', 2015).
book('C++: basic course', 2012).
book('C# 4.0: the definitive guide', 2011).
book('Design patterns', 2011).
book('Perfect code. Master Class', 2004).
book('How much does a software project cost', 2007).

not_negative :- 
    book(Name, Val),
    Val>=2011, writeln(Name), 
    fail; true.


max(Name, Max) :- book(Name, Max), not((book(_,X), X > Max)), !.
min(Name, Min) :- book(Name, Min), not((book(_,X), X < Min)), !.
