
Unit unit15string;

Interface
{$unitpath ../}

Uses unitVectorBaseStrings;

Procedure wordsMoreThan10 (v: String);

Implementation
Function words10Count(v: String): integer;

Var 
  i, count, words: integer;
Begin
  words := 0;
  count := 0;
  For i:= 1 To Length(v) - 1 Do
    Begin
      If (v[i] <> ' ') Then
        Begin
          count := count + 1;
        End
      Else
        Begin
          If (count >= 10) Then
            Begin
              words := words + 1;
              count := 0;
            End
          Else
            count := 0;
        End;
    End;
  If (count >= 10) Then
    Begin
      words10Count := words + 1;
    End
  Else
    words10Count := words;
End;

Procedure wordsMoreThan10 (v: String);
Begin
  WriteLn('The words with 10 or more letters are: ', words10Count(v))
End;

End.
