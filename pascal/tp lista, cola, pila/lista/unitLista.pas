
Unit unitLista;

Interface

Type 
  T_dato = Record
    nombre: String[50];
    edad: byte;
    edo_civil: string[20];
    direccion: string[50];
  End;

  T_puntero = ^T_nodo;

  T_nodo = Record
    info: T_dato;
    sig: T_puntero;
  End;

  T_lista = Record
    cab, act: T_puntero;
    tam: byte;
  End;

Procedure crear(Var l: T_lista);
Procedure agregar(Var l: T_lista; x: T_dato);
Procedure siguiente(Var l: T_lista);
Procedure eliminar(Var l: T_lista; buscado: String; Var x: T_data);
Procedure primero(l: T_lista);
Function fin(l: T_lista): Boolean;
Function lista_llena(l: T_lista): Boolean;
Function lista_vacia(l: T_lista): Boolean;
Procedure recuperar(l: T_lista; Var e: T_dato);

Implementation
Procedure crear(Var l: T_lista);
Begin
  l.cab := Nil;
  l.tam := 0;
End;

Procedure agregar(Var l: T_lista; x: T_dato);

Var 
  dir, ant: T_puntero;
Begin
  new(dir);
  dir^.info := x;

  If (l.cab = Nil) Or (l.cab^.info.nombre > x.nombre) Then
    Begin
      dir^.sig := l.cab;
      l.cab := dir;
    End
  Else
    Begin
      ant := l.cab;
      l.act := l.cab^.sig;
      While (l.act <> Nil) And (l.act^.info.nombre < x.nombre ) Do
        Begin
          ant := l.act;
          l.act := l.act^.sig;
        End;
      dir^.sig := l.act;
      ant^.sig := dir;
    End;
  inc(l.tam);
End;

Procedure siguiente(Var l: T_lista);
Begin
  l.act := l.act^.sig;
End;

Procedure eliminar(Var l: T_lista; buscado: String; Var x: T_data);

Var 
  dir, ant: T_puntero;
Begin
  If (l.cab^.info.nombre = buscado) Then
    Begin
      x := l.cab^.info;
      dir := l.cab;
      l.cab := l.cab^.sig;
      dispose(dir);
    End
  Else
    Begin
      ant := l.cab;
      l.act := l.cab^.sig;
      While (l.act^.info.nombre <> buscado) Do
        Begin
          ant := l.act;
          l.act := l.act^.sig;
        End;
      x := l.act^.info;
      ant^.sig := l.act^.sig;
      Dispose(l.act);
    End;
  dec(l.tam);
End;

Procedure primero(l: T_lista);
Begin
  l.act := l.cab;
End;

Function fin(l: T_lista): Boolean;
Begin
  fin := l.act = Nil;
End;

Function lista_llena(l: T_lista): Boolean;
Begin
  lista_llena := getheapstatus.totalfree < sizeof(T_nodo);
End;

Function lista_vacia(l: T_lista): Boolean;
Begin
  lista_vacia := l.tam = 0;
End;

Procedure recuperar(l: T_lista; Var e: T_dato);
Begin
  e := l.act^.info;
End;
End.
