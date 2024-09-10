
Program dia_siguiente_semana_funcion_4;
// VERSION 4

Var 
  dia: string[15];
Function siguiente (): string;
Begin
  write ('Dia: ');
  readln (dia);
  Case dia Of 
    'lunes': siguiente := 'martes';
    'martes': siguiente := 'miercoles';
    'miercoles': siguiente := 'jueves';
    'jueves': siguiente := 'viernes';
    'viernes': siguiente := 'sabado';
    'sabado': siguiente := 'domingo';
    'domingo': siguiente := 'lunes';
  End;
  write (siguiente ());
End;
Begin
  siguiente();
End.
