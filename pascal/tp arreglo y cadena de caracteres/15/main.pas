
Program main;

{$unitpath ../}

Uses unitVectorBaseStrings, crt, unit15string;

Const 
  nOp = 5;
  opciones: Array[1..nOp] Of string = ('Init', 'Words count', 'Vowel count',
                                       'White spaces', 'Exit');

Var 
  v: string;
  i, here: integer;
  key: Char;
Begin
  here := 1;
  Repeat
    clrscr;
    For i:= 1 To nOp Do
      Begin
        If i = here Then
          textcolor(white)
        Else
          textcolor(green);
        WriteLn(i, '. ', opciones[i]);
      End;
    key := ReadKey;

    If key = chr(0) Then
      Begin
        key := ReadKey;
        Case key Of 
          #72:
               Begin
                 If (here > 1) Then
                   here := here - 1
                 Else
                   here := nOp;
               End;
          #80:
               Begin
                 If (here < nOp) Then
                   here := here + 1
                 Else
                   here := 1;
               End;
        End;
      End
    Else
      If (key = chr(13)) Then
        Begin
          clrscr;
          Case here Of 
            1: init(v);
            2: wordsMoreThan10(v);
            3: show(v);
            Else
              Begin
                key := chr(5);
                textcolor(green);
                WriteLn('Goodbye!');
              End;
          End;
          readkey;
        End;
  Until key = chr(5);
End.
