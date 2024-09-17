
Program dia_siguiente_semana_procedimiento;

Uses 
crt;

Var 
  dia: string ;
  dia_siguiente: string;
Procedure siguiente (di:String; Var dia_sig:String);
Begin
  Case di Of 
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
  write ('Dia: ');
  readln (dia);
  siguiente (dia_siguiente, dia);
  write ('El dia siguiente al ', dia, ' es el: ', dia_siguiente);
  readkey;
End.
