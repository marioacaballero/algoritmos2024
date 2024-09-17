
Unit unit13;

Interface

Function  Divisionentera(a, b: integer): integer;

Implementation

Function  Divisionentera(a, b: integer): integer;
Begin
  If b = 0 Then
    Begin
      writeln('la división por 0 no está definida');
    End;

  Divisionentera := trunc(a / b);
End;
End.
