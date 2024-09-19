

//  b– Realizar la suma de dos vectores de 10 elementos posición a posición y devolver el resultado en un tercer  vector

Unit unitEjerciseB;

Interface
Procedure sumVectors();

Type 
  vector = array[1..10] Of integer;

Var 
  vector1, vector2, vector3: vector;
  i: integer;

Implementation

Procedure sumVectors();
Begin
  writeLn('Ingrese primer vector: ');
  For i:=1 To 10 Do
    Begin
      write('posicion ', i, ': ');
      read(vector1[i]);
    End;

  writeLn('Ingrese segundo vector: ');
  For i:=1 To 10 Do
    Begin
      write('posicion ', i, ': ');
      read(vector2[i]);
    End;

  WriteLn('Resultado de la suma de los vectores: ');
  For i:=1 To 10 Do
    Begin
      vector3[i] := vector1[i] + vector2[i];
    End;

  write('Resultado de la suma de los vectores: [');
  For i:=1 To 10 Do
    Begin
      write(vector3[i], ', ');
    End;
  Write(']');

End;

End.
