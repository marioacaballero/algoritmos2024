
Unit unit17Bus;

Interface
{$unitPath ../}

Uses unitVectorBaseTp;

Procedure chargeOnePosition(Var v: vector);
Procedure showOnePosition(v: vector);
Procedure deleteOnePosition(Var v: vector);
Procedure showAll(n: integer; v: vector);

Implementation
Function chargePosition(name: String; v: vector): string;

Var 
  position: integer;
Begin
  Write('Enter the position: ');
  ReadLn(position);
  If (position >= 0) And (position <= 45) Then
    Begin
      v[position] := name;
      chargePosition := 'Process complete';
    End;
End;

Procedure chargeOnePosition(Var v: vector);

Var 
  name: String;
Begin
  Write('Enter the name: ');
  ReadLn(name);
  WriteLn(chargePosition(name, v));
End;

Procedure showOnePosition(v: vector);

Var 
  position: integer;
Begin
  Write('Enter the position: ');
  ReadLn(position);
  If (v[position] <> '') Then
    Begin
      writeLn('Position ', position, ' with: ', v[position]);
    End
  Else
    Begin
      writeLn('Position ', position, ' is empty');
    End;
End;

Procedure deleteOnePosition(Var v: vector);

Var 
  position: integer;
Begin
  Write('Enter the position: ');
  ReadLn(position);
  writeLn(chargePosition('', v));
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
