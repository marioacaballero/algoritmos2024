
Unit unitVectorBaseTp;

Interface

Type 
  dataType = integer;
  vector = array Of dataType;

Procedure init(n: integer; Var v: vector);
Procedure charge(n: integer; Var v: vector);
Procedure show(n: integer; v: vector);


Implementation
Procedure init(n: integer; Var v: vector);

Var 
  i: integer;

Begin
  For i:= 1 To n Do
    Begin
      v[i] := 0;
    End;

  WriteLn('Vector initialized, press any key to continue');
End;

Procedure charge(n: integer; Var v: vector);

Var 
  i: integer;

Begin
  For i:= 1 To n Do
    Begin
      write('position ', i, ': ');
      ReadLn(v[i]);
    End;
  WriteLn('Vector charged, press any key to continue');
End;

Procedure show(n: integer; v: vector);

Var 
  i: integer;

Begin
  write('vector: [ ');
  For i:= 1 To n - 1 Do
    Begin
      Write(v[i], ', ');
    End;
  Write(v[n], ' ]');
End;

End.
