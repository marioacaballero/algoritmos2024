
Unit unit_human;

Interface
Procedure human_init();

Type 
  typeData = 0..1;
  human = array[1..10] Of typeData;

Var 
  i: Integer;
  data: typeData;
  humanArray: human;

Implementation

Procedure human_init();
Begin
  For i:= 1
      To 10 Do
    Begin
      Write('ingrese valor ');
      ReadLn(data);
      humanArray[i] := data;
    End;

  WriteLn('individuo');

  For i:= 1
      To 10 Do
    Begin
      Write(humanArray[i]);
    End;

End;


End.
