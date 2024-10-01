
Program Ejerc8;

Uses crt, SysUtils;

Function checkWord(w: String): Boolean;

Begin
  If (Copy(w, 1, 2) = Copy(w, Length(w)-1, 2)) Then
    Begin
      checkWord := True;
    End
  Else
    checkWord := False;
End;

Var 
  w: string;
  key: Char;
Begin
  Repeat
    clrscr;
    Write('Write your word: ');
    ReadLn(w);
    If checkWord(w) Then
      Begin
        Write('The word ');
        textcolor(lightgreen);
        Write('starts');
        textcolor(white);
        Write(' and ends with the same two letters');
      End
    Else
      Begin
        Write('The word ');
        textcolor(red);
        Write('does not start');
        textcolor(white);
        Write(' and ends with the same two letters');
      End;
    key := ReadKey;
  Until key = #27;

End.
