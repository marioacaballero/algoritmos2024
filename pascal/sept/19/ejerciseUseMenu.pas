
Program ejerciseUseMenu;

Uses unitVectorBase, unitLogicBuss, crt;

Const 
  opciones: Array[1..n] Of string = ('Init', 'Charge', 'Show',
                                     'Total', 'Ask',
                                     'Move last to first', 'Exit');

Var 
  v: vector;
  key: Char;
  i, here: integer;
Begin
  here := 1;
  Repeat
    clrscr;
    For i:= 1 To n Do
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
                   here := n;
               End;
          #80:
               Begin
                 If (here < n) Then
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
            4: total(v);
            5: ask(v);
            6: reorder(v);
            Else
              key := chr(5);
          End;
          readkey;
        End;
  Until key = chr(5);
End.
