
Unit unit14;

Interface

Function DivisionResto(a, b: integer): integer;

Implementation

Function DivisionResto(a, b: integer): integer;
Begin
  If b = 0 Then
    Begin
      WriteLn(
 'La división por 0 no está definida, por lo tanto el resto no está definido'
      );

    End;
  DivisionResto := a - (b * Trunc(a/b));
End;

End.
