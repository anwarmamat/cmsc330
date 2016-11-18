parse(L) :- start(S), 
                trans(S,L).

    trans(X,[A|B]) :- 
          delta(X,A,Y),   /*  X ---A---> Y */
          write(X),
          write('  '),
          write([A|B]),
          nl,
          trans(Y,B).  
    trans(X,[]) :- 
          final(X),
          write(X),
          write('  '),
          write([]), nl.

%As an example, the following Prolog code specifies a
% state table for a DFA that accepts the language 
% a*b(a*ba*b)*.
% odd number of b's
 
    delta(0,a,0).   
    delta(0,b,1).
    delta(1,a,1).
    delta(1,b,0).
     
    start(0).

    final(1).

%parse([b,b,a,a,b,a,b]).
%parse([b,b,a]).
