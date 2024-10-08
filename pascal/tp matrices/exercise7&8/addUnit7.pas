
Unit addUnit7;

Interface

{$unitpath ../}

Uses baseUnitMatrix, crt;

Procedure addDiagonal(Var matrix: matrixType);
Procedure addTriangle(Var matrix: matrixType);

Implementation
Function addDiagonalFunction(matrix: matrixType): integer;

Var 
  i: integer;
Begin
  addDiagonalFunction := 0;
  For i := 1 To n Do
    addDiagonalFunction := addDiagonalFunction + matrix[i, i];
End;

Function addTriangleMatrix(matrix: matrixType): integer;

Var 
  i, j: integer;
Begin
  addTriangleMatrix := 0;
  For i := 1 To n Do
    For j := 1 To m Do
      If j > i Then
        addTriangleMatrix := addTriangleMatrix + matrix[i, j];
End;

Procedure addDiagonal(Var matrix: matrixType);
Begin
  Write('The sum of the diagonal is: ');
  textcolor(white);
  Write(addDiagonalFunction(matrix));
  textcolor(green);
  WriteLn('');
  WriteLn('press any key to continue...');
End;

Procedure addTriangle(Var matrix: matrixType);
Begin
  Write('The sum of the triangular matrix is: ');
  textcolor(white);
  write(addTriangleMatrix(matrix));
  textcolor(green);
  WriteLn('');
  WriteLn('press any key to continue...');
End;

End.
