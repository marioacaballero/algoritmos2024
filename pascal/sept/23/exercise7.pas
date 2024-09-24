
Program exercise7;

Uses unitVectorBase, crt, unit7;

Const 
  nOp = 6;
  opciones: Array[1..nOp] Of string = ('Init', 'Charge', 'Show', 'Min',
                                       'Ask repeats', 'Exit');

Var 
  v: vector;
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
            2: charge(v);
            3: show(v);
            4: minValue(v);
            5: askTotal(v);
            Else
              key := chr(5);
          End;
          readkey;
        End;
  Until key = chr(5);
End.
