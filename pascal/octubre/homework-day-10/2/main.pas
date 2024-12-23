
Program main;

Uses crt, unithm11;

Const 
  nOp = 6;
  opciones: Array[1..nOp] Of string = ('Cargar estudiantes',
                                 'Mostrar estudiantes ordenados alfabeticamente'
                                       , 'Mostrar estudiante de mayor nota',
                                       'Mostrar estudiante de menor nota',
                                       'Buscar persona', 'Exit');

Var 
  i, here, pos: integer;
  key: Char;
  students: type_students;
  found: boolean;
Begin
  here := 1;
  Repeat
    clrscr;
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
            1: init(students);
            2:
               Begin
                 bubbleSortName(students);
                 show(students);
               End;
            3:
               Begin
                 bubbleSortRate(students);
                 WriteLn('Estudiante con mayor nota: ', students[n].name);
               End;
            4:
               Begin
                 bubbleSortRate(students);
                 WriteLn('Estudiante con menor nota: ', students[1].name);
               End;
            5:
               Begin
                 binarySearchPeople(students, 'Laura Suarez', found, pos);
                 If found Then
                   Begin
                     writeln('Laura Suarez obtuvo ', students[pos].rate,
                             ' puntos');
                   End
                 Else
                   Begin
                     writeln('Laura Suarez no encontrada');
                   End;
               End;
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
