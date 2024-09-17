
Program dia_siguiente_semana_procedimiento;

Uses 
crt;

Var 
  dia: string [15];
  dia_sig: string;
Procedure siguiente;
Begin
  write ('Ingrese dia: ');
  readln (dia);
  Case dia Of 
    'lunes': dia_sig := 'martes';
    'martes': dia_sig := 'miercoles';
    'miercoles': dia_sig := 'jueves';
    'jueves': dia_sig := 'viernes';
    'viernes': dia_sig := 'sabado';
    'sabado': dia_sig := 'domingo';
    'domingo': dia_sig := 'lunes';

  End;
End;
Begin
  siguiente();
  write ('El dia siguiente al ', dia, ' es el: ', dia_sig);
  readkey;
End.
