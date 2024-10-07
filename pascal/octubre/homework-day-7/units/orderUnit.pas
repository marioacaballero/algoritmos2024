
Unit orderUnit;


Interface

{$unitpath ./}

Uses baseUnitH7;

Procedure insertionSort(Var students: studentsType);
Procedure bubbleSort(Var students: studentsFilterType);

Implementation
Procedure insertionSort(Var students: studentsType);

Var i, j: byte;
  aux: string;
Begin
  For i:= 2 To nStudents Do
    Begin
      aux := students[i];
      j := i - 1;
      While (j > 0) And (students[j] > aux) Do
        Begin
          students[j + 1] := students[j];
          Dec(j);
        End;
      students[j + 1] := aux;
    End;

  WriteLn('Students ordered successfully, press any key to continue...');
End;

Procedure bubbleSort(Var students: studentsFilterType);

Var i, j: byte;
  aux: string;
Begin
  For i:= 1 To Length(students) - 1 Do
    Begin
      For j:= 1 To Length(students) - i Do
        Begin
          If (students[j] > students[j + 1]) Then
            Begin
              aux := students[j];
              students[j] := students[j + 1];
              students[j + 1] := aux;
            End;
        End;
    End;

  WriteLn('Students ordered successfully, press any key to continue...');
End;

End.
