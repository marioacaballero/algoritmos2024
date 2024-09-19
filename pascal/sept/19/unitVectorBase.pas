
Unit unitVectorBase;

Interface

Const 
  n = 7;

Type 
  dataType = real;
  vector = array[1..n] Of dataType;

Procedure init(Var v: vector);
Procedure charge(Var v: vector);
Procedure show(v: vector);


Implementation
Procedure init(Var v: vector);

Var 
  i: integer;

Begin
  For i:= 1 To n Do
    v[i] := 0;
End;

Procedure charge(Var v: vector);

Var 
  i: integer;

Begin
  For i:= 1 To n Do
    Begin
      write('position ', i, ': ');
      ReadLn(v[i]);
    End;
End;

Procedure show(v: vector);

Var 
  i: integer;

Begin
  write('vector: ');
  For i:= 1 To n Do
    Begin
      Write(v[i]:0:2, ' ');
    End;
End;

End.
