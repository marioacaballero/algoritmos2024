// Sumar un escalar a los 6 elementos enteros almacenados en un vector 

Unit unitEjerciseA;

Interface
Procedure sumarEscalar();

Type 
  vector = array[1..6] Of integer;

Var 
  i, val, escalar: integer;
  v: vector;

Implementation

Procedure sumarEscalar();
Begin
  Writeln('Ingrese el vector');
  For i := 1 To 6 Do
    Begin
      Write('posicion ', i, ': ');
      Read(val);
      v[i] := val;
    End;

  WriteLn('Ingrese el escalar a sumar: ');
  Read(escalar);

  For i := 1 To 6 Do
    Begin
      v[i] := v[i] + escalar;
    End;

  Write('El vector resultante es: [');
  For i := 1 To 6 Do
    Begin
      Write(v[i], ', ');
    End;

  Write(']');
End;
End.
