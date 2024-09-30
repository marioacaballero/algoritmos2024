
Unit initUnit;

Interface

Uses crt;

Procedure initWord(Var w: String);
Procedure showWord(w: String);
Procedure letterCount(w: String);

Implementation

Function countLetters(w: String): Integer;

Var i: integer;
Begin
  countLetters := 0;
  For i:= 1 To length(w) Do
    Begin
      countLetters := countLetters + 1;
    End;
End;

Procedure initWord(Var w: String);
Begin
  Write('Enter the word to configuration de game: ');
  textcolor(white);
  ReadLn(w);
  textcolor(lightgreen);
  WriteLn('');
  WriteLn('The word has been configured, press any key to back...');
End;

Procedure showWord(w: String);
Begin
  Write('The word is: ');
  textcolor(white);
  WriteLn(w);
  textcolor(lightgreen);
  WriteLn('');
  WriteLn('Press any key to back...');
End;

Procedure letterCount(w: String);
Begin
  Write('The word has ');
  textcolor(white);
  WriteLn(countLetters(w));
  textcolor(lightgreen);
  WriteLn('');
  WriteLn('Press any key to back...');
End;

End.
