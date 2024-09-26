
Program main;

{$unitpath ../}

Uses unitVectorBaseTp, crt, unit13ab;

Const 
  nOp = 8;
  opciones: Array[1..nOp] Of string = ('Init v1', 'Charge v1', 'Show v1',
                                       'Init v2', 'Charge v2', 'Show v2',
                                       'Add v1 + v2',
                                       'Exit');

Var 
  v1, v2, v3: vector;
  n, m, i, here: integer;
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
            1:
               Begin
                 Write('Enter the size of the vector: ');
                 ReadLn(n);
                 SetLength(v1, n);
                 init(n, v1);
               End;
            2: charge(n, v1);
            3: show(n, v1);
            4:
               Begin
                 Write('Enter the size of the vector: ');
                 ReadLn(m);
                 SetLength(v2, m);
                 init(m, v2);
               End;
            5: charge(m, v2);
            6: show(m, v2);
            7:
               Begin
                 SetLength(v3, n + m);
                 addVectors(n, m, v1, v2, v3);
               End;
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
