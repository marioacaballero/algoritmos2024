
Program dia_siguiente_semana_procedimiento;

Uses 
crt;

Var 
  dia: string [15];
  dia_siguiente: string;
Procedure siguiente (di:String; Var dia_sig:String);
Begin
  Case di Of 
    'lunes': dia_siguiente := 'martes';
    'martes': dia_siguiente := 'miercoles';
    'miercoles': dia_siguiente := 'jueves';
    'jueves': dia_siguiente := 'viernes';
    'viernes': dia_siguiente := 'sabado';

    'sabado': dia_siguiente := 'domingo';
    'domingo': dia_siguiente := 'lunes';
  End;
End;
Begin
  write ('Dia: ');
  readln (dia);
  siguiente (dia,dia_siguiente);
  write ('El dia siguiente al ', dia, ' es el : ', dia_siguiente);
  readkey;
End.
