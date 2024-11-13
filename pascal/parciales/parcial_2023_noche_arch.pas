
Program parcial_2023_noche_arch;

Const 
  ruta = './parcial2023_noche.dat';

Type 
  T_Dato = Record
    legajo: string[8];
    nota: 1..10;
  End;

  T_Archivo = File Of T_Dato;

Var 
  f: T_Archivo;
  data: T_Dato;
  pos: Cardinal;
  leg: string;
  nota: byte;
Begin
  Assign(f, ruta);
  Reset(f);
  pos := -1;
  Write('Ingrese legajo: ');
  ReadLn(leg);
  Write('Ingrese nota: ');
  ReadLn(nota);
  While (Not eof(f)) And (pos = -1) Do
    Begin
      Read(f, data);
      If (data.legajo = leg) Then
        pos := FilePos(f);
    End;
  If (pos <> -1) Then
    Begin
      Seek(f, pos);
      // esta  linea del read se  puede obviar?
      Read(f, data);
      data.nota := (data.nota + nota) / 2;
      Write(f, data);
    End
  Else
    Begin
      data.legajo := leg;
      data.nota := nota;
      pos := FileSize(f) - 1;
      Seek(f, pos);
      Write(f, data);
    End;

  Close(f);
End.
