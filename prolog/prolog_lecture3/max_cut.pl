/* not efficient  */

max(X,Y,Y):-  X  =<  Y.
max(X,Y,X):-  X>Y. 

/* with cut  */
max(X,Y,Y)  :-  X  =<  Y,!.
max(X,Y,X)  :-  X>Y. 
   
/* is second line redundant */

max(X,Y,Y)  :-  X  =<  Y,!.
max(X,Y,X). 

/* this version can go wrong with */
max(2,3,2). 


/* fix */
max(X,Y,Z)  :-  X  =<  Y,!,  Y  =  Z.
max(X,Y,X).    