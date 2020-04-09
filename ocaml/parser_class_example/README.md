# Lexer and Parser for the lecture example
Write a lexer and parser for the Context Free Gramer
```
E->id=n|{L}
L->E;L|e
```
![Parser ](example.jpg)


## Parser generates the following parse tree

![Parser ](parsetree.jpg)


## How to run
```
dune build bin/main.exe

_build/defult/bin/main.exe

xdot parsetree.dot
```
