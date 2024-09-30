
Program main;

{$unitpath ./adminPanel/; ./baseGame/}

Uses crt, adminUnit, baseUnit;

Const 
  nOp = 5;
  opciones: Array[1..nOp] Of string = ('Admin panel',
                                       'Words count', 'Vowel count',
                                       'White spaces', 'Exit');

Var 
  w: string;
  i, here: integer;
  key: Char;
Begin
  here := 1;
  Repeat
    clrscr;
    textcolor(white);
    WriteLn('--------------------------------');
    WriteLn('|                              |');
    WriteLn('|  Welcome to de HANGMAN game  |');
    WriteLn('|                              |');
    WriteLn('--------------------------------');
    writeln('');
    textcolor(lightgray);
    WriteLn('Choose an option:');
    writeln('');

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
            1: adminPanel(w);
            2: initWord(w);
            3: Write('3');
            Else
              Begin
                key := chr(5);
                textcolor(green);
                WriteLn('Thanks for playing. Goodbye!');
                writeln('');
                WriteLn('<------------------------------------------');
              End;
          End;
          readkey;
        End;
  Until key = chr(5);
End.
