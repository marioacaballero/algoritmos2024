
Program main;

{$unitpath ../}

Uses unitVectorBaseTp, crt, unit17Bus;

Const 
  nOp = 7;
  opciones: Array[1..nOp] Of string = ('Init', 'Charge All', 'Show All',
                                       'Charge One', 'Show One', 'Delete One',
                                       'Exit');

Var 
  v: vector;
  n, i, here, position: integer;
  key: Char;
  name: string;
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
                 SetLength(v, n);
                 init(n, v);
               End;
            2: charge(n, v);
            3: showAll(n, v);
            4: chargeOnePosition(v);
            5: showOnePosition(v);
            6: deleteOnePosition(v);
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
