
Program dayOfTheMonth;

Uses unit_dayofthemonth;

Var 
  dia: integer;
  day: integer;
  month: String;

Begin
  writeln('Ingrese el día del año');
  readln(dia);

  DiaMes(dia, month, day);
  writeln('El día ', dia, ' corresponde al dia ', day, ' del mes de ', month);
End.
