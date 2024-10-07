
Unit baseUnitH7;

Interface

Uses sysutils, crt;

Const 
  nStudents = 6;

Type 
  studentsType = Array[1..nStudents] Of string;
  studentsFilterType = Array Of String;

Procedure initCharge (Var students: studentsType);
Procedure showStudents(Var students: studentsType);
Procedure showStudentsFilter(Var students: studentsFilterType);

Implementation
Procedure initCharge (Var students: studentsType);

Var i: byte;
  name, lastName: string;
Begin
  For i:= 1 To nStudents Do
    Begin
      clrscr;
      WriteLn('Student ', i);
      Writeln('');
      Write('name: ');
      textcolor(white);
      ReadLn(name);
      textcolor(green);
      Writeln('');
      Write('lastname: ');
      textcolor(white);
      ReadLn(lastName);
      students[i] := lowercase(lastName) + ' ' + lowercase(name);
      textcolor(green);
    End;
  clrscr;
  WriteLn('Students charged successfully, press any key to continue...');
End;

Procedure showStudents(Var students: studentsType);

Var i: byte;
Begin
  writeLn('Students list');
  WriteLn('');
  textcolor(white);
  For i:= 1 To nStudents Do
    WriteLn(i, '- ', students[i]);

  textcolor(green);
  writeln('');
  WriteLn('press any key to continue...');
End;

Procedure showStudentsFilter(Var students: studentsFilterType);

Var i: byte;
Begin
  writeLn('Students filter with "Pe" list');
  WriteLn('');
  textcolor(white);
  For i:= 1 To Length(students) Do
    WriteLn(i, '- ', students[i]);

  textcolor(green);
  writeln('');
  WriteLn('press any key to continue...');
End;

End.
