
Program main;

{$unitpath ./units/}

Uses crt, orderUnit, baseUnitH7, searchUnit;

Const 
  nOp = 6;
  opciones: Array[1..nOp] Of string = ('Charge Students',
                                       'Show Students',
                                       'Order Students by LastName (SORT)',
                                       'SORT who started with "pe"'
                                       , 'Find One Student', 'Exit');

Var 
  i, here: integer;
  key: Char;
  students: studentsType;
  studentsFilter: Array Of String;
Begin
  here := 1;
  Repeat
    clrscr;
    textcolor(white);
    WriteLn('-----------------------------------------');
    WriteLn('|                                       |');
    WriteLn('|  Welcome to "Algoritmos Turno Noche"  |');
    WriteLn('|                                       |');
    WriteLn('-----------------------------------------');
    writeln('');
    textcolor(lightgray);
    WriteLn('Choose an option:');
    writeln('');

    For i:= 1 To nOp Do
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
                   here := nOp;
               End;
          #80:
               Begin
                 If (here < nOp) Then
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
            1: initCharge(students);
            2: showStudents(students);
            3: insertionSort(students);
            4: filterStudentsPe(students, studentsFilter);
            5: findStudent(students);
            Else
              Begin
                key := chr(5);
                textcolor(green);
                WriteLn('Thanks. Goodbye!');
                writeln('');
                WriteLn('<------------------------------------------');
              End;
          End;
          readkey;
        End;
  Until key = chr(5);
End.
