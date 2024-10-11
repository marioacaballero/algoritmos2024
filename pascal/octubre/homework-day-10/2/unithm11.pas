
Unit unithm11;

Interface

Uses crt;

Const 
  n = 30;

Type 
  type_student = Record
    id: byte;
    name: string[100];
    rate: byte;
  End;

  type_students = Array[1..n] Of type_student;

Procedure init (Var students: type_students);
Procedure show(students: type_students);
Procedure bubbleSortName(Var students: type_students);
Procedure bubbleSortRate(Var students: type_students);
Procedure binarySearchPeople(students: type_students; people:String; Var found:
                             boolean; Var pos: integer);

Implementation

Procedure init (Var students: type_students);

Var i: byte;
  student: type_student;

Begin
  For i:= 1 To n Do
    Begin
      clrscr;
      Writeln('Ingrese los siguientes datos del alumno ', i, ':');
      Writeln('');
      Write('Legajo: ');
      ReadLn(student.id);
      Write('Nombre y apellido: ');
      ReadLn(student.name);
      Write('Nota: ');
      ReadLn(student.rate);

      students[i] := student;
    End;
End;

Procedure show(students: type_students);

Var i: byte;

Begin
  Writeln('Alumnos: ');
  For i:= 1 To n Do
    Begin
      Writeln(students[i].id, ' ', students[i].name, ' ', students[i].rate);
    End;
End;

Procedure bubbleSortName(Var students: type_students);

Var i, j: byte;
  aux: type_student;
Begin
  For i:= 1 To n-1 Do
    For j:= 1 To n-i Do
      If students[j].name > students[j+1].name Then
        Begin
          aux := students[j];
          students[j] := students[j+1];
          students[j+1] := aux;
        End;
End;

Procedure bubbleSortRate(Var students: type_students);

Var i, j: byte;
  aux: type_student;
Begin
  For i:= 1 To n-1 Do
    For j:= 1 To n-i Do
      If students[j].rate > students[j+1].rate Then
        Begin
          aux := students[j];
          students[j] := students[j+1];
          students[j+1] := aux;
        End;
End;

Procedure binarySearchPeople(students: type_students; people:String; Var
                             found: boolean; Var pos: integer);

Var low, high, middle: byte;
Begin
  low := 1;
  high := n;
  found := false;
  While (low <= high) And Not found Do
    Begin
      middle := (low + high) Div 2;
      If students[middle].name = people Then
        Begin
          found := true;
          pos := middle;
        End
      Else
        If students[middle].name < people Then
          low := middle + 1
      Else
        high := middle - 1;
    End;
End;

End.
