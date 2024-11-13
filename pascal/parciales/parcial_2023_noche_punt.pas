
Program parcial_2023_noche_punt;

Type 
  T_punt = ^T_nodo;
  T_nodo = Record
    info: T_dato;
    sig: T_punt;
  End;

  T_Lista = Record
    cab, act: T_punt;
    tam: word;
  End;

Var 
  L: T_Lista;
  dir: T_punt;
Begin
  If (L.tam = 3) Then
    Begin
      dir := L.cab^.sig^.sig;
      Dispose(dir);
      dir := L.cab^.sig;
      Dispose(dir);
      dir := L.cab;
      Dispose(dir);
    End
  Else
    Begin
      L.act := L.cab;
      dir := L.act^.sig^.sig;
      While (dir <> Nil) Do
        Begin
          L.act := L.act^.sig;
          dir := L.act^.sig^.sig;
        End;
      Dispose(dir);
      dir := L.act^.sig;
      Dispose(dir);
      dir := L.act;
      Dispose(dir);
    End;
End.
