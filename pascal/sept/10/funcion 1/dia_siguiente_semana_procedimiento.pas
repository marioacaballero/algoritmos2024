
Program dia_siguiente_semana_procedimiento;

Uses 
crt;

Var 
  dia,dia_siguiente: string[15];
Procedure siguiente (di:String; Var dia_sig:String);
Begin
  Case di Of 
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
  siguiente (dia,dia_siguiente);
  write ('El dia siguiente al ', dia, ' es el: ', dia_sig);
  readkey;
End.
