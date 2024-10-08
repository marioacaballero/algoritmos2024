
Unit baseUnitMatrix;

Interface

Uses crt;

Const 
  n = 3;
  m = 3;

Type 
  dataType = integer;
  matrixType = Array [1..n, 1..m] Of dataType;


Procedure initMatrix (Var matrix: matrixType);
Procedure chargeMatrix (Var matrix: matrixType);
Procedure showMatrix(Var matrix: matrixType);

Implementation
Procedure initMatrix (Var matrix: matrixType);

Var 
  i, j: byte;
Begin
  For i:= 1 To n Do
    For j:= 1 To m Do
      matrix[i, j] := 0;

  WriteLn('The matrix has been initialized');
  WriteLn('');
  WriteLn('press any key to continue...');
End;

Procedure chargeMatrix (Var matrix: matrixType);

Var 
  i, j: byte;
  data: integer;
Begin
  For i:= 1 To n Do
    For j:= 1 To m Do
      Begin
        gotoxy(5*j, i);
        TextColor(white);
        ReadLn(data);
        matrix[i, j] := data;
      End;
  textcolor(green);
  WriteLn('');
  WriteLn('The matrix has been charged');
  WriteLn('');
  WriteLn('press any key to continue...');
End;

Procedure showMatrix(Var matrix: matrixType);

Var 
  i, j: byte;
Begin
  For i:= 1 To n Do
    Begin
      For j:= 1 To m Do
        Begin
          TextColor(white);
          gotoxy(5*j, i);
          Write(matrix[i, j]);
        End;
    End;
  textcolor(green);
  WriteLn('');
  WriteLn('press any key to continue...');
End;

End.
