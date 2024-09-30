
Unit baseUnit;

Interface

Uses crt, SysUtils;

Procedure initWord(w: String);

Implementation

Function init(w: String): string;

Var i: integer;
Begin
  For i:= 1 To length(w) Do
    Begin
      Write('_ ');
    End;
End;

Function findLetter(w: String; l: String): integer;

Var i, count: integer;
  positions: array Of integer;
Begin
  count := 1;
  For i:= 1 To length(w) Do
    Begin
      If w[i] = l Then
        Begin
          positions[count] := i;
        End;
    End;

  // findLetter := init(w);

  // For i:= 1 To length(positions) Do
  // Begin
  findLetter := positions[1];
  // End;
End;

Procedure initWord(w: String);

Var key: string;
Begin
  textcolor(white);
  WriteLn(init(w));
  Repeat
    WriteLn('');
    Write('write a letter: ');
    ReadLn(key);
    WriteLn(findLetter(w, key));
  Until key = '1';
End;

End.
