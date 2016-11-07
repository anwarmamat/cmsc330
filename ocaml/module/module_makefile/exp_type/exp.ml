module type Exp =
  sig

    type var

    type exp
      
    type token

    val token2str: token->string

  end;;

module Exp =
  struct
    type var = string

    type exp =
              Var of var
              | Lam of var * exp
              | App of exp * exp

    type token =
         | LPAREN
         | RPAREN
         | EOL
         | DOT
         | APP
         | LAMBDA
         | VAR
         | ID of (char)


                
    let token2str (x:token):string = match x with
                |LPAREN->"("
                | RPAREN->")"
                | EOL->"\n"
                | DOT ->"."
                | APP->"App"
                | LAMBDA ->"L"
                | VAR ->"Var"
                | ID x->String.make 1 x

  end;;
  
