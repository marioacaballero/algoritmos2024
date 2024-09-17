
Unit unit_saveScreen;

Interface
Procedure escribir_titulo(titulo: String);
Procedure protector_pantalla;
Procedure square(x, y: Integer);


Implementation

Uses crt;

Procedure square(x, y: Integer);

Var 
  i, j: integer;
Begin
  For i := 0 To y Do
    Begin
      gotoxy(x+i,3);
      write('.');
      gotoxy(x+i,y+3);
      write('.');
    End;
  For j := 0 To y-1 Do
    Begin
      gotoxy(x,3+j);
      writeln('.');
      gotoxy(x+y,3+j);
      writeln('.');
    End;
End;

Procedure escribir_titulo(titulo: String);

Var 
  posicion_inicial: integer;
Begin
  posicion_inicial := 60 - (length(titulo) Div 2);
  gotoxy(posicion_inicial,1);
  writeln(titulo);
  square(posicion_inicial, length(titulo));
End;

Procedure protector_pantalla;

Var i,j: integer;
Begin
  clrscr;
  Repeat
    textcolor(random(15));
    i := RANDOM(119)+1;
    j := RANDOM(29)+1;
    gotoxy(i,j);
    write('*');
  Until keypressed;
  normvideo;
  clrscr;
End;

End.
