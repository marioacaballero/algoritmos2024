
Program ejerciseUseMenu;

Uses unitVectorBase, unitLogicBuss;

Var 
  v: vector;
  op: integer;
Begin
  Repeat
    WriteLn('1. Init');
    WriteLn('2. Charge');
    WriteLn('3. Show');
    WriteLn('4. Total');
    WriteLn('5. Ask');
    WriteLn('6. Move last to first');
    WriteLn('7. Exit');
    Write('Option: ');
    ReadLn(op);
    Case op Of 
      1: init(v);
      2: charge(v);
      3: show(v);
      4: total(v);
      5: ask(v);
      6: reorder(v);
      Else
        WriteLn('Invalid option');
    End;
  Until op = 7;
End.
