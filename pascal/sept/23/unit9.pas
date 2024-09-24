
Unit unit9;

Interface

Uses unitVectorBase;

Procedure youngsPeoples(v: vector);

Implementation
Function total(v: vector): integer;

Var 
  i: integer;
Begin
  total := 0;
  For i := 1 To n Do
    Begin
      If (v[i] >= 20) And (v[i] <= 40) Then
        total := total + 1;
    End;

End;

Procedure youngsPeoples(v: vector);
Begin
  WriteLn('Youngs people: ', total(v));
End;

End.
