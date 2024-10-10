
Program main;

Uses crt, unithm10;

Const 
  nOp = 6;
  opciones: Array[1..nOp] Of string = ('Cargar polizas',
                                       'Personas con 70 años cumplidos',
                                       'Personas con cuota menor a $30',
                                       'Personas con monto mayor a $100'
                                       , 'Buscar persona', 'Exit');

Var 
  i, here, pos: integer;
  key: Char;
  polizas: type_polizas;
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
            1: init(polizas);
            2: showPeopleWith70YearsOld(polizas);
            3: showPeopleWithLessThan30Price(polizas);
            4: showPeopleWithMoreThan100Price(polizas);
            5:
               Begin
                 binarySearchPeople(polizas, 'Pedro Fernandez', found, pos);
                 If found Then
                   Begin
                     writeln('Pedro Fernandez encontrado en la posicion ', pos);
                   End
                 Else
                   Begin
                     writeln('Pedro Fernandez no encontrado');
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
