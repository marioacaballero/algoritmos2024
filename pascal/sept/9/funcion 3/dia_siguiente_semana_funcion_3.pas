
Program dia_siguiente_semana_funcion_3;
//VERSION 3

Var 
  dia: string[15];
Function siguiente (dia:String): string;
Begin
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
