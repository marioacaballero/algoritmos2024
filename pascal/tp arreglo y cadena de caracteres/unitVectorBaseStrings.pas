
Unit unitVectorBaseStrings;

Interface

Procedure init(Var v: String);
Procedure show(v: String);

Implementation
Procedure init(Var v: String);
Begin
  WriteLn('Enter the text (note: you need to finalice with a point): ');
  ReadLn(v);
  WriteLn('Initialization complete')
End;

Procedure show(v: String);
Begin
  WriteLn(v)
End;

End.
