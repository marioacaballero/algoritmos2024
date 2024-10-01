
Program homework;

Uses crt, validationUnit;

Var 
  dni: string;
  key: Char;

Begin
  Repeat
    clrscr;
    Textcolor(white);
    WriteLn('---->   DNI Validator   <----');
    WriteLn('');
    Write('Enter your number: ');
    ReadLn(dni);
    validateDni(dni);
    WriteLn('');
    WriteLn('Press ENTER to validate another number or ESC to exit');
    WriteLn('');
    key := ReadKey;
  Until key = #27;


End.
