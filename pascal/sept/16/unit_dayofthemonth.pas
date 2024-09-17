
// Crear una unit que contenga un procedimiento que, dado un numero de 1..365 devuelva el dia y mes que representa dicho número.

Unit unit_dayofthemonth;

Interface

Procedure DiaMes(dia: integer; Var mes: String; Var day: integer);

Implementation

Procedure DiaMes(dia: integer; Var mes: String; Var day: integer);
Begin
  Case dia Of 
    1..31: mes := 'Enero';
    32..59: mes := 'Febrero';
    60..90: mes := 'Marzo';
    91..120: mes := 'Abril';
    121..151: mes := 'Mayo';
    152..181: mes := 'Junio';
    182..212: mes := 'Julio';
    213..243: mes := 'Agosto';
    244..273: mes := 'Septiembre';
    274..304: mes := 'Octubre';
    305..334: mes := 'Noviembre';
    335..365: mes := 'Diciembre';
  End;

  Case mes Of 
    'Febrero': day := dia - 31;
    'Marzo': day := dia - 59;
    'Abril': day := dia - 90;
    'Mayo': day := dia - 120;
    'Junio': day := dia - 151;
    'Julio': day := dia - 181;
    'Agosto': day := dia - 212;
    'Septiembre': day := dia - 243;
    'Octubre': day := dia - 273;
    'Noviembre': day := dia - 304;
    'Diciembre': day := dia - 334;
  End;

End;

End.
