
Program ejercise14;

Uses unit14;

Var 
  a,b: integer;
Begin
  writeln('Ingrese el dividendo');
  readln(a);

  writeln('Ingrese el divisor');
  readln(b);

  writeln('El resto de la división entera es: ',  DivisionResto(a,b));
End.
