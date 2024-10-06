
Unit baseUnit;

Interface

Uses crt, SysUtils;

Procedure initWord(w: String);

Implementation

Function showWord(w: String): string;

Var i: byte;
Begin
  showWord := '';
  For i:= 1 To length(w) Do
    Begin
      showWord := showWord + w[i];
    End;
End;

Procedure init(Var w: String; l: integer);

Var i: byte;
Begin
  For i:= 1 To l Do
    Begin
      w[i] := '_';
    End;
End;

Procedure findLetter(w, l: String; Var hideW: String);

Var i: byte;
  positions: string;
Begin
  positions := '';
  For i:= 1 To length(w) Do
    Begin
      If w[i] = l Then
        Begin
          positions := positions + ' ' + inttostr(i);
        End;
    End;

  For i:= 1 To length(positions) Do
    Begin
      If (positions[i] <> ' ') Then
        hideW[strtoint(positions[i])] := w[strtoint(positions[i])];
    End;
End;

Procedure initWord(w: String);

Var key, hideW: string;
Begin
  textcolor(white);
  // init(hideW, Length(w));
  SetLength(hideW, SizeOf(w));
  FillChar(hideW, Length(w), '_');
  Repeat
    WriteLn(hideW);
    WriteLn('');
    Write('write a letter: ');
    // findLetter(w, key, hideW);
    // Write(showWord(hideW));
    ReadLn(key);
  Until key = '1';
End;

End.
