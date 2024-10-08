
Program main;

{$unitpath ../}

Uses crt, baseUnitMatrix, addUnit7;

Const 
  nOp = 6;
  opciones: Array[1..nOp] Of string = ('Init Matrix', 'Charge Matrix',
                                       'Show Matrix', 'Add diagonal',
                                       'Add triangular matrix', 'Exit');

Var 
  i, here: integer;
  key: Char;
  matrix: matrixType;
Begin
  here := 1;
  Repeat
    clrscr;
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
            1: initMatrix(matrix);
            2: chargeMatrix(matrix);
            3: showMatrix(matrix);
            4: addDiagonal(matrix);
            5: addTriangle(matrix);
            Else
              Begin
                key := chr(5);
                textcolor(green);
                WriteLn('Thanks. Goodbye!');
                writeln('');
                WriteLn('<------------------------------------------');
              End;
          End;
          readkey;
        End;
  Until key = chr(5);
End.
