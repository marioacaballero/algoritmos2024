
Unit unit7;

Interface

Uses unitVectorBase;

Procedure minValue(v: vector);
Procedure askTotal(v: vector);

Implementation
Function min(v: vector): integer;

Var 
  i: integer;
Begin
  min := v[1];
  For i := 1 To n Do
    Begin
      If (v[i] < min) Then
        min := v[i];
    End;

End;

Function totalMin (v: vector; min: integer): integer;

Var 
  i: integer;
Begin
  totalMin := 0;
  For i:= 1 To n Do
    Begin
      If v[i] = min Then
        totalMin := totalMin + 1;
    End;
End;

Procedure minValue(v: vector);
Begin
  WriteLn('Min Value: ', min(v));
End;

Procedure askTotal(v: vector);
Begin
  WriteLn('Total: ', totalMin(v, min(v)));
End;

End.
