
Program parcial_2023_tarde_arch;

Const 
  path = './parcial_2023_tarde.dat';

Type 
  T_Dato = Record
    dni: string[8];
    scoring: byte;
  End;

  T_Arch = File Of T_Dato;

Var 
  f: T_Arch;
  xf: T_Dato;
  dni: string;
  scoring: Byte;
  pos: Cardinal;
Begin
  pos := -1;
  Assign(f, path);
  Reset(f);
  write('Ingrese DNI: ');
  readln(dni);
  write('Ingrese Scoring:');
  ReadLn(scoring);
  While (Not Eof(f)) And (pos = -1) Do
    Begin
      read(f, xf);
      If (xf.dni = dni) Then
        pos := FilePos(f) - 1;
    End;
  If (pos <> -1) Then
    Begin
      Seek(f, pos);
      xf.scoring := scoring;
      Write(f, xf);
    End
  Else
    Begin
      pos := FileSize(f);
      Seek(f, pos);
      xf.dni := dni;
      xf.scoring := scoring;
      Write(f, xf);
    End;
  Close(f);
End.
