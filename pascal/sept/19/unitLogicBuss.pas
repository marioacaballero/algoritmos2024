
Unit unitLogicBuss;

Interface

Uses unitVectorBase;

Procedure total(v: vector);
Procedure ask(v: vector);
Procedure reorder(Var v: vector);

Implementation
Function totalCalc(v: vector): real;

Var 
  i: integer;
  total: real;
Begin
  total := 0;
  For i := 1 To n Do
    Begin
      total := total + v[i];
    End;
End;

Procedure total(v: vector);
Begin
  WriteLn('Total: ', totalCalc(v): 0: 2);
End;

Procedure ask(v: vector);

Var i: integer;
Begin
  write(
'What day of the week do you want to know? 1. sunday, 2. monday, .., 7. saturday: '
  );
  Read(i);
  WriteLn('Day ', i, ': ', v[i]:0:2);
End;

Procedure reorder(Var v: vector);

Var 
  i: integer;
  v2: vector;
  aux, aux2: real;
Begin
  // For i := 1 To n Do
  //   Begin
  //     v2[i] := v[i];
  //   End;
  // For i := 1 To n - 1 Do
  //   Begin
  //     v[i + 1] := v2[i];
  //   End;
  // v[1] := v2[n];
  aux2 := v[n];
  For i:= 1 To n Do
    Begin
      aux := v[i];
      v[i] := aux2;
      aux2 := aux;
    End;
End;
End.
