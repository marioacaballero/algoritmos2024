
Unit unit17Bus;

Interface
{$unitPath ../}

Uses unitVectorBaseTp;

Procedure chargeOnePosition(n: integer; name: String; Var v: vector);
Procedure showOnePosition(n: integer; v: vector);
Procedure deleteOnePosition(n: integer; Var v: vector);
Procedure showAll(n: integer; v: vector);

Implementation
Function chargePosition(n: integer; name: String; v: vector): string;
Begin
  If (n >= 0) And (n <= 45) Then
    Begin
      v[n] := name;
      chargePosition := 'Process complete';
    End;
End;

Procedure chargeOnePosition(n: integer; name: String; Var v: vector);
Begin
  WriteLn(chargePosition(n, name, v));
End;

Procedure showOnePosition(n: integer; v: vector);
Begin
  If (v[n] <> '') Then
    Begin
      writeLn('Position ', n, ' with: ', v[n]);
    End
  Else
    Begin
      writeLn('Position ', n, ' is empty');
    End;
End;

Procedure deleteOnePosition(n: integer; Var v: vector);
Begin
  writeLn(chargePosition(n, '', v));
End;

Procedure showAll(n: integer; v: vector);

Var 
  i: integer;
Begin
  WriteLn('The bus has the following passengers:');
  For i:= 1 To n Do
    Begin
      If (v[i] <> '') Then
        Begin
          WriteLn('- Position ', i, ': ', v[i]);
        End
      Else
        Begin
          WriteLn('- Position ', i, ': empty');
        End;
    End;
End;

End.
