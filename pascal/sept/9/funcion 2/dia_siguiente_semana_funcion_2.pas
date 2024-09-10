
Program dia_siguiente_semana_funcion_2;
//VERSION 2

Var 
  dia: string[15];
Function siguiente (dia:String): string;
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
End;
Begin
  write ('Dia: ');
  readln (dia);
  write (siguiente (dia));
End.
