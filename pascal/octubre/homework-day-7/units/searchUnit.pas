
Unit searchUnit;

Interface

Uses baseUnitH7, orderUnit, crt, sysutils;

Procedure findStudent (Var students:studentsType);
Procedure filterStudentsPe (students: studentsType; Var studentsFilter:
                            studentsFilterType);

Implementation
Function b_secuencial (V:studentsType; buscado:String): Boolean;

Var 
  i: byte;
  pos: integer;
Begin
  i := 1;
  pos := -1;
  While (i <= nStudents) And (v[i] <> buscado) Do
    i := i+1;
  If i > nStudents Then
    pos := 0
  Else
    pos := i;

  If (pos = -1) Then
    b_secuencial := false
  Else
    b_secuencial := true;
End;

Procedure findStudent (Var students:studentsType);

Var student, name, lastName: String;
Begin
  student := '';
  WriteLn('Find one the student: ');
  Writeln('');
  Write('name: ');
  textcolor(white);
  ReadLn(name);
  textcolor(green);
  Writeln('');
  Write('lastname: ');
  textcolor(white);
  ReadLn(lastName);
  student := lowercase(lastName) + ' ' + lowercase(name);
  textcolor(green);
  WriteLn('');

  If (b_secuencial(students, student)) Then
    writeln('The student is in the board')
  Else
    writeln('The student is not in the board');

  writeln('');
  WriteLn('press any key to continue...');
End;

Procedure filterStudentsPe (students: studentsType; Var studentsFilter:
                            studentsFilterType);

Var i, j: byte;
  positions: string;

Begin
  j := 0;
  For i:= 1 To nStudents Do
    Begin
      If (students[i][1] = 'p') And (students[i][2] = 'e') Then
        Begin
          Inc(j);
          positions := positions + IntToStr(i) + ' ';
        End;
    End;

  SetLength(studentsFilter, j);

  j := 0;
  For i:= 1 To Length(positions) Do
    Begin
      If (positions[i] <> ' ') Then
        Begin
          Inc(j);
          studentsFilter[j] := students[StrToInt(positions[i])];
        End
    End;

  bubbleSort(studentsFilter);
  showStudentsFilter(studentsFilter);
End;

End.
