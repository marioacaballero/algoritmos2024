
Unit adminUnit;

Interface

{$unitpath ./}

Uses crt, initUnit;

Const 
  nAdmOp = 4;
  opciones: Array[1..nAdmOp] Of string = ('Enter the word config',
                                          'Show the word', 'Letter count',
                                          'Exit');

Procedure adminPanel(Var w: String);

Implementation

Procedure adminPanel(Var w: String);

Var 
  i, here: integer;
  key: Char;

Begin
  here := 1;
  Repeat
    clrscr;
    textcolor(blue);
    WriteLn('--------------------------------');
    WriteLn('|                              |');
    WriteLn('|         ADMIN  PANEL         |');
    WriteLn('|                              |');
    WriteLn('--------------------------------');
    writeln('');
    textcolor(lightgray);
    WriteLn('Choose an option:');
    writeln('');
    For i:= 1 To nAdmOp Do
      Begin
        If i = here Then
          textcolor(yellow)
        Else
          textcolor(LightBlue);
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
                   here := nAdmOp;
               End;
          #80:
               Begin
                 If (here < nAdmOp) Then
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
            1: initWord(w);
            2: showWord(w);
            3: letterCount(w);
            Else
              Begin
                key := chr(5);
                textcolor(lightred);
                WriteLn('You are leave the admin panel. Goodbye!');
                WriteLn('');
                WriteLn('Press any key to continue...');
                writeln('');
                WriteLn('<------------------------------------------');
              End;
          End;
          readkey;
        End;
  Until key = chr(5);
End;

End.
