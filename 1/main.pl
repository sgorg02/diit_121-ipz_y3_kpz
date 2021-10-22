% автор, название книги, год
written_by(herbert, 'Java 8').
written_by(herbert, 'C++: basic course').
written_by(herbert, 'C# 4.0: the definitive guide').
written_by(eric, 'Design patterns').
written_by(steve, 'Perfect code. Master Class').
written_by(steve, 'How much does a software project cost').

book('Java 8', 2015).
book('C++: basic course', 2012).
book('C# 4.0: the definitive guide', 2011).
book('Design patterns', 2011).
book('Perfect code. Master Class', 2004).
book('How much does a software project cost', 2007).

younger_boob_2010(Title) :-
    written_by(_, Title),
    book(Title, Year),
    Year > 2010.

book_write(Title, Year) :-
    written_by(_, Title),
    book(Title, Year).

:- write('-is there a book Java 8, 2014?'), 
    write('\n'), 
    (book_write('Java 8', 2014), 
    writeln('-yes'));
    write('-no').